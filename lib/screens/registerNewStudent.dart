import 'package:aug_reg/models/studentModel.dart';
import 'package:aug_reg/providerr/studentsProvider.dart';
import 'package:aug_reg/screens/students.dart';
import 'package:aug_reg/widgets/button.dart';
import 'package:aug_reg/widgets/textFiled.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  var formKey = GlobalKey<FormState>();
  String? name;
  String? phone;
  String? age;
  String? spec;

  nullValidator(String value) {
    if (value == '' || value == null) {
      return 'required field';
    }
  }

  saveName(String value) {
    this.name = value;
  }

  savePhone(String value) {
    this.phone = value;
  }

  saveAge(String value) {
    this.age = value;
  }

  saveSpec(String value) {
    this.spec = value;
  }

  StudentModel? studentModel;

  saveForm(context) async {
    bool validate = formKey.currentState!.validate();

    if (validate) {
      formKey.currentState!.save();
      studentModel = StudentModel(
        name: name,
        age: age,
        spec: spec,
        phone: phone,
      );

       Provider.of<StudentProvider>(context, listen: false)
          .insertIntoStudentTable(studentModel!);
      Get.to(Students());
    } else {
      return;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text('تسجيل طالب جديد'),
        centerTitle: true,
      ),
      body: Container(
        width: double.infinity,
        child: Form(
          key: formKey,
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: 30,
                ),
                Text(
                  'تسجيل طالب جديد',
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 50,
                ),
                MyTextField(
                  label: 'الاسم',
                  icon: Icon(Icons.person),
                  keyboardType: TextInputType.name,
                  validateFun: nullValidator,
                  saveFun: saveName,
                ),
                SizedBox(
                  height: 24,
                ),
                MyTextField(
                  label: 'رقم الجوال',
                  icon: Icon(Icons.phone),
                  keyboardType: TextInputType.phone,
                  validateFun: nullValidator,
                  saveFun: savePhone,
                ),
                SizedBox(
                  height: 20,
                ),
                MyTextField(
                  label: 'العمر',
                  icon: Icon(Icons.calendar_today),
                  keyboardType: TextInputType.number,
                  validateFun: nullValidator,
                  saveFun: saveAge,
                ),
                SizedBox(
                  height: 20,
                ),
                MyTextField(
                  label: 'التخصص',
                  icon: Icon(Icons.school),
                  keyboardType: TextInputType.name,
                  validateFun: nullValidator,
                  saveFun: saveSpec,
                ),
                SizedBox(
                  height: 30,
                ),
                CustomButton(
                    onTap: () {
                      saveForm(context);
                    },
                    label: 'تسجيل')
              ],
            ),
          ),
        ),
      ),
    );
  }
}
