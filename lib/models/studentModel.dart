import 'package:aug_reg/dbHelpers/dbHelpers.dart';

class StudentModel {
  int? id;
  String? name;
  String? phone;
  String? age;
  String? spec;

  StudentModel({
    this.id,
    this.phone,
    this.age,
    this.spec,
    this.name,
  });

  StudentModel.fromMap(Map map) {
    this.id = map[DBHelper.stdId];
    this.name = map[DBHelper.stdName];
    this.age = map[DBHelper.stdAge];
    this.phone = map[DBHelper.stdPhone];
    this.spec = map[DBHelper.stdSpec];
  }

  Map<String, dynamic> toMap() {
    return {
      DBHelper.stdName: this.name,
      DBHelper.stdAge: this.age,
      DBHelper.stdPhone: this.phone,
      DBHelper.stdSpec: this.spec,
    };
  }
}
