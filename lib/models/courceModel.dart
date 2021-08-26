import 'package:aug_reg/dbHelpers/dbHelpers.dart';

class CourceModel {
  int? id;
  String? title;
  String? grade;
  int? stdId;

  CourceModel({
    this.id,
    this.title,
    this.grade,
    this.stdId,
  });

  CourceModel.fromMap(Map map) {
    this.id = map[DBHelper.crsId];
    this.title = map[DBHelper.title];
    this.grade = map[DBHelper.grade];
    this.stdId = map[DBHelper.stdIID];
  }

  Map<String, dynamic> toMap() {
    return {
      DBHelper.title: this.title,
      DBHelper.grade: this.grade,
      DBHelper.stdIID: this.stdId,
    };
  }
}
