import 'package:aug_reg/dbHelpers/dbHelpers.dart';
import 'package:aug_reg/models/courceModel.dart';
import 'package:aug_reg/models/studentModel.dart';
import 'package:flutter/material.dart';

class CourceProvider extends ChangeNotifier {
  List<CourceModel> cources = [];

  insertIntoCourceTable(CourceModel courceModel) async {
    await DBHelper.dbHelper.insertNewCource(courceModel);
    getAllCources();
  }

  // deleteBookFromTable(StudentModel studentModel) async {
  //   await DBHelper.dbHelper.deleteStudent(studentModel!.id!);
  //   getAllStudents();
  // }

  getAllCources() async {
    List<Map<String, dynamic>>? rows = await DBHelper.dbHelper.getAllCource();
    List<CourceModel> cources =
        rows != null ? rows.map((e) => CourceModel.fromMap(e)).toList() : [];
    fillLists(cources);
  }

  fillLists(List<CourceModel> crs) {
    this.cources = crs;
    notifyListeners();
  }
}
