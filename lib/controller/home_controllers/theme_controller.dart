import 'package:flutter/material.dart';
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

  changeThemeMode() {
    //l or d
    String theme = getThemeMode();
    if (theme == 'l') {
      myServices.sharedPreferences.setString('themeMode', 'd');

    } else {
      myServices.sharedPreferences.setString('themeMode', 'l');
    }
    update();
  }
}
