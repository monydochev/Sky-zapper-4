import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../core/l10n.dart';
import '../../data/models/custom_group.dart';
import '../../data/models/custom_program.dart';
import '../../data/models/disease.dart';
import '../../data/repositories/custom_group_repository.dart';
import '../../data/repositories/disease_repository.dart';
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

// --- Providers for custom groups screen state ---

final _customGroupsProvider = FutureProvider<List<CustomGroup>>((ref) async {
  final authState = ref.watch(authProvider);
  if (authState.currentUser == null) return [];
  final repo = CustomGroupRepository();
  return repo.getByUser(authState.currentUser!.id);
});

final _selectedGroupIdProvider =
    NotifierProvider<_NullableIntNotifier, int?>(_NullableIntNotifier.new);

final _groupProgramsProvider = FutureProvider<List<CustomProgram>>((ref) async {
  final groupId = ref.watch(_selectedGroupIdProvider);
  if (groupId == null) return [];
  final repo = CustomGroupRepository();
  return repo.getPrograms(groupId);
});

class CustomGroupsScreen extends ConsumerStatefulWidget {
  const CustomGroupsScreen({super.key});

  @override
  ConsumerState<CustomGroupsScreen> createState() =>
      _CustomGroupsScreenState();
}

class _CustomGroupsScreenState extends ConsumerState<CustomGroupsScreen> {
  @override
  Widget build(BuildContext context) {
    final locale = ref.watch(localeProvider);
    final width = MediaQuery.of(context).size.width;
    final isWide = width >= 700;

    if (isWide) {
      return Row(
        children: [
          SizedBox(
            width: 280,
            child: _buildGroupsList(context, locale),
          ),
          const VerticalDivider(width: 1),
          Expanded(
            child: _buildGroupDetail(context, locale),
          ),
        ],
      );
    }

    return _buildNarrowLayout(context, locale);
  }

  Widget _buildNarrowLayout(BuildContext context, String locale) {
    final selectedGroupId = ref.watch(_selectedGroupIdProvider);

    if (selectedGroupId != null) {
      return Column(
        children: [
          // Back button header
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 4),
            child: Row(
              children: [
                IconButton(
                  icon: const Icon(Icons.arrow_back),
                  onPressed: () {
                    ref.read(_selectedGroupIdProvider.notifier).set(null);
                  },
                ),
                Expanded(
                  child: Text(
                    L10n.tr('playlists', locale),
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                ),
              ],
            ),
          ),
          Expanded(child: _buildGroupDetail(context, locale)),
        ],
      );
    }

