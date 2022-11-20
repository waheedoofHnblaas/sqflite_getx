import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sqflite_project/controller/home_controllers/process_controller.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class CommitAddButton extends StatelessWidget {
  const CommitAddButton({
    Key? key,
    required this.controllerImp,
  }) : super(key: key);

  final HomeProcessControllerImp controllerImp;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        FloatingActionButton(
          elevation: 1,
          backgroundColor: Get.theme.scaffoldBackgroundColor,
          shape: CircleBorder(
              side: BorderSide(
            width: 1,
            color: Get.theme.backgroundColor.withOpacity(0.6),
          )),
          onPressed: () {
            controllerImp.addNote(
              controllerImp.name.text,
              controllerImp.imagePath,
              controllerImp.desc.text,
              controllerImp.type.text,
            );
          },
          child: const Icon(
            Icons.done,
            color: Colors.greenAccent,
          ),
        ),
      ],
    );
  }
}
