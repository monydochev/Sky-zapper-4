import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../core/l10n.dart';
import '../../data/models/category.dart';
import '../../data/models/disease.dart';
import '../../data/models/frequency.dart';
import '../../data/repositories/category_repository.dart';
import '../../data/repositories/disease_repository.dart';
import '../../data/repositories/frequency_repository.dart';
import '../../data/repositories/programs_groups_repository.dart';
import '../../providers/auth_provider.dart';
import '../../providers/locale_provider.dart';

// --- Simple Notifiers for editor state ---

class _NullableIntNotifier extends Notifier<int?> {
  @override
  int? build() => null;
  void set(int? value) => state = value;
}

class _NullableDiseaseNotifier extends Notifier<Disease?> {
  @override
  Disease? build() => null;
  void set(Disease? value) => state = value;
}

// --- Editor state providers ---

final _editorCategoriesProvider = FutureProvider<List<Category>>((ref) async {
  final authState = ref.watch(authProvider);
  final repo = CategoryRepository();
  if (authState.currentUser != null) {
    return repo.getForUser(authState.currentUser!.id);
  }
  return repo.getAll();
});

final _editorSelectedCategoryIdProvider =
    NotifierProvider<_NullableIntNotifier, int?>(_NullableIntNotifier.new);

final _editorDiseasesProvider = FutureProvider<List<Disease>>((ref) async {
  final categoryId = ref.watch(_editorSelectedCategoryIdProvider);
  if (categoryId == null) return [];
  final repo = DiseaseRepository();
  return repo.getByCategory(categoryId);
});

final _editorSelectedDiseaseProvider =
    NotifierProvider<_NullableDiseaseNotifier, Disease?>(
        _NullableDiseaseNotifier.new);

final _editorFrequenciesProvider = FutureProvider<List<Frequency>>((ref) async {
  final disease = ref.watch(_editorSelectedDiseaseProvider);
  if (disease == null) return [];
  final repo = FrequencyRepository();
  return repo.getByDiseaseId(disease.id);
});

class EditorScreen extends ConsumerStatefulWidget {
  const EditorScreen({super.key});

  @override
  ConsumerState<EditorScreen> createState() => _EditorScreenState();
}

class _EditorScreenState extends ConsumerState<EditorScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final locale = ref.watch(localeProvider);

    return Column(
      children: [
        TabBar(
          controller: _tabController,
          tabs: [
            Tab(text: L10n.tr('categories', locale)),
            Tab(text: L10n.tr('programs', locale)),
            Tab(text: L10n.tr('frequencies', locale)),
          ],
        ),
        Expanded(
          child: TabBarView(
            controller: _tabController,
            children: [
              _CategoriesEditor(locale: locale),
              _ProgramsEditor(locale: locale),
              _FrequenciesEditor(locale: locale),
            ],
          ),
        ),
      ],
    );
  }
}

// ============================================================================
// Categories Editor
// ============================================================================

class _CategoriesEditor extends ConsumerWidget {
  final String locale;

  const _CategoriesEditor({required this.locale});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final categoriesAsync = ref.watch(_editorCategoriesProvider);

