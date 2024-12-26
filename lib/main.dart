import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:supabase_auth/src/app.dart';
import 'package:supabase_auth/src/common/keys.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Supabase.initialize(
    url: AppKeys.supabaseUrl,
    anonKey: AppKeys.annonkey,
  );
  runApp(const ProviderScope(child: App()));
}