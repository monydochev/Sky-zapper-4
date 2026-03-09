import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../core/l10n.dart';
import '../../data/models/category.dart';
import '../../data/models/disease.dart';
import '../../data/models/frequency.dart';
import '../../data/repositories/category_repository.dart';
import '../../data/repositories/disease_repository.dart';
import '../../data/repositories/frequency_repository.dart';
import '../../providers/auth_provider.dart';
import '../../providers/device_connection_provider.dart';
import '../../providers/locale_provider.dart';
import '../../providers/playback_provider.dart';

// --- Simple Notifiers for screen-local state ---

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

class _StringNotifier extends Notifier<String> {
  @override
  String build() => '';
  void set(String value) => state = value;
}

// --- Providers for programs screen state ---

final _selectedCategoryIdProvider =
    NotifierProvider<_NullableIntNotifier, int?>(_NullableIntNotifier.new);

final _categoriesProvider = FutureProvider<List<Category>>((ref) async {
  final authState = ref.watch(authProvider);
  final repo = CategoryRepository();
  if (authState.currentUser != null) {
    return repo.getForUser(authState.currentUser!.id);
  }
  return repo.getAll();
});

final _diseasesProvider = FutureProvider<List<Disease>>((ref) async {
  final categoryId = ref.watch(_selectedCategoryIdProvider);
  if (categoryId == null) return [];
  final repo = DiseaseRepository();
  return repo.getByCategory(categoryId);
});

final _selectedDiseaseProvider =
    NotifierProvider<_NullableDiseaseNotifier, Disease?>(
        _NullableDiseaseNotifier.new);

final _frequenciesProvider = FutureProvider<List<Frequency>>((ref) async {
  final disease = ref.watch(_selectedDiseaseProvider);
  if (disease == null) return [];
  final repo = FrequencyRepository();
  return repo.getByDiseaseId(disease.id);
});

final _searchQueryProvider =
    NotifierProvider<_StringNotifier, String>(_StringNotifier.new);

final _searchResultsProvider = FutureProvider<List<Disease>>((ref) async {
  final query = ref.watch(_searchQueryProvider);
  if (query.isEmpty) return [];
  final repo = DiseaseRepository();
  // Try frequency search first
  final freqVal = double.tryParse(query);
  if (freqVal != null) {
    return repo.searchByFrequency(freqVal);
  }
  return repo.search(query, 2);
});

class ProgramsScreen extends ConsumerStatefulWidget {
  const ProgramsScreen({super.key});

  @override
  ConsumerState<ProgramsScreen> createState() => _ProgramsScreenState();
}

class _ProgramsScreenState extends ConsumerState<ProgramsScreen> {
  final _searchController = TextEditingController();
  bool _isSearching = false;

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final locale = ref.watch(localeProvider);
    final width = MediaQuery.of(context).size.width;
    final isWide = width >= 900;

