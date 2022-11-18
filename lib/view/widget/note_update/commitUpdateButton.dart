import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sqflite_project/controller/home_controllers/process_controller.dart';
import 'package:flutter_sqflite_project/controller/home_controllers/update_controller.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class CommitUpdateButton extends StatelessWidget {
  const CommitUpdateButton({
    Key? key,
    required this.controllerImp,
  }) : super(key: key);

  final UpdateController controllerImp;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: 55,
          height: 55,
          decoration: BoxDecoration(
            color: Get.theme.scaffoldBackgroundColor,
            borderRadius: const BorderRadius.all(
              Radius.circular(100),
            ),
            border: Border.all(
              width: 1,
              color: Get.theme.backgroundColor.withOpacity(0.6),
            ),
          ),
          child: IconButton(
            onPressed: () {
              controllerImp.updateNote(
                controllerImp.id,
                controllerImp.name.text,
                controllerImp.imagePath,
                controllerImp.desc.text,
                controllerImp.type.text,
              );
            },
            icon: const Icon(
              Icons.done,
              color: Colors.greenAccent,
            ),
          ),
        ),
      ],
    );
  }
}