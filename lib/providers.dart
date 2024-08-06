import 'package:flutter_local_database/state_notifers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final studentDatabaseProvider = StateNotifierProvider<StudentStateNotifier, bool>((ref) => StudentStateNotifier());
