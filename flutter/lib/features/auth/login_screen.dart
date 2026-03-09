import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../core/l10n.dart';
import '../../data/models/user.dart';
import '../../providers/auth_provider.dart';
import '../../providers/locale_provider.dart';

class LoginScreen extends ConsumerStatefulWidget {
  const LoginScreen({super.key});

  @override
  ConsumerState<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends ConsumerState<LoginScreen> {
  final _passwordController = TextEditingController();
  AppUser? _selectedUser;
  bool _showPassword = false;

  @override
  void dispose() {
    _passwordController.dispose();
    super.dispose();
  }

  Future<void> _login() async {
    if (_selectedUser == null) return;

    final locale = ref.read(localeProvider);
    final success = await ref.read(authProvider.notifier).login(
          _selectedUser!.id,
          _passwordController.text,
        );

    if (!success && mounted) {
      final authState = ref.read(authProvider);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            authState.error == 'wrong_password'
                ? L10n.tr('wrong_password', locale)
                : (authState.error ?? 'Error'),
          ),
          backgroundColor: Theme.of(context).colorScheme.error,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final locale = ref.watch(localeProvider);
    final authState = ref.watch(authProvider);
    final users = authState.users;

    // Auto-select first user if none selected
    if (_selectedUser == null && users.isNotEmpty) {
      _selectedUser = users.first;
    }

    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(32),
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 400),
            child: Card(
              elevation: 4,
              child: Padding(
                padding: const EdgeInsets.all(32),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      Icons.electric_bolt,
                      size: 64,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                    const SizedBox(height: 16),
                    Text(
                      L10n.tr('app_title', locale),
                      style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                            color: Theme.of(context).colorScheme.primary,
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                    const SizedBox(height: 32),

                    // User dropdown
                    if (users.isNotEmpty)
                      DropdownButtonFormField<AppUser>(
                        value: _selectedUser,
                        decoration: InputDecoration(
                          labelText: L10n.tr('user', locale),
                          prefixIcon: const Icon(Icons.person),
                        ),
                        items: users.map((user) {
                          return DropdownMenuItem(
                            value: user,
                            child: Text(user.name ?? 'User ${user.id}'),
                          );
                        }).toList(),
                        onChanged: (user) {
                          setState(() {
                            _selectedUser = user;
                            _passwordController.clear();
                          });
                        },
                      ),

                    // Password field (show only if selected user has password)
                    if (_selectedUser != null && _selectedUser!.hasPassword) ...[
                      const SizedBox(height: 16),
                      TextField(
                        controller: _passwordController,
                        obscureText: !_showPassword,
                        decoration: InputDecoration(
                          labelText: L10n.tr('password', locale),
                          prefixIcon: const Icon(Icons.lock),
                          suffixIcon: IconButton(
                            icon: Icon(
                              _showPassword
                                  ? Icons.visibility_off
                                  : Icons.visibility,
                            ),
                            onPressed: () {
                              setState(() {
                                _showPassword = !_showPassword;
                              });
                            },
                          ),
                        ),
                        onSubmitted: (_) => _login(),
                      ),
                    ],

                    const SizedBox(height: 24),

                    // Login button
                    SizedBox(
                      width: double.infinity,
                      child: FilledButton.icon(
                        onPressed: authState.isLoading ? null : _login,
                        icon: authState.isLoading
                            ? const SizedBox(
                                width: 16,
                                height: 16,
                                child: CircularProgressIndicator(
                                  strokeWidth: 2,
                                  color: Colors.white,
                                ),
                              )
                            : const Icon(Icons.login),
                        label: Text(L10n.tr('login', locale)),
                      ),
                    ),

                    if (users.isEmpty && !authState.isLoading) ...[
                      const SizedBox(height: 16),
                      const CircularProgressIndicator(),
                    ],
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
