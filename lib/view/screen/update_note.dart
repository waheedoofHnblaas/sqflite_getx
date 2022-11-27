import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_sqflite_project/controller/home_controllers/process_controller.dart';
import 'package:flutter_sqflite_project/controller/home_controllers/update_controller.dart';
import 'package:flutter_sqflite_project/core/class/handelingview.dart';
import 'package:flutter_sqflite_project/view/widget/add/apptextfield.dart';
import 'package:flutter_sqflite_project/view/widget/add/insertcard_textfield.dart';
import 'package:flutter_sqflite_project/view/widget/app_button.dart';
import 'package:flutter_sqflite_project/view/widget/note_update/commitUpdateButton.dart';
import 'package:get/get.dart';

class UpdateNotePage extends StatelessWidget {
  UpdateNotePage({Key? key}) : super(key: key);

  UpdateController controllerImp = Get.put(UpdateController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: const Icon(Icons.arrow_back_ios_new),
        ),
        title: const Text('Update Note'),
      ),
      body: GetBuilder<UpdateController>(builder: (controller) {
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
                      Row(
                        children: [
                          AppButton(
                            text: 'Update Image',
                            onPressed: () async {
                              await controllerImp.changeImage();
                            },
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          FoundImageCard()
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      CommitUpdateButton(controllerImp: controllerImp)
                    ],
                  ),
                ),
              ),
            ));
      }),
    );
  }
  Widget FoundImageCard() {
    return      SizedBox(
      width: 50,
      height: 50,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8.0),
        child: Image.file(
          errorBuilder: (context, error, stackTrace) => Image.asset(
            width: 50,
            height: 80,
            fit: BoxFit.fill,
            controllerImp.imagePath!,
          ),
          width: 50,
          height: 80,
          fit: BoxFit.fill,
          File(controllerImp.imagePath!),
        ),
      ),
    );
  }
}
