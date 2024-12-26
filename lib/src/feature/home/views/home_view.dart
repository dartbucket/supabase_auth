import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:supabase_auth/src/feature/authentication/controller/auth_controller.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class HomeView extends ConsumerWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final user = Supabase.instance.client.auth.currentSession!.user;
    return Scaffold(
      appBar: AppBar(title: const Text('Supabase Auth')),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('Hello There! ${user.email}'),
            TextButton(onPressed: (){
              ref.read(authControllerProvider.notifier).logout();
            }, child: const Text("Logout")),
          ],
        ),
      ),
    );
  }
}