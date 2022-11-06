import 'package:flutter/material.dart';
import 'package:flutter_sqflite_project/controller/home_controllers/process_controller.dart';
import 'package:flutter_sqflite_project/core/class/handelingview.dart';
import 'package:flutter_sqflite_project/view/widget/add/apptextfield.dart';
import 'package:flutter_sqflite_project/view/widget/add/insertcard_textfield.dart';
import 'package:flutter_sqflite_project/view/widget/app_button.dart';
import 'package:get/get.dart';

class AddNotePage extends StatelessWidget {
  const AddNotePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    HomeProcessControllerImp controllerImp = Get.find();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Note'),
        actions: [
          IconButton(
            onPressed: () {
              controllerImp.addNote(
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
        ],
      ),
      body: GetBuilder<HomeProcessControllerImp>(builder: (controller) {
        return HandelingView(
            statusRequest: controller.statusRequest!,
            widget: Container(
              margin: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
              child: SingleChildScrollView(
                child: Form(
                  key: controller.formState,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      InsertCardTextField(
                        name: 'Name',
                        desc: "Inter Note's Name",
                        textController: controllerImp.name,
                      ),
                      InsertCardTextField(
                        name: 'Desc',
                        desc: "Inter Note's Description",
                        textController: controllerImp.desc,
                      ),
                      InsertCardTextField(
                        name: 'Type',
                        desc: "Inter Note's Type",
                        textController: controllerImp.type,
                      ),
                      AppButton(
                        onPressed: () async {
                          await controllerImp.chooseImage();
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ));
      }),
    );
  }
}
