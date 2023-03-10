import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sqflite_project/controller/home_controllers/notedata_controller.dart';
import 'package:flutter_sqflite_project/controller/home_controllers/process_controller.dart';
import 'package:flutter_sqflite_project/data/model/note_model.dart';
import 'package:flutter_sqflite_project/view/widget/note_data/editeRowCard.dart';
import 'package:get/get.dart';

class NoteDataPage extends StatelessWidget {
  NoteDataPage({
    Key? key,
  }) : super(key: key);

  NoteDataControllerImp controllerImp = Get.put(NoteDataControllerImp());
  HomeProcessControllerImp homeProcessControllerImp = Get.find();

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
        title: ListTile(
          contentPadding: const EdgeInsets.all(10),
          title: Text(
            controllerImp.noteModel.name!,
            textAlign: TextAlign.center,
            style: TextStyle(color: Get.theme.primaryColor),
          ),
          subtitle: Text(
            controllerImp.noteModel.type!,
            style: TextStyle(
              fontSize: 11,
              color: Get.theme.primaryColor.withOpacity(0.8),
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ),
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Stack(
          children: [
            ListView(
              children: [
                Stack(
                  children: [
                    Positioned(
                      top: Get.height / 3,
                      left: Get.width / 2.5,
                      right: Get.width / 2.5,
                      child: CircularProgressIndicator(),
                    ),
                    Center(
                      child: ImageWidget(),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Text(
                    controllerImp.noteModel.desc!,
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Get.theme.primaryColor),
                  ),
                ),
                const SizedBox(
                  height: 100,
                )
              ],
            ),
            EditeRowCard(
              homeProcessControllerImp: homeProcessControllerImp,
              controllerImp: controllerImp,
            )
          ],
        ),
      ),
    );
  }

  ClipRRect ImageWidget() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10.0),
      child: Image.file(
        errorBuilder: (context, error, stackTrace) => Image.asset(
          height: Get.height / 1.8,
          fit: BoxFit.fill,
          controllerImp.noteModel.image!,
        ),
        height: Get.height / 1.8,
        fit: BoxFit.fill,
        File(controllerImp.noteModel.image!),
      ),
    );
  }
}
