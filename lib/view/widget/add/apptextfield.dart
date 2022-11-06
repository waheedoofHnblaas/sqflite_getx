import 'package:flutter/material.dart';


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
    required this.textFieldController,
  }) : super(key: key);

  late String type;
  late bool obscureText;
  late IconData iconData;
  late TextInputType inputType;
  late String? Function(String?)? onChanged;
  late String? Function(String?)? validator;
  final void Function()? onTap;
  late TextEditingController textFieldController;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      textAlign: TextAlign.center,
      controller: textFieldController,
      validator: validator,
      keyboardType: inputType,
      obscureText: obscureText,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      decoration: InputDecoration(
        hintTextDirection: TextDirection.ltr,
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(),
          borderRadius: BorderRadius.circular(18),
        ),
        suffixIcon: IconButton(
          onPressed: onTap,
          icon: Icon(
            iconData,
          ),
        ),
        label: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Text(
            type,

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
    );
  }
}
