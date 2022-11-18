import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SubText extends StatelessWidget {
  SubText({
    Key? key,
    required this.text,
  }) : super(key: key);

  String text;
  final l = 33;

  @override
  Widget build(BuildContext context) {
    return Text(
      text.length > l
          ? text.replaceRange(
              l,
              l + (text.length - l),
              ' ...... ',
            )
          : text,
      textAlign: TextAlign.center,
      style: TextStyle(color: Get.theme.primaryColor),
    );
  }
}