    return Column(
      children: [
        // Toolbar
        Padding(
          padding: const EdgeInsets.all(8),
          child: Row(
            children: [
              FilledButton.tonalIcon(
                onPressed: () => _showCategoryDialog(context, ref, null),
                icon: const Icon(Icons.add, size: 18),
                label: Text(L10n.tr('new_category', locale)),
              ),
            ],
          ),
        ),
        const Divider(height: 1),
        Expanded(
          child: categoriesAsync.when(
            loading: () => const Center(child: CircularProgressIndicator()),
            error: (e, _) => Center(child: Text('Error: $e')),
            data: (categories) {
              return ListView.builder(
                itemCount: categories.length,
                itemBuilder: (context, index) {
                  final cat = categories[index];
                  return ListTile(
                    title: Text(cat.getName(locale)),
                    subtitle: Text(
                      '${cat.programCount} ${L10n.tr('programs', locale).toLowerCase()}',
                    ),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                          icon: const Icon(Icons.edit_outlined),
                          onPressed: () =>
                              _showCategoryDialog(context, ref, cat),
                        ),
                        if (cat.typeId > 0)
                          IconButton(
                            icon: const Icon(Icons.delete_outline),
                            onPressed: () =>
                                _confirmDeleteCategory(context, ref, cat),
                          ),
                      ],
                    ),
                    onTap: () {
                      ref
                          .read(_editorSelectedCategoryIdProvider.notifier)
                          .set(cat.id);
                    },
                  );
                },
              );
            },
          ),
        ),
      ],
    );
  }

  Future<void> _showCategoryDialog(
    BuildContext context,
    WidgetRef ref,
    Category? existing,
  ) async {
    final nameBgCtrl =
        TextEditingController(text: existing?.categoryNameBG ?? '');
    final nameEnCtrl =
        TextEditingController(text: existing?.categoryNameEN ?? '');

    final result = await showDialog<bool>(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text(existing == null
            ? L10n.tr('new_category', locale)
            : L10n.tr('editor', locale)),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: nameBgCtrl,
              decoration: InputDecoration(
                labelText: L10n.tr('name_bg', locale),
              ),
            ),
            const SizedBox(height: 12),
            TextField(
              controller: nameEnCtrl,
              decoration: InputDecoration(
                labelText: L10n.tr('name_en', locale),
              ),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx, false),
            child: Text(L10n.tr('cancel', locale)),
          ),
          FilledButton(
            onPressed: () => Navigator.pop(ctx, true),
            child: Text(L10n.tr('save', locale)),
          ),
        ],
      ),
    );

    if (result == true) {
      final repo = CategoryRepository();
      final authState = ref.read(authProvider);

      if (existing == null) {
        // Create new
        await repo.insert(Category(
          id: 0,
          categoryNameBG: nameBgCtrl.text,
          categoryNameEN: nameEnCtrl.text,
          typeId: 1,
          userId: authState.currentUser?.id,
        ));
      } else {
        // Update
        await repo.update(Category(
          id: existing.id,
          categoryNameBG: nameBgCtrl.text,
          categoryNameEN: nameEnCtrl.text,
          favorite: existing.favorite,
          repeat: existing.repeat,
          pauseProgram: existing.pauseProgram,
          pauseRepeatCycle: existing.pauseRepeatCycle,
          userId: existing.userId,
          sort: existing.sort,
          typeId: existing.typeId,
        ));
      }

      ref.invalidate(_editorCategoriesProvider);
    }
  }

  Future<void> _confirmDeleteCategory(
    BuildContext context,
    WidgetRef ref,
    Category category,
  ) async {
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text(L10n.tr('delete', locale)),
        content: Text(L10n.tr('confirm_delete', locale)),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx, false),
            child: Text(L10n.tr('cancel', locale)),
          ),
          FilledButton(
            onPressed: () => Navigator.pop(ctx, true),
            style: FilledButton.styleFrom(
              backgroundColor: Theme.of(context).colorScheme.error,
            ),
            child: Text(L10n.tr('delete', locale)),
          ),
        ],
      ),
    );

    if (confirmed == true) {
      final repo = CategoryRepository();
      await repo.delete(category.id);
      ref.invalidate(_editorCategoriesProvider);
    }
  }
}

// ============================================================================
// Programs Editor
// ============================================================================

class _ProgramsEditor extends ConsumerWidget {
  final String locale;

  const _ProgramsEditor({required this.locale});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final categoriesAsync = ref.watch(_editorCategoriesProvider);
    final selectedCategoryId = ref.watch(_editorSelectedCategoryIdProvider);
    final diseasesAsync = ref.watch(_editorDiseasesProvider);

