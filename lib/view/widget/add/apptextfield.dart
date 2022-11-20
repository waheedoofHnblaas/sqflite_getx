import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppTextField extends StatelessWidget {
  AppTextField({
    Key? key,
    required this.type,
    required this.iconData,
    required this.inputType,
    required this.onChanged,
    required this.validator,
    this.obscureText = false,
    this.onTap,
    this.line = 1,
    required this.textFieldController,
  }) : super(key: key);

  late String type;
  late int line;
  late bool obscureText;
  late IconData iconData;
  late TextInputType inputType;
  late String? Function(String?)? onChanged;
  late String? Function(String?)? validator;
  final void Function()? onTap;
  late TextEditingController textFieldController;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(18)),
        color: Get.theme.primaryColor.withOpacity(0.1),
      ),
      child: TextFormField(
        maxLines: line,
        textAlign: TextAlign.center,
        controller: textFieldController,
        validator: validator,
        keyboardType: inputType,
        obscureText: obscureText,
        style: TextStyle(color: Get.theme.primaryColor),
        autovalidateMode: AutovalidateMode.onUserInteraction,
        decoration: InputDecoration(
          hintTextDirection: TextDirection.ltr,
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Get.theme.backgroundColor),
            borderRadius: BorderRadius.circular(18),
          ),
          suffixIcon: IconButton(
            onPressed: onTap,
            icon: Icon(
              color: Get.theme.primaryColor.withOpacity(0.2),
              iconData,
            ),
          ),
          label: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Text(
              type,
              style: TextStyle(color: Get.theme.primaryColor),
            ),
          ),
          floatingLabelBehavior: FloatingLabelBehavior.always,
          hintText: type,
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
          ),
        ),
        onChanged: onChanged,
      ),
    );
  }
}
