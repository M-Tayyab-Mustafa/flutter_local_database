import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_local_database/providers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            ElevatedButton(
              onPressed: () {
                ref.read(studentDatabaseProvider.notifier).fetchStudents();
                log(ref.watch(studentDatabaseProvider).toString());
              },
              child: const Text('Fetch students'),
            ),
            ElevatedButton(
              onPressed: () {
                ref.read(studentDatabaseProvider.notifier).insetStudent();
              },
              child: const Text('Add'),
            ),
          ],
        ),
      ),
    );
  }
}
