import 'package:flutter/material.dart';
import 'package:flutter_sqflite_project/controller/home_controllers/process_controller.dart';
import 'package:get/get.dart';

class TypeChooserWidget extends StatelessWidget {
  TypeChooserWidget({
    Key? key,
    required this.controllerImp,
  }) : super(key: key);

  HomeProcessControllerImp controllerImp;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Get.theme.primaryColor.withOpacity(0.1),
        borderRadius: const BorderRadius.all(
          Radius.circular(8),
        ),
      ),
      height: Get.size.height * .06,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: controllerImp.notesType.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              controllerImp.type.text = controllerImp.notesType[index];
            },
            child: Card(
              color: Get.theme.backgroundColor.withOpacity(0.5),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5),
                child: Text(
                  controllerImp.notesType[index],
                  style: TextStyle(color: Get.theme.scaffoldBackgroundColor),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
