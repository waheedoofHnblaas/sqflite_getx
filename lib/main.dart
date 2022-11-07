import 'package:flutter/material.dart';
import 'package:flutter_sqflite_project/core/services/services.dart';
import 'package:flutter_sqflite_project/routes.dart';
import 'package:get/get.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initServices();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Sql',
      theme: ThemeData(
        backgroundColor: Colors.white,
        primaryColor: Colors.blueAccent,
        fontFamily: 'Cairo',
        appBarTheme: const AppBarTheme(
          centerTitle: true,
          titleTextStyle: TextStyle(
            fontSize: 21,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
          elevation: 0,
          backgroundColor: Colors.white,
          foregroundColor: Colors.black,
        ),
        primarySwatch: Colors.blue,
      ),
      getPages: routes,
    );
  }
}
