import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../data/models/user.dart';
import '../data/repositories/user_repository.dart';

class AuthState {
  final AppUser? currentUser;
  final List<AppUser> users;
  final bool isLoading;
  final String? error;

  const AuthState({
    this.currentUser,
    this.users = const [],
    this.isLoading = false,
    this.error,
  });

  bool get isLoggedIn => currentUser != null;

  AuthState copyWith({
    AppUser? currentUser,
    List<AppUser>? users,
    bool? isLoading,
    String? error,
    bool clearUser = false,
    bool clearError = false,
  }) {
    return AuthState(
      currentUser: clearUser ? null : (currentUser ?? this.currentUser),
      users: users ?? this.users,
      isLoading: isLoading ?? this.isLoading,
      error: clearError ? null : (error ?? this.error),
    );
  }
}

class AuthNotifier extends Notifier<AuthState> {
  late final UserRepository _userRepo;

  @override
  AuthState build() {
    _userRepo = ref.watch(userRepositoryProvider);
    return const AuthState();
  }

  Future<void> loadUsers() async {
    state = state.copyWith(isLoading: true, clearError: true);
    try {
      final users = await _userRepo.getAll();
      state = state.copyWith(users: users, isLoading: false);
    } catch (e) {
      state = state.copyWith(isLoading: false, error: e.toString());
    }
  }

  Future<bool> login(int userId, String password) async {
    state = state.copyWith(isLoading: true, clearError: true);
    try {
      final user = await _userRepo.getById(userId);
      if (user == null) {
        state = state.copyWith(isLoading: false, error: 'User not found');
        return false;
      }

      if (user.hasPassword) {
        final valid = await _userRepo.validatePassword(userId, password);
        if (!valid) {
          state = state.copyWith(isLoading: false, error: 'wrong_password');
          return false;
        }
      }

      state = state.copyWith(currentUser: user, isLoading: false);
      return true;
    } catch (e) {
      state = state.copyWith(isLoading: false, error: e.toString());
      return false;
    }
  }

  Future<bool> autoLogin() async {
    await loadUsers();
    final users = state.users;

    // Auto-login if only 1 user with no password
    if (users.length == 1 && !users.first.hasPassword) {
      state = state.copyWith(currentUser: users.first);
      return true;
    }

    return false;
  }

  void logout() {
    state = state.copyWith(clearUser: true, clearError: true);
  }

  Future<bool> changePassword(
    String oldPassword,
    String newPassword,
  ) async {
    final user = state.currentUser;
    if (user == null) return false;

    state = state.copyWith(isLoading: true, clearError: true);
    try {
      if (user.hasPassword) {
        final valid = await _userRepo.validatePassword(user.id, oldPassword);
        if (!valid) {
          state = state.copyWith(isLoading: false, error: 'wrong_password');
          return false;
        }
      }

      await _userRepo.changePassword(user.id, newPassword);
      state = state.copyWith(isLoading: false);
      return true;
    } catch (e) {
      state = state.copyWith(isLoading: false, error: e.toString());
      return false;
    }
  }

  Future<void> addUser(String name) async {
    await _userRepo.insert(name);
    await loadUsers();
  }

  Future<void> deleteUser(int userId) async {
    if (userId == 1) return; // Never delete admin
    await _userRepo.delete(userId);
    await loadUsers();
  }
}

final userRepositoryProvider = Provider<UserRepository>((ref) {
  return UserRepository();
});

final authProvider = NotifierProvider<AuthNotifier, AuthState>(
  AuthNotifier.new,
);
