import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sqflite_project/core/constant/themes.dart';
import 'package:flutter_sqflite_project/core/services/services.dart';
import 'package:flutter_sqflite_project/main.dart';
import 'package:get/get.dart';

class ThemeController extends GetxController {
  MyServices myServices = Get.find();

  getThemeMode() {
    //l or d
    return myServices.sharedPreferences.getString('themeMode') ?? 'l';
  }

  getThemeModeMain() {
    //l or d
    String theme = getThemeMode();
    if (theme == 'l') {
      return ThemeMode.light;
    } else {
      return ThemeMode.dark;
    }
  }

  getThemeData() {
    //l or d
    String theme = getThemeMode();
    if (theme == 'l') {
      return lightTheme();
    } else {
      return darkTheme();
    }
  }

  changeThemeMode(context) async {
    //l or d
    String theme = getThemeMode();
    if (theme == 'l') {
      await myServices.sharedPreferences.setString('themeMode', 'd');
      ThemeSwitcher.of(context)
          .changeTheme(theme: darkTheme());
    } else {
      await myServices.sharedPreferences.setString('themeMode', 'l');
      ThemeSwitcher.of(context).changeTheme(theme: lightTheme(), isReversed: true);
    }
  }
}
