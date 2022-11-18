import 'package:flutter/material.dart';
import 'package:flutter_sqflite_project/controller/home_controllers/theme_controller.dart';
import 'package:flutter_sqflite_project/core/constant/themes.dart';
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
    ThemeController themeController = Get.put(ThemeController());
    return GetBuilder<ThemeController>(
      builder: (controller) {

        return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Sql',

          themeMode: controller.getThemeModeMain(),
          darkTheme: darkTheme(),
          theme: lightTheme(),
          getPages: routes,
        );
      },
    );
  }
}


