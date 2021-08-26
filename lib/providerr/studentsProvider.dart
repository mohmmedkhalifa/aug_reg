import 'package:aug_reg/dbHelpers/dbHelpers.dart';
import 'package:aug_reg/models/studentModel.dart';
import 'package:flutter/material.dart';

class StudentProvider extends ChangeNotifier {
  List<StudentModel> students = [];

  insertIntoStudentTable(StudentModel studentModel) async {
    await DBHelper.dbHelper.insertNewStudent(studentModel);
    getAllStudents();
  }

  deleteBookFromTable(StudentModel studentModel) async {
    await DBHelper.dbHelper.deleteStudent(studentModel!.id!);
    getAllStudents();
  }

  getAllStudents() async {
    List<Map<String, dynamic>>? rows = await DBHelper.dbHelper.getAllStudents();
    List<StudentModel> students =
        rows != null ? rows.map((e) => StudentModel.fromMap(e)).toList() : [];
    fillLists(students);
  }

  fillLists(List<StudentModel> stds) {
    this.students = stds;
    notifyListeners();
  }
}
