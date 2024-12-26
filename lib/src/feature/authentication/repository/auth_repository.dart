import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

final authRepositoryProvider = Provider<AuthRepository>((ref) {
  return AuthRepository();
});

class AuthRepository {
  final _client = Supabase.instance.client;

  Future<AuthResponse> signup(String email, String password) async {
    try {
      final response = await _client.auth.signUp(
        email: email,
        password: password,
      );
      return response;
    } on AuthException catch (e) {
      throw Exception('Signup failed: ${e.message}');
    } catch (e, stacktrace) {
      print(e, );
      print(stacktrace);
      throw Exception('An unexpected error occurred during signup.');
    }
  }

  Future<AuthResponse> login(String email, String password) async {
    try {
      final response = await _client.auth.signInWithPassword(
        email: email,
        password: password,
      );
      return response;
    } on AuthException catch (e) {
      throw Exception('Login failed: ${e.message}');
    } catch (e) {
      throw Exception('An unexpected error occurred during login.');
    }
  }

  User? getCurrentUser() {
    return _client.auth.currentUser;
  }
  
  Future<void> logout() async {
    try {
      await _client.auth.signOut();
    } on AuthException catch (e) {
      throw Exception('Logout failed: ${e.message}');
    } catch (e) {
      throw Exception('An unexpected error occurred during logout.');
    }
  }
}