    return Column(
      children: [
        // Category selector
        Padding(
          padding: const EdgeInsets.all(8),
          child: Row(
            children: [
              Expanded(
                child: categoriesAsync.when(
                  loading: () => const LinearProgressIndicator(),
                  error: (e, _) => Text('Error: $e'),
                  data: (categories) {
                    return DropdownButtonFormField<int>(
                      value: selectedCategoryId,
                      decoration: InputDecoration(
                        labelText: L10n.tr('categories', locale),
                        isDense: true,
                      ),
                      items: categories.map((cat) {
                        return DropdownMenuItem(
                          value: cat.id,
                          child: Text(cat.getName(locale)),
                        );
                      }).toList(),
                      onChanged: (id) {
                        ref
                            .read(
                                _editorSelectedCategoryIdProvider.notifier)
                            .set(id);
                        ref
                            .read(_editorSelectedDiseaseProvider.notifier)
                            .set(null);
                      },
                    );
                  },
                ),
              ),
              const SizedBox(width: 8),
              FilledButton.tonalIcon(
                onPressed: selectedCategoryId != null
                    ? () => _showProgramDialog(context, ref, null)
                    : null,
                icon: const Icon(Icons.add, size: 18),
                label: Text(L10n.tr('new_program', locale)),
              ),
            ],
          ),
        ),
        const Divider(height: 1),

        // Programs list
        Expanded(
          child: diseasesAsync.when(
            loading: () => const Center(child: CircularProgressIndicator()),
            error: (e, _) => Center(child: Text('Error: $e')),
            data: (diseases) {
              if (diseases.isEmpty) {
                return Center(
                  child: Text(L10n.tr('programs', locale)),
                );
              }
              return ListView.builder(
                itemCount: diseases.length,
                itemBuilder: (context, index) {
                  final disease = diseases[index];
                  return ListTile(
                    title: Text(disease.getName(locale)),
                    subtitle: disease.getDescription(locale).isNotEmpty
                        ? Text(
                            disease.getDescription(locale),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          )
                        : null,
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text('${disease.freqCount}'),
                        const SizedBox(width: 8),
                        IconButton(
                          icon: const Icon(Icons.edit_outlined),
                          onPressed: () =>
                              _showProgramDialog(context, ref, disease),
                        ),
                        IconButton(
                          icon: const Icon(Icons.link_off),
                          onPressed: () =>
                              _unlinkProgram(context, ref, disease),
                          tooltip: L10n.tr('unlink', locale),
                        ),
                      ],
                    ),
                    onTap: () {
                      ref
                          .read(_editorSelectedDiseaseProvider.notifier)
                          .set(disease);
                    },
                  );
                },
              );
            },
          ),
        ),

        // Link program bar
        if (selectedCategoryId != null)
          Padding(
            padding: const EdgeInsets.all(8),
            child: Row(
              children: [
                Expanded(
                  child: FilledButton.tonalIcon(
                    onPressed: () =>
                        _showLinkProgramDialog(context, ref),
                    icon: const Icon(Icons.link),
                    label: Text(L10n.tr('link', locale)),
                  ),
                ),
              ],
            ),
          ),
      ],
    );
  }

  Future<void> _showProgramDialog(
    BuildContext context,
    WidgetRef ref,
    Disease? existing,
  ) async {
    final nameBgCtrl = TextEditingController(text: existing?.nameBg ?? '');
    final nameEnCtrl = TextEditingController(text: existing?.nameEn ?? '');
    final descBgCtrl =
        TextEditingController(text: existing?.descriptionBg ?? '');
    final descEnCtrl =
        TextEditingController(text: existing?.descriptionEn ?? '');

    final result = await showDialog<bool>(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text(existing == null
            ? L10n.tr('new_program', locale)
            : L10n.tr('editor', locale)),
        content: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: nameBgCtrl,
                decoration: InputDecoration(
                  labelText: L10n.tr('name_bg', locale),
                ),
              ),
              const SizedBox(height: 12),
              TextField(
                controller: nameEnCtrl,
                decoration: InputDecoration(
                  labelText: L10n.tr('name_en', locale),
                ),
              ),
              const SizedBox(height: 12),
              TextField(
                controller: descBgCtrl,
                maxLines: 3,
                decoration: InputDecoration(
                  labelText: '${L10n.tr('description', locale)} (BG)',
                ),
              ),
              const SizedBox(height: 12),
              TextField(
                controller: descEnCtrl,
                maxLines: 3,
                decoration: InputDecoration(
                  labelText: '${L10n.tr('description', locale)} (EN)',
                ),
              ),
            ],
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx, false),
            child: Text(L10n.tr('cancel', locale)),
          ),
          FilledButton(
            onPressed: () => Navigator.pop(ctx, true),
            child: Text(L10n.tr('save', locale)),
          ),
        ],
      ),
    );

    if (result == true) {
      final repo = DiseaseRepository();
      final categoryId = ref.read(_editorSelectedCategoryIdProvider);

      if (existing == null) {
        // Create new
        final nextId = await repo.getNextId();
        final newDisease = Disease(
          id: nextId,
          nameBg: nameBgCtrl.text,
          nameEn: nameEnCtrl.text,
          descriptionBg: descBgCtrl.text,
          descriptionEn: descEnCtrl.text,
          categoryId: categoryId,
        );
        await repo.insert(newDisease);

        // Link to category
        if (categoryId != null) {
          final pgRepo = ProgramsGroupsRepository();
          await pgRepo.link(categoryId, nextId, 0);
        }
      } else {
        // Update
        await repo.update(Disease(
          id: existing.id,
          nameBg: nameBgCtrl.text,
          nameEn: nameEnCtrl.text,
          descriptionBg: descBgCtrl.text,
          descriptionEn: descEnCtrl.text,
          favorite: existing.favorite,
          categoryId: existing.categoryId,
          sort: existing.sort,
        ));
      }

      ref.invalidate(_editorDiseasesProvider);
    }
  }

  Future<void> _unlinkProgram(
    BuildContext context,
    WidgetRef ref,
    Disease disease,
  ) async {
    final categoryId = ref.read(_editorSelectedCategoryIdProvider);
    if (categoryId == null) return;

    final confirmed = await showDialog<bool>(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text(L10n.tr('unlink', locale)),
        content: Text(L10n.tr('confirm_delete', locale)),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx, false),
            child: Text(L10n.tr('cancel', locale)),
          ),
          FilledButton(
            onPressed: () => Navigator.pop(ctx, true),
            child: Text(L10n.tr('unlink', locale)),
          ),
        ],
      ),
    );

    if (confirmed == true) {
      final repo = ProgramsGroupsRepository();
      await repo.unlinkByProgramAndCategory(categoryId, disease.id);
      ref.invalidate(_editorDiseasesProvider);
      ref.invalidate(_editorCategoriesProvider);
    }
  }

  Future<void> _showLinkProgramDialog(
    BuildContext context,
    WidgetRef ref,
  ) async {
    final categoryId = ref.read(_editorSelectedCategoryIdProvider);
    if (categoryId == null) return;

    await showDialog(
      context: context,
      builder: (ctx) => _LinkProgramDialog(
        categoryId: categoryId,
        locale: locale,
      ),
    );
    ref.invalidate(_editorDiseasesProvider);
    ref.invalidate(_editorCategoriesProvider);
  }
}