    if (isWide) {
      return _buildWideLayout(context, locale);
    }
    return _buildNarrowLayout(context, locale);
  }

  Widget _buildWideLayout(BuildContext context, String locale) {
    return Row(
      children: [
        // Categories panel
        SizedBox(
          width: 250,
          child: _buildCategoriesPanel(context, locale),
        ),
        const VerticalDivider(width: 1),
        // Programs panel
        Expanded(
          flex: 2,
          child: _buildProgramsPanel(context, locale),
        ),
        const VerticalDivider(width: 1),
        // Frequency detail panel
        SizedBox(
          width: 300,
          child: _buildFrequencyPanel(context, locale),
        ),
      ],
    );
  }

  Widget _buildNarrowLayout(BuildContext context, String locale) {
    final selectedDisease = ref.watch(_selectedDiseaseProvider);

    return Column(
      children: [
        // Search bar
        _buildSearchBar(context, locale),
        // Main content
        Expanded(
          child: _isSearching
              ? _buildSearchResults(context, locale)
              : selectedDisease != null
                  ? _buildFrequencyPanel(context, locale)
                  : _buildProgramsWithDrawer(context, locale),
        ),
        // Quick programs
        _buildQuickProgramsBar(context, locale),
      ],
    );
  }

  Widget _buildSearchBar(BuildContext context, String locale) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: SearchBar(
        controller: _searchController,
        hintText: L10n.tr('search', locale),
        leading: const Padding(
          padding: EdgeInsets.only(left: 8),
          child: Icon(Icons.search),
        ),
        trailing: [
          if (_isSearching)
            IconButton(
              icon: const Icon(Icons.close),
              onPressed: () {
                _searchController.clear();
                ref.read(_searchQueryProvider.notifier).set('');
                setState(() {
                  _isSearching = false;
                });
              },
            ),
        ],
        onChanged: (value) {
          ref.read(_searchQueryProvider.notifier).set(value);
          setState(() {
            _isSearching = value.isNotEmpty;
          });
        },
      ),
    );
  }

  Widget _buildSearchResults(BuildContext context, String locale) {
    final resultsAsync = ref.watch(_searchResultsProvider);

    return resultsAsync.when(
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (e, _) => Center(child: Text('Error: $e')),
      data: (diseases) {
        if (diseases.isEmpty) {
          return Center(
            child: Text(L10n.tr('no_devices_found', locale)),
          );
        }
        return ListView.builder(
          itemCount: diseases.length,
          itemBuilder: (context, index) {
            final disease = diseases[index];
            return _buildDiseaseListTile(context, disease, locale);
          },
        );
      },
    );
  }

  Widget _buildProgramsWithDrawer(BuildContext context, String locale) {
    final categoriesAsync = ref.watch(_categoriesProvider);
    final selectedCategoryId = ref.watch(_selectedCategoryIdProvider);

    return categoriesAsync.when(
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (e, _) => Center(child: Text('Error: $e')),
      data: (categories) {
        if (selectedCategoryId == null && categories.isNotEmpty) {
          Future.microtask(() {
            ref.read(_selectedCategoryIdProvider.notifier).set(
                categories.first.id);
          });
        }
        return Column(
          children: [
            // Category selector (horizontal chip list)
            SizedBox(
              height: 50,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 8),
                itemCount: categories.length,
                itemBuilder: (context, index) {
                  final cat = categories[index];
                  final isSelected = cat.id == selectedCategoryId;
                  return Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 4, vertical: 6),
                    child: FilterChip(
                      selected: isSelected,
                      label: Text(cat.getName(locale)),
                      onSelected: (_) {
                        ref.read(_selectedCategoryIdProvider.notifier).set(
                            cat.id);
                        ref.read(_selectedDiseaseProvider.notifier).set(null);
                      },
                    ),
                  );
                },
              ),
            ),
            const Divider(height: 1),
            // Programs list
            Expanded(
              child: _buildDiseasesListView(context, locale),
            ),
          ],
        );
      },
    );
  }

  Widget _buildCategoriesPanel(BuildContext context, String locale) {
    final categoriesAsync = ref.watch(_categoriesProvider);
    final selectedCategoryId = ref.watch(_selectedCategoryIdProvider);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(12),
          child: Text(
            L10n.tr('categories', locale),
            style: Theme.of(context).textTheme.titleMedium,
          ),
        ),
        const Divider(height: 1),
        Expanded(
          child: categoriesAsync.when(
            loading: () => const Center(child: CircularProgressIndicator()),
            error: (e, _) => Center(child: Text('Error: $e')),
            data: (categories) {
              if (selectedCategoryId == null && categories.isNotEmpty) {
                Future.microtask(() {
                  ref.read(_selectedCategoryIdProvider.notifier).set(
                      categories.first.id);
                });
              }
              return ListView.builder(
                itemCount: categories.length,
                itemBuilder: (context, index) {
                  final cat = categories[index];
                  final isSelected = cat.id == selectedCategoryId;
                  return ListTile(
                    selected: isSelected,
                    selectedTileColor:
                        Theme.of(context).colorScheme.primaryContainer,
                    title: Text(cat.getName(locale)),
                    trailing: cat.programCount > 0
                        ? Badge(
                            label: Text('${cat.programCount}'),
                          )
                        : null,
                    dense: true,
                    onTap: () {
                      ref.read(_selectedCategoryIdProvider.notifier).set(
                          cat.id);
                      ref.read(_selectedDiseaseProvider.notifier).set(null);
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

  Widget _buildProgramsPanel(BuildContext context, String locale) {
    return Column(
      children: [
        _buildSearchBar(context, locale),
        Expanded(
          child: _isSearching
              ? _buildSearchResults(context, locale)
              : _buildDiseasesListView(context, locale),
        ),
        _buildQuickProgramsBar(context, locale),
      ],
    );
  }

  Widget _buildDiseasesListView(BuildContext context, String locale) {
    final diseasesAsync = ref.watch(_diseasesProvider);
    final selectedDisease = ref.watch(_selectedDiseaseProvider);

    return diseasesAsync.when(
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (e, _) => Center(child: Text('Error: $e')),
      data: (diseases) {
        if (diseases.isEmpty) {
          return Center(
            child: Text(
              L10n.tr('no_devices_found', locale),
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    color: Theme.of(context)
                        .colorScheme
                        .onSurface
                        .withValues(alpha: 0.5),
                  ),
            ),
          );
        }
        return ListView.builder(
          itemCount: diseases.length,
          itemBuilder: (context, index) {
            final disease = diseases[index];
            return _buildDiseaseListTile(
              context,
              disease,
              locale,
              isSelected: disease.id == selectedDisease?.id,
            );
          },
        );
      },
    );
  }

  Widget _buildDiseaseListTile(
    BuildContext context,
    Disease disease,
    String locale, {
    bool isSelected = false,
  }) {
    final connectionState = ref.watch(deviceConnectionProvider);
    final playbackState = ref.watch(playbackProvider);

    return ListTile(
      selected: isSelected,
      selectedTileColor: Theme.of(context).colorScheme.secondaryContainer,
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
          if (disease.freqCount > 0)
            Padding(
              padding: const EdgeInsets.only(right: 8),
              child: Text(
                '${disease.freqCount}',
                style: Theme.of(context).textTheme.bodySmall,
              ),
            ),
          if (connectionState.isConnected)
            IconButton(
              icon: playbackState.isPlaying &&
                      playbackState.currentEntry?.programId == disease.id
                  ? const Icon(Icons.stop)
                  : const Icon(Icons.play_arrow),
              onPressed: () {
                if (playbackState.isPlaying &&
                    playbackState.currentEntry?.programId == disease.id) {
                  ref.read(playbackProvider.notifier).stop();
                } else {
                  ref.read(playbackProvider.notifier).playProgram(
                        disease.id,
                        disease.getName(locale),
                      );
                }
              },
              tooltip: L10n.tr('play_program', locale),
            ),
        ],
      ),
      onTap: () {
        ref.read(_selectedDiseaseProvider.notifier).set(disease);
      },
    );
  }

  Widget _buildFrequencyPanel(BuildContext context, String locale) {
    final selectedDisease = ref.watch(_selectedDiseaseProvider);
    final frequenciesAsync = ref.watch(_frequenciesProvider);
    final connectionState = ref.watch(deviceConnectionProvider);

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
            Text(
              L10n.tr('programs', locale),
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    color: Theme.of(context)
                        .colorScheme
                        .onSurface
                        .withValues(alpha: 0.5),
                  ),
            ),
          ],
        ),
      );
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Program header
        Container(
          padding: const EdgeInsets.all(12),
          color: Theme.of(context).colorScheme.primaryContainer,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Expanded(
                    child: Text(
                      selectedDisease.getName(locale),
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                  ),
                  // Back button (mobile only)
                  if (MediaQuery.of(context).size.width < 900)
                    IconButton(
                      icon: const Icon(Icons.arrow_back),
                      onPressed: () {
                        ref.read(_selectedDiseaseProvider.notifier).set(null);
                      },
                    ),
                ],
              ),
              if (selectedDisease.getDescription(locale).isNotEmpty)
                Padding(
                  padding: const EdgeInsets.only(top: 4),
                  child: Text(
                    selectedDisease.getDescription(locale),
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                ),
            ],
          ),
        ),

        // Play button
        if (connectionState.isConnected)
          Padding(
            padding: const EdgeInsets.all(8),
            child: SizedBox(
              width: double.infinity,
              child: FilledButton.icon(
                onPressed: () {
                  ref.read(playbackProvider.notifier).playProgram(
                        selectedDisease.id,
                        selectedDisease.getName(locale),
                      );
                },
                icon: const Icon(Icons.play_arrow),
                label: Text(L10n.tr('play_program', locale)),
              ),
            ),
          ),

        // Frequencies header
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
          child: Text(
            L10n.tr('frequencies', locale),
            style: Theme.of(context).textTheme.titleSmall,
          ),
        ),
        const Divider(height: 1),

        // Frequencies list
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
                    dense: true,
                    leading: CircleAvatar(
                      radius: 14,
                      child: Text(
                        '${index + 1}',
                        style: const TextStyle(fontSize: 12),
                      ),
                    ),
                    title: Text('${freq.freq} Hz'),
                    trailing: Text(
                        '${freq.timeSec} ${L10n.tr('duration_sec', locale).split(' ').last}'),
                  );
                },
              );
            },
          ),
        ),
      ],
    );
  }

  Widget _buildQuickProgramsBar(BuildContext context, String locale) {
    final connectionState = ref.watch(deviceConnectionProvider);
    final quickSlots = connectionState.deviceInfo?.quickSlots ?? [];

    if (quickSlots.isEmpty) return const SizedBox.shrink();

    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surfaceContainerLow,
        border: Border(
          top: BorderSide(
            color: Theme.of(context).colorScheme.outlineVariant,
          ),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            L10n.tr('quick_programs', locale),
            style: Theme.of(context).textTheme.labelSmall,
          ),
          const SizedBox(height: 4),
          Row(
            children: [
              // Red group
              _buildQuickGroup(context, locale, quickSlots, 'RED', Colors.red),
              const SizedBox(width: 8),
              // Green group
              _buildQuickGroup(
                  context, locale, quickSlots, 'GREEN', Colors.green),
              const SizedBox(width: 8),
              // Blue group
              _buildQuickGroup(
                  context, locale, quickSlots, 'BLUE', Colors.blue),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildQuickGroup(
    BuildContext context,
    String locale,
    List quickSlots,
    String colorGroup,
    Color color,
  ) {
    final groupSlots =
        quickSlots.where((s) => s.colorGroup == colorGroup).toList();

    return Expanded(
      child: Column(
        children: [
          Text(
            L10n.tr(colorGroup.toLowerCase(), locale),
            style: TextStyle(
              color: color,
              fontSize: 10,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 2),
          Row(
            children: List.generate(4, (index) {
              final slot =
                  index < groupSlots.length ? groupSlots[index] : null;
              return Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 1),
                  child: SizedBox(
                    height: 32,
                    child: OutlinedButton(
                      onPressed: slot != null && !slot.isEmpty
                          ? () {
                              ref.read(playbackProvider.notifier).playProgram(
                                    slot.programId,
                                    slot.programName ?? '',
                                  );
                            }
                          : null,
                      style: OutlinedButton.styleFrom(
                        padding: EdgeInsets.zero,
                        side: BorderSide(color: color.withValues(alpha: 0.5)),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(4),
                        ),
                      ),
                      child: Text(
                        '${index + 1}',
                        style: TextStyle(fontSize: 11, color: color),
                      ),
                    ),
                  ),
                ),
              );
            }),
          ),
        ],
      ),
    );
  }
}