    return _buildGroupsList(context, locale);
  }

  Widget _buildGroupsList(BuildContext context, String locale) {
    final groupsAsync = ref.watch(_customGroupsProvider);
    final selectedGroupId = ref.watch(_selectedGroupIdProvider);

    return Column(
      children: [
        // Header with add button
        Padding(
          padding: const EdgeInsets.all(12),
          child: Row(
            children: [
              Text(
                L10n.tr('playlists', locale),
                style: Theme.of(context).textTheme.titleMedium,
              ),
              const Spacer(),
              FilledButton.tonalIcon(
                onPressed: () => _showNewGroupDialog(context, locale),
                icon: const Icon(Icons.add, size: 18),
                label: Text(L10n.tr('new_group', locale)),
              ),
            ],
          ),
        ),
        const Divider(height: 1),
        Expanded(
          child: groupsAsync.when(
            loading: () => const Center(child: CircularProgressIndicator()),
            error: (e, _) => Center(child: Text('Error: $e')),
            data: (groups) {
              if (groups.isEmpty) {
                return Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        Icons.playlist_add,
                        size: 48,
                        color: Theme.of(context)
                            .colorScheme
                            .onSurface
                            .withValues(alpha: 0.3),
                      ),
                      const SizedBox(height: 8),
                      Text(L10n.tr('playlists', locale)),
                    ],
                  ),
                );
              }

              return ListView.builder(
                itemCount: groups.length,
                itemBuilder: (context, index) {
                  final group = groups[index];
                  final isSelected = group.id == selectedGroupId;
                  return ListTile(
                    selected: isSelected,
                    selectedTileColor:
                        Theme.of(context).colorScheme.primaryContainer,
                    leading: const Icon(Icons.playlist_play),
                    title: Text(group.name),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        // Play group
                        if (ref.watch(deviceConnectionProvider).isConnected)
                          IconButton(
                            icon: const Icon(Icons.play_arrow),
                            onPressed: () {
                              _playGroup(group);
                            },
                            tooltip: L10n.tr('play_group', locale),
                          ),
                        // Delete group
                        IconButton(
                          icon: const Icon(Icons.delete_outline),
                          onPressed: () =>
                              _confirmDeleteGroup(context, locale, group),
                          tooltip: L10n.tr('delete', locale),
                        ),
                      ],
                    ),
                    onTap: () {
                      ref.read(_selectedGroupIdProvider.notifier).set(
                          group.id);
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

  Widget _buildGroupDetail(BuildContext context, String locale) {
    final selectedGroupId = ref.watch(_selectedGroupIdProvider);
    final programsAsync = ref.watch(_groupProgramsProvider);

    if (selectedGroupId == null) {
      return Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              Icons.playlist_play,
              size: 48,
              color: Theme.of(context)
                  .colorScheme
                  .onSurface
                  .withValues(alpha: 0.3),
            ),
            const SizedBox(height: 8),
            Text(L10n.tr('playlists', locale)),
          ],
        ),
      );
    }

    return Column(
      children: [
        // Add program button
        Padding(
          padding: const EdgeInsets.all(8),
          child: Row(
            children: [
              Expanded(
                child: Text(
                  L10n.tr('programs', locale),
                  style: Theme.of(context).textTheme.titleSmall,
                ),
              ),
              FilledButton.tonalIcon(
                onPressed: () => _showAddProgramDialog(context, locale),
                icon: const Icon(Icons.add, size: 18),
                label: Text(L10n.tr('add_program', locale)),
              ),
            ],
          ),
        ),
        const Divider(height: 1),

        // Programs in group
        Expanded(
          child: programsAsync.when(
            loading: () => const Center(child: CircularProgressIndicator()),
            error: (e, _) => Center(child: Text('Error: $e')),
            data: (programs) {
              if (programs.isEmpty) {
                return Center(
                  child: Text(L10n.tr('add_program', locale)),
                );
              }

              return ReorderableListView.builder(
                itemCount: programs.length,
                onReorder: (oldIndex, newIndex) {
                  // Reorder logic - would update sort order in DB
                },
                itemBuilder: (context, index) {
                  final program = programs[index];
                  return ListTile(
                    key: ValueKey(program.id),
                    leading: ReorderableDragStartListener(
                      index: index,
                      child: const Icon(Icons.drag_handle),
                    ),
                    title: Text(
                      locale == 'bg'
                          ? (program.programName ?? program.programNameEn ?? '')
                          : (program.programNameEn ??
                              program.programName ??
                              ''),
                    ),
                    trailing: IconButton(
                      icon: const Icon(Icons.remove_circle_outline),
                      onPressed: () async {
                        final repo = CustomGroupRepository();
                        await repo.removeProgram(program.id);
                        ref.invalidate(_groupProgramsProvider);
                      },
                      tooltip: L10n.tr('remove_program', locale),
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

  Future<void> _showNewGroupDialog(
      BuildContext context, String locale) async {
    final nameController = TextEditingController();
    final result = await showDialog<String>(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text(L10n.tr('new_group', locale)),
        content: TextField(
          controller: nameController,
          autofocus: true,
          decoration: InputDecoration(
            labelText: L10n.tr('group_name', locale),
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx),
            child: Text(L10n.tr('cancel', locale)),
          ),
          FilledButton(
            onPressed: () => Navigator.pop(ctx, nameController.text),
            child: Text(L10n.tr('save', locale)),
          ),
        ],
      ),
    );

    if (result != null && result.isNotEmpty) {
      final authState = ref.read(authProvider);
      if (authState.currentUser == null) return;

      final repo = CustomGroupRepository();
      await repo.insert(CustomGroup(
        id: 0,
        name: result,
        userId: authState.currentUser!.id,
      ));
      ref.invalidate(_customGroupsProvider);
    }
  }

  Future<void> _confirmDeleteGroup(
    BuildContext context,
    String locale,
    CustomGroup group,
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
      final repo = CustomGroupRepository();
      await repo.delete(group.id);
      ref.read(_selectedGroupIdProvider.notifier).set(null);
      ref.invalidate(_customGroupsProvider);
    }
  }

  Future<void> _showAddProgramDialog(
    BuildContext context,
    String locale,
  ) async {
    final selectedGroupId = ref.read(_selectedGroupIdProvider);
    if (selectedGroupId == null) return;

    await showDialog(
      context: context,
      builder: (ctx) => _AddProgramDialog(
        groupId: selectedGroupId,
        locale: locale,
      ),
    );
    ref.invalidate(_groupProgramsProvider);
  }

  Future<void> _playGroup(CustomGroup group) async {
    final repo = CustomGroupRepository();
    final programs = await repo.getPrograms(group.id);
    if (programs.isEmpty) return;

    // Play the first program; for full group playback,
    // the playback provider would need a custom group play method.
    final locale = ref.read(localeProvider);
    ref.read(playbackProvider.notifier).playProgram(
          programs.first.programId,
          locale == 'bg'
              ? (programs.first.programName ?? '')
              : (programs.first.programNameEn ?? ''),
        );
  }
}

class _AddProgramDialog extends ConsumerStatefulWidget {
  final int groupId;
  final String locale;

  const _AddProgramDialog({
    required this.groupId,
    required this.locale,
  });

  @override
  ConsumerState<_AddProgramDialog> createState() => _AddProgramDialogState();
}

class _AddProgramDialogState extends ConsumerState<_AddProgramDialog> {
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
      title: Text(L10n.tr('add_program', widget.locale)),
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
                            icon: const Icon(Icons.add_circle_outline),
                            onPressed: () async {
                              final repo = CustomGroupRepository();
                              await repo.addProgram(
                                widget.groupId,
                                disease.id,
                                index,
                              );
                              if (context.mounted) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text(
                                        '${disease.getName(widget.locale)} added'),
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
