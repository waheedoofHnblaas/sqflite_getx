import 'package:flutter/material.dart';
import 'package:flutter_sqflite_project/controller/home_controllers/process_controller.dart';
import 'package:get/get.dart';

class AddFloatingButton extends StatelessWidget {
  const AddFloatingButton({
    Key? key,
    required this.controllerProcessImp,
  }) : super(key: key);

  final HomeProcessControllerImp controllerProcessImp;

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      backgroundColor: context.theme.primaryColor,
      foregroundColor: Get.theme.scaffoldBackgroundColor,
      onPressed: () async {
        controllerProcessImp.toAdd();
      },
      child: const Icon(Icons.add),
    );
  }
}