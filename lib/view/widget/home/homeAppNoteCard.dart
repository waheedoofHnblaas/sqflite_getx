import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_sqflite_project/controller/home_controllers/process_controller.dart';
import 'package:flutter_sqflite_project/data/model/note_model.dart';
import 'package:flutter_sqflite_project/view/widget/home/noteDialogData.dart';
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
        controller.toNoteData(controller.notesList[index]);
      },
      onLongPress: (() {
        noteDialogDataWidget(controller.notesList[index]);
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
          leading: ImageWidget(),
          subtitle: SubText(
            text: controller.notesList[index].desc!,
          ),
        ),
      ),
    );
  }





  ClipRRect ImageWidget() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(8.0),
      child: Image.file(
        errorBuilder: (context, error, stackTrace) => Image.asset(
          width: 50,
          height: 80,
          fit: BoxFit.fill,
          controller.notesList[index].image!,
        ),
        width: 50,
        height: 80,
        fit: BoxFit.fill,
        File(controller.notesList[index].image!),
      ),
    );
  }
}
