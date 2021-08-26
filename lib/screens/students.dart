import 'dart:developer';

import 'package:aug_reg/providerr/studentsProvider.dart';
import 'package:aug_reg/screens/addCoures.dart';
import 'package:aug_reg/screens/registerNewStudent.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

class Students extends StatelessWidget {
  const Students({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          title: Text('الطلاب'),
          centerTitle: true,
         actions: [
           IconButton(icon: Icon(Icons.add),onPressed: (){
             Get.to(Register());
           },)
         ],
        ),

        body: Container(
          width: double.infinity,
          child: Consumer<StudentProvider>(
            builder: (context, value, child) => ListView.separated(
              separatorBuilder: (context, index) => SizedBox(
                height: 24,
              ),
              itemBuilder: (context, index) => ListTile(
                tileColor: Colors.white,
                title: Row(
                  children: [
                    Text(
                      'الاسم:',
                      style: TextStyle(fontSize: 24),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Text(
                      value.students[index].name!,
                      style: TextStyle(fontSize: 20),
                    ),
                  ],
                ),
                subtitle: Row(
                  children: [
                    Text(
                      'التخصص:',
                      style: TextStyle(fontSize: 24),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Text(
                      value.students[index].spec!,
                      style: TextStyle(fontSize: 20),
                    ),
                  ],
                ),
                leading: IconButton(
                  icon: Icon(
                    Icons.edit,
                    color: Colors.red,
                  ),
                  onPressed: () {
                    Get.to(AddCoures(
                      id: value.students[index].id,
                    ));
                  },
                ),
                trailing: Column(
                  children: [
                    Text(value.students[index].phone!),
                    SizedBox(
                      height: 24,
                    ),
                    Text(value.students[index].age!)
                  ],
                ),
              ),
              itemCount: value.students.length,
            ),
          ),
        ),
      ),
    );
  }
}
