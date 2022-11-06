import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppButton extends StatelessWidget {
  AppButton({Key? key, required this.onPressed}) : super(key: key);

  void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      color: Get.theme.primaryColor,
      height: 50,
      minWidth: Get.width - 33,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(14),
        ),
      ),
      onPressed: onPressed,
      child:  Text(
        'Add Note',
        style: TextStyle(
          color: Get.theme.backgroundColor,
        ),
      ),
    );
  }
}
