import 'package:flutter/material.dart';
import 'package:get/get.dart';

SnackbarController AppSnackBar({required String title}) {
  return Get.showSnackbar(
    GetSnackBar(borderColor: Get.theme.primaryColor,
      borderRadius: 12,
      margin: const EdgeInsets.symmetric(horizontal: 88),
      padding: const EdgeInsets.all(0),
      messageText: Container(
        decoration:  BoxDecoration(
          borderRadius: const BorderRadius.vertical(
            top: Radius.circular(12),
          ),
          color: Get.theme.scaffoldBackgroundColor,
        ),
        height: 30,
        child: Center(
          child: Text(
            title,
            style: const TextStyle(
              color: Colors.green,
              fontSize: 11,
            ),
          ),
        ),
      ),
      duration: const Duration(
        seconds: 1,
      ),
    ),
  );
}
