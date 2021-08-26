import 'dart:io';

import 'package:aug_reg/models/courceModel.dart';
import 'package:aug_reg/models/studentModel.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DBHelper {
  DBHelper._();

  static final DBHelper dbHelper = DBHelper._();
  static final String dbName = 'student.db';

  ///////////// Student Table
  static final String studentTable = 'studentTable';
  static final String stdId = 'stdId';
  static final String stdName = 'stdName';
  static final String stdPhone = 'stdPhone';
  static final String stdAge = 'stdAge';
  static final String stdSpec = 'stdSpec';

  ///////////// Course Table
  static final String courceTable = 'courceTable';
  static final String crsId = 'crsId';
  static final String title = 'title';
  static final String grade = 'grade';
  static final String stdIID = 'stdIID';

  /////////////
  Database? database;

  initializeTasksDatabase() async {
    if (database == null) {
      database = await connectToDatabase();
    }
  }

  Future<Database> connectToDatabase() async {
    Directory pathDirectory = await getApplicationDocumentsDirectory();
    String databasePath = join(pathDirectory.path, dbName);
    Database database = await openDatabase(
      databasePath,
      version: 1,
      onCreate: (db, version) {
        try {
          createStdTable(db);
          createCourceTable(db);
        } on Exception catch (e) {
          print(e);
        }
      },
    );
    return database;
  }

  createStdTable(Database db) {
    db.execute('''CREATE TABLE $studentTable(
    $stdId INTEGER PRIMARY KEY AUTOINCREMENT,
    $stdName TEXT NOT NULL,
    $stdPhone TEXT NOT NULL,
    $stdAge TEXT NOT NULL,
    $stdSpec TEXT NOT NULL)''');
  }

  createCourceTable(Database db) {
    db.execute('''CREATE TABLE $courceTable(
    $crsId INTEGER PRIMARY KEY AUTOINCREMENT,
    $title TEXT NOT NULL,
    $grade TEXT NOT NULL,
    $stdIID INTEGER NOT NULL)''');
  }

  insertNewStudent(StudentModel studentModel) async {
    try {
      int result = await database!.insert(
        studentTable,
        studentModel.toMap(),
      );
      print(result);
    } on Exception catch (e) {
      print(e);
    }
  }

  insertNewCource(CourceModel courceModel) async {
    try {
      int result = await database!.insert(
        courceTable,
        courceModel.toMap(),
      );
      print(result);
    } on Exception catch (e) {
      print(e);
    }
  }


  deleteStudent(int id) async {
    try {
      int result = await database!
          .delete(studentTable, where: '$studentTable=?', whereArgs: [id]);
    } on Exception catch (e) {
      print(e);
    }
  }

  editeStudent(StudentModel studentModel) async {
    try {
      int result = await database!.update(studentTable, studentModel.toMap(),
          where: '$studentTable=?', whereArgs: [studentModel.id]);
      print('updated');
    } on Exception catch (e) {
      print(e);
    }
  }

  editeCource(CourceModel courceModel) async {
    try {
      int result = await database!.update(courceTable, courceModel.toMap(),
          where: '$courceTable=?', whereArgs: [courceModel.id]);
      print('updated');
    } on Exception catch (e) {
      print(e);
    }
  }

  Future<List<Map<String, dynamic>>?> getAllStudents() async {
    try {
      List<Map<String, dynamic>> allRows = await database!.query(studentTable);
      return allRows;
    } on Exception catch (e) {
      print(e);
    }
  }

  Future<List<Map<String, dynamic>>?> getAllCource() async {
    try {
      List<Map<String, dynamic>> allRows = await database!.query(courceTable);
      return allRows;
    } on Exception catch (e) {
      print(e);
    }
  }
}
