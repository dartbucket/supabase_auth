import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:supabase_auth/src/feature/authentication/repository/auth_repository.dart';

final authControllerProvider = StateNotifierProvider<AuthController, bool>(
  (ref) => AuthController(ref.watch(authRepositoryProvider)),
);

class AuthController extends StateNotifier<bool> {
  final AuthRepository _authRepository;

  AuthController(this._authRepository) : super(false);

  Future<void> signup(String email, String password) async {
    state = true;
    try {
      await _authRepository.signup(email, password);
    } catch (e) {
      rethrow;
    } finally {
      state = false;
    }
  }

  Future<void> login(String email, String password) async {
    state = true;
    try {
      await _authRepository.login(email, password);
    } catch (e) {
      rethrow;
    } finally {
      state = false;
    }
  }

  Future<void> logout() async {
    state = true;
    try {
      await _authRepository.logout();
    } catch (e) {
      rethrow;
    } finally {
      state = false;
    }
  }
}
