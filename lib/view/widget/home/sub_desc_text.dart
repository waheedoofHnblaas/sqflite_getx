import 'package:animated_theme_switcher/animated_theme_switcher.dart';
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
    return ThemeSwitcher(
      builder:(context)=> Text(
        text.length > l
            ? text.replaceRange(
                l,
                l + (text.length - l),
                ' ...... ',
              )
            : text,
        textAlign: TextAlign.center,
        style: TextStyle(color: context.theme.primaryColor),
      ),
    );
  }
}
