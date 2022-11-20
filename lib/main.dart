import 'package:flutter/material.dart';
import 'package:flutter_sqflite_project/controller/home_controllers/theme_controller.dart';
import 'package:flutter_sqflite_project/core/constant/themes.dart';
import 'package:flutter_sqflite_project/core/services/services.dart';
import 'package:flutter_sqflite_project/routes.dart';
import 'package:get/get.dart';
import 'package:animated_theme_switcher/animated_theme_switcher.dart';
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initServices();
  runApp( MyApp());
}

class MyApp extends StatelessWidget {
   MyApp({super.key});
  ThemeController themeController = Get.put(ThemeController());

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetBuilder<ThemeController>(
      builder: (controller) {

        return ThemeProvider(
          duration: const Duration(milliseconds: 400),
          initTheme: controller.getThemeData(),
          builder: (p0, theme) =>  GetMaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Sql',

            themeMode: controller.getThemeModeMain(),
            darkTheme: darkTheme(),
            theme: theme,
            getPages: routes,
          ),
        );
      },
    );
  }
}


