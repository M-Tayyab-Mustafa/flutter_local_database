import 'dart:developer';

import 'package:flutter_local_database/db_helper.dart';
import 'package:flutter_local_database/student.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class StudentStateNotifier extends StateNotifier<bool> {
  StudentStateNotifier() : super(false);
  final DBHelper _dbHelper = DBHelper();
  insetStudent() async {
    state = false;
    var student = Student(name: 'Ali', rollNo: 13, fee: 1000);
    state = await _dbHelper.insertStudent(student);
  }

  fetchStudents() async {
    state = false;
    var data = await _dbHelper.fetchData();
    log(data.toString());
    state = true;
  }
}