// ============================================================================
// Frequencies Editor
// ============================================================================

class _FrequenciesEditor extends ConsumerWidget {
  final String locale;

  const _FrequenciesEditor({required this.locale});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedDisease = ref.watch(_editorSelectedDiseaseProvider);
    final frequenciesAsync = ref.watch(_editorFrequenciesProvider);

    if (selectedDisease == null) {
      return Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              Icons.touch_app,
              size: 48,
              color: Theme.of(context)
                  .colorScheme
                  .onSurface
                  .withValues(alpha: 0.3),
            ),
            const SizedBox(height: 8),
            Text(L10n.tr('programs', locale)),
          ],
        ),
      );
    }

    return Column(
      children: [
        // Program header
        Container(
          padding: const EdgeInsets.all(12),
          color: Theme.of(context).colorScheme.primaryContainer,
          child: Row(
            children: [
              Expanded(
                child: Text(
                  selectedDisease.getName(locale),
                  style: Theme.of(context).textTheme.titleMedium,
                ),
              ),
              FilledButton.tonalIcon(
                onPressed: () => _showFrequencyDialog(context, ref, null),
                icon: const Icon(Icons.add, size: 18),
                label: Text(L10n.tr('add', locale)),
              ),
            ],
          ),
        ),
        Expanded(
          child: frequenciesAsync.when(
            loading: () => const Center(child: CircularProgressIndicator()),
            error: (e, _) => Center(child: Text('Error: $e')),
            data: (frequencies) {
              if (frequencies.isEmpty) {
                return Center(
                  child: Text(L10n.tr('frequencies', locale)),
                );
              }
              return ListView.builder(
                itemCount: frequencies.length,
                itemBuilder: (context, index) {
                  final freq = frequencies[index];
                  return ListTile(
                    leading: CircleAvatar(
                      radius: 14,
                      child: Text('${index + 1}',
                          style: const TextStyle(fontSize: 12)),
                    ),
                    title: Text('${freq.freq} Hz'),
                    subtitle: Text(
                        '${freq.timeSec} ${L10n.tr('duration_sec', locale).split(' ').last}'),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                          icon: const Icon(Icons.edit_outlined, size: 20),
                          onPressed: () =>
                              _showFrequencyDialog(context, ref, freq),
                        ),
                        IconButton(
                          icon: const Icon(Icons.delete_outline, size: 20),
                          onPressed: () =>
                              _confirmDeleteFrequency(context, ref, freq),
                        ),
                      ],
                    ),
                  );
                },
              );
            },
          ),
        ),
      ],
    );
  }

  Future<void> _showFrequencyDialog(
    BuildContext context,
    WidgetRef ref,
    Frequency? existing,
  ) async {
    final freqCtrl =
        TextEditingController(text: existing?.freq.toString() ?? '');
    final timeCtrl =
        TextEditingController(text: existing?.timeSec.toString() ?? '180');

    final result = await showDialog<bool>(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text(existing == null
            ? L10n.tr('add', locale)
            : L10n.tr('editor', locale)),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: freqCtrl,
              keyboardType:
                  const TextInputType.numberWithOptions(decimal: true),
              decoration: InputDecoration(
                labelText: L10n.tr('frequency_hz', locale),
              ),
            ),
            const SizedBox(height: 12),
            TextField(
              controller: timeCtrl,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: L10n.tr('duration_sec', locale),
              ),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx, false),
            child: Text(L10n.tr('cancel', locale)),
          ),
          FilledButton(
            onPressed: () => Navigator.pop(ctx, true),
            child: Text(L10n.tr('save', locale)),
          ),
        ],
      ),
    );

    if (result == true) {
      final repo = FrequencyRepository();
      final selectedDisease = ref.read(_editorSelectedDiseaseProvider);
      if (selectedDisease == null) return;

      final freqHz = double.tryParse(freqCtrl.text) ?? 0;
      final timeSec = int.tryParse(timeCtrl.text) ?? 180;

      if (existing == null) {
        await repo.insert(Frequency(
          id: 0,
          freq: freqHz,
          orderNo: 0,
          timeSec: timeSec,
          diseaseId: selectedDisease.id,
        ));
      } else {
        await repo.update(Frequency(
          id: existing.id,
          freq: freqHz,
          orderNo: existing.orderNo,
          timeSec: timeSec,
          diseaseId: existing.diseaseId,
        ));
      }

      ref.invalidate(_editorFrequenciesProvider);
    }
  }

  Future<void> _confirmDeleteFrequency(
    BuildContext context,
    WidgetRef ref,
    Frequency freq,
  ) async {
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text(L10n.tr('delete', locale)),
        content: Text(L10n.tr('confirm_delete', locale)),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx, false),
            child: Text(L10n.tr('cancel', locale)),
          ),
          FilledButton(
            onPressed: () => Navigator.pop(ctx, true),
            style: FilledButton.styleFrom(
              backgroundColor: Theme.of(context).colorScheme.error,
            ),
            child: Text(L10n.tr('delete', locale)),
          ),
        ],
      ),
    );

    if (confirmed == true) {
      final repo = FrequencyRepository();
      await repo.delete(freq.id);
      ref.invalidate(_editorFrequenciesProvider);
    }
  }
}

