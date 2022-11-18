import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppButton extends StatelessWidget {
  AppButton({Key? key, required this.onPressed, required this.text}) : super(key: key);

  void Function()? onPressed;
  String text;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: MaterialButton(
        color: Get.theme.backgroundColor,
        height: 50,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(14),
          ),
        ),
        onPressed: onPressed,
        child: Text(
          text,
          style: TextStyle(
            color: Get.theme.scaffoldBackgroundColor,
          ),
        ),
      ),
    );
  }
}
