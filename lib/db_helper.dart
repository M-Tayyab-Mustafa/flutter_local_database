import 'dart:developer';

import 'package:flutter_local_database/student.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DBHelper extends Sqflite {
  String get dataBaseName => 'student_database';
  Future<Database> get dataBase async {
    String path = join(await getDatabasesPath(), dataBaseName);
    var db = await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) async {
        await db.execute('create table ${Student.tableName} ( ${Student.colRollNo} integer primary key, ${Student.colName} text not null, ${Student.colFee} real)');
      },
    );
    return db;
  }

  Future<bool> insertStudent(Student student) async {
    var db = await dataBase;
    int noOfRowEffected = await db.insert(Student.tableName, student.toMap());
    log(noOfRowEffected.toString());
    return noOfRowEffected != 0;
  }

  Future<List<Student>> fetchData() async {
    var db = await dataBase;
    List<Map<String, dynamic>> list = await db.query(Student.tableName);
    return list.map((e) => Student.fromMap(e)).toList();
  }
}
