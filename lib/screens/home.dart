import 'package:aug_reg/screens/registerNewStudent.dart';
import 'package:aug_reg/screens/students.dart';
import 'package:aug_reg/widgets/button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 160,
            ),
            Text(
              'أهلا بك في جامعة الأزهر',
              style: TextStyle(
                fontSize: 36,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Image.asset(
              'assets/aug.jpg',
              width: 180,
              height: 180,
            ),
            SizedBox(
              height: 50,
            ),
            CustomButton(
              onTap: () {
                Get.to(()=> Register());
              },
              label: 'تسجيل طالب جديد',
            ),
            SizedBox(
              height: 30,
            ),
            CustomButton(
              onTap: () {
                Get.to(Students());
              },
              label: 'الطلبة',
            )
          ],
        ),
      ),
    );
  }
}
