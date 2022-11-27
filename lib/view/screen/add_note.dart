import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_sqflite_project/controller/home_controllers/process_controller.dart';
import 'package:flutter_sqflite_project/core/class/handelingview.dart';
import 'package:flutter_sqflite_project/view/widget/add/insertcard_textfield.dart';
import 'package:flutter_sqflite_project/view/widget/add/typeChooserWidget.dart';
import 'package:flutter_sqflite_project/view/widget/app_button.dart';
import 'package:get/get.dart';

import '../widget/add/commitAddButton.dart';

// ignore: must_be_immutable
class AddNotePage extends StatelessWidget {
  AddNotePage({Key? key}) : super(key: key);

  HomeProcessControllerImp controllerImp = Get.find();

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
        title: const Text('Add Note'),
      ),
      body: GetBuilder<HomeProcessControllerImp>(builder: (controller) {
        return HandelingView(
            statusRequest: controller.statusRequest!,
            widget: Container(
              margin: const EdgeInsets.symmetric(
                horizontal: 30,
                vertical: 10,
              ),
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
                      TypeChooserWidget(controllerImp: controllerImp),
                      InsertCardTextField(
                        name: 'Type',
                        desc: "Inter Note's Type",
                        textController: controllerImp.type,
                      ),
                      Row(
                        children: [
                          AppButton(
                            text: 'Add Image',
                            onPressed: () async {
                              await controllerImp.chooseImage();
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
                      CommitAddButton(controllerImp: controllerImp),
                    ],
                  ),
                ),
              ),
            ));
      }),
    );
  }

  Container FoundImageCard() {
    return Container(
      child: controllerImp.imagePath.isEmpty
          ? Text(
              'Img ?',
              style: TextStyle(fontSize: 21, color: Get.theme.backgroundColor),
            )
          : SizedBox(
              width: 50,
              height: 50,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8.0),
                child: Image.file(
                  width: 50,
                  height: 80,
                  fit: BoxFit.fill,
                  File(controllerImp.imagePath),
                ),
              ),
            ),
    );
  }
}
