import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_sqflite_project/controller/home_controllers/notedata_controller.dart';
import 'package:flutter_sqflite_project/controller/home_controllers/process_controller.dart';
import 'package:flutter_sqflite_project/data/model/note_model.dart';
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
      backgroundColor: Colors.white,
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
                    height: Get.height / 1.6,
                    fit: BoxFit.fill,
                    File(controllerImp.noteModel.image!),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Text(
                    controllerImp.noteModel.desc!,
                    textAlign: TextAlign.center,
                  ),
                ),
                const SizedBox(
                  height: 100,
                )
              ],
            ),
            Positioned(
              bottom: 10,
              left: 10,
              right: 10,
              child: Container(
                padding: const EdgeInsets.all(6),
                decoration: BoxDecoration(
                  color: Colors.blueAccent.withOpacity(0.8),
                  borderRadius: const BorderRadius.all(Radius.circular(18)),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    IconButton(
                      onPressed: () {

                      },
                      icon: const Icon(
                        Icons.favorite_border,
                      ),
                      color: Get.theme.backgroundColor,
                    ),
                    IconButton(
                      onPressed: () {

                      },
                      icon: const Icon(
                        Icons.edit,
                      ),
                      color: Get.theme.backgroundColor,
                    ),
                    IconButton(
                      onPressed: () async {
                        await homeProcessControllerImp
                            .deleteNote(controllerImp.noteModel.id!);
                      },
                      icon: const Icon(
                        Icons.delete,
                      ),
                      color: Get.theme.backgroundColor,
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
