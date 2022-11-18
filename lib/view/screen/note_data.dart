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
        title: Text(controllerImp.noteModel.name!),
      ),
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Stack(
          children: [
            ListView(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(10.0),
                  child: Image.file(
                    height: Get.height / 1.8,
                    fit: BoxFit.fill,
                    File(controllerImp.noteModel.image!),
                  ),
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
}
