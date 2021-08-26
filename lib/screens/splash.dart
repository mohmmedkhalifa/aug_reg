import 'package:aug_reg/providerr/courceProvider.dart';
import 'package:aug_reg/providerr/studentsProvider.dart';
import 'package:aug_reg/screens/home.dart';
import 'package:aug_reg/screens/students.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import 'package:provider/provider.dart';

class Splash extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
    ));

    Future.delayed(Duration(seconds: 2)).then((value) {
      Provider.of<StudentProvider>(context, listen: false).getAllStudents();
      Provider.of<CourceProvider>(context, listen: false).getAllCources();

      Provider.of<StudentProvider>(context, listen: false).students.length == 0
          ? Get.to(Home())
          : Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) {
                  return Students();
                },
              ),
            );
    });
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
                fit: BoxFit.contain,
                image: AssetImage(
                  'assets/aug.jpg',
                )),
          ),
        ),
      ),
    );
  }
}
