import 'package:flutter/material.dart';
import 'package:get/get.dart';

SnackbarController AppSnackBar({required String title}) {
  return Get.showSnackbar(
    GetSnackBar(

      messageText: Center(
        child: Text(
          title,
          style: const TextStyle(color: Colors.white),
        ),
      ),
      duration: const Duration(
        seconds: 2,
      ),
    ),
  );
}
