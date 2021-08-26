import 'package:aug_reg/providerr/courceProvider.dart';
import 'package:aug_reg/providerr/studentsProvider.dart';
import 'package:aug_reg/screens/home.dart';
import 'package:aug_reg/screens/splash.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

import 'dbHelpers/dbHelpers.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  var s = await DBHelper.dbHelper.initializeTasksDatabase();
  await DBHelper.dbHelper.connectToDatabase();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<StudentProvider>(
          create: (context) => StudentProvider(),
        ),
        ChangeNotifierProvider<CourceProvider>(
          create: (context) => CourceProvider(),
        ),
      ],
      child: GetMaterialApp(
        debugShowCheckedModeBanner: false,
        home: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          home: Splash(),
        ),
      ),
    );
  }
}
