import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_sqflite_project/controller/home_controllers/process_controller.dart';
import 'package:flutter_sqflite_project/view/widget/home/sub_desc_text.dart';
import 'package:get/get.dart';

class HomeAppNoteCard extends StatelessWidget {
  HomeAppNoteCard({Key? key, required this.controller, required this.index})
      : super(key: key);
  HomeProcessControllerImp controller;
  int index;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async {
        // await controller
        //     .deleteNote(controller.notesList[index].id!);
        controller.toNoteData(controller.notesList[index]);
      },
      onLongPress: (() {
        Get.defaultDialog(
          contentPadding: const EdgeInsets.symmetric(horizontal: 20),
          backgroundColor: Get.theme.scaffoldBackgroundColor,
          title: controller.notesList[index].type!,
          titleStyle: TextStyle(
            color: Get.theme.primaryColor,
            fontSize: 13,
          ),
          content: Stack(
            children: [
              SizedBox(
                child: Column(
                  children: [
                    Row(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(33.0),
                          child: Image.file(
                            width: 44,
                            height: 44,
                            fit: BoxFit.fill,
                            File(controller.notesList[index].image!),
                          ),
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        Text(
                          controller.notesList[index].name!,
                          style: TextStyle(
                            color: Get.theme.primaryColor,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    SizedBox(
                      height: Get.height / 3,
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            Text(
                              controller.notesList[index].desc!,
                              textAlign: TextAlign.center,
                              style: TextStyle(color: Get.theme.primaryColor),
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Positioned(
                  top: 0,
                  right: 5,
                  child: FloatingActionButton(
                    elevation: 0,
                    backgroundColor: Get.theme.primaryColor,
                    onPressed: () {
                      Get.back();
                      controller.toNoteData(controller.notesList[index]);
                    },
                    child: Icon(
                      Icons.arrow_right,
                      color: Get.theme.scaffoldBackgroundColor,
                    ),
                  )),
            ],
          ),
        );
      }),
      child: Padding(
        padding: const EdgeInsets.all(3.0),
        child: ListTile(
          title: Text(
            controller.notesList[index].name!,
            style: TextStyle(fontSize: 18, color: context.theme.primaryColor),
            textAlign: TextAlign.center,
          ),
          trailing: controller.notesList[index].fav == 1
              ? const Icon(
                  Icons.favorite,
                  color: Colors.red,
                )
              : Icon(
                  Icons.favorite_border,
                  color: Get.theme.primaryColor,
                ),
          leading: ClipRRect(
            borderRadius: BorderRadius.circular(8.0),
            child: Image.file(
              width: 50,
              height: 80,
              fit: BoxFit.fill,
              File(controller.notesList[index].image!),
            ),
          ),
          subtitle: SubText(
            text: controller.notesList[index].desc!,
          ),
        ),
      ),
    );
  }
}
