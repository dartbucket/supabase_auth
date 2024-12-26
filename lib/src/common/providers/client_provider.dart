import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

final supabaseClientProvider = Provider((ref) {
  return Supabase.instance.client;
});

final authStateProvider = StreamProvider<User?>((ref) {
  final supabaseClient = Supabase.instance.client;
  return supabaseClient.auth.onAuthStateChange.map((event) {
    return supabaseClient.auth.currentUser;
  });
});
