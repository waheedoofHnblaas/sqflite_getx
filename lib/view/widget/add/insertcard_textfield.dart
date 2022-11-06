import 'package:flutter/material.dart';
import 'package:flutter_sqflite_project/core/function/validinput.dart';
import 'package:flutter_sqflite_project/view/widget/add/apptextfield.dart';

class InsertCardTextField extends StatelessWidget {
  InsertCardTextField({
    Key? key,
    required this.name,
    required this.desc,
    required this.textController,
  }) : super(key: key);

  String name;
  String desc;
  TextEditingController textController;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          desc,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        const SizedBox(
          height: 15,
        ),
        AppTextField(

          type: name,
          iconData: Icons.drive_file_rename_outline,
          inputType: TextInputType.name,
          onChanged: (val) {
            print('$name : ${textController.text}');
          },
          validator: (val) {
           return validInput(textController.text, 3, 100, name);
          },
          textFieldController: textController,
        ),
        const Divider(
          height: 40,
        ),
      ],
    );
  }
}