// ============================================================================
// Link Program Dialog
// ============================================================================

class _LinkProgramDialog extends StatefulWidget {
  final int categoryId;
  final String locale;

  const _LinkProgramDialog({
    required this.categoryId,
    required this.locale,
  });

  @override
  State<_LinkProgramDialog> createState() => _LinkProgramDialogState();
}

class _LinkProgramDialogState extends State<_LinkProgramDialog> {
  final _searchCtrl = TextEditingController();
  List<Disease> _results = [];
  bool _loading = false;

  @override
  void dispose() {
    _searchCtrl.dispose();
    super.dispose();
  }

  Future<void> _search(String query) async {
    if (query.isEmpty) {
      setState(() => _results = []);
      return;
    }

    setState(() => _loading = true);
    try {
      final repo = DiseaseRepository();
      final results = await repo.search(query, 2);
      setState(() {
        _results = results;
        _loading = false;
      });
    } catch (e) {
      setState(() => _loading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(L10n.tr('link', widget.locale)),
      content: SizedBox(
        width: 400,
        height: 400,
        child: Column(
          children: [
            TextField(
              controller: _searchCtrl,
              autofocus: true,
              decoration: InputDecoration(
                hintText: L10n.tr('search', widget.locale),
                prefixIcon: const Icon(Icons.search),
              ),
              onChanged: _search,
            ),
            const SizedBox(height: 8),
            Expanded(
              child: _loading
                  ? const Center(child: CircularProgressIndicator())
                  : ListView.builder(
                      itemCount: _results.length,
                      itemBuilder: (context, index) {
                        final disease = _results[index];
                        return ListTile(
                          title: Text(disease.getName(widget.locale)),
                          dense: true,
                          trailing: IconButton(
                            icon: const Icon(Icons.link),
                            onPressed: () async {
                              final repo = ProgramsGroupsRepository();
                              await repo.link(
                                widget.categoryId,
                                disease.id,
                                0,
                              );
                              if (context.mounted) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text(
                                        '${disease.getName(widget.locale)} linked'),
                                    duration: const Duration(seconds: 1),
                                  ),
                                );
                              }
                            },
                          ),
                        );
                      },
                    ),
            ),
          ],
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: Text(L10n.tr('cancel', widget.locale)),
        ),
      ],
    );
  }
}
