import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_sqflite_project/controller/home_controllers/process_controller.dart';
import 'package:flutter_sqflite_project/data/model/note_model.dart';
import 'package:get/get.dart';

Future<dynamic> noteDialogDataWidget(NoteModel notesList) {
  HomeProcessControllerImp controller = Get.find();
  return Get.defaultDialog(
    contentPadding: const EdgeInsets.symmetric(horizontal: 20),
    backgroundColor: Get.theme.scaffoldBackgroundColor,
    title: notesList.type!,
    titleStyle: TextStyle(
      color: Get.theme.primaryColor,
      fontSize: 13,
    ),
    content: Stack(
      children: [
        SizedBox(
          child: Column(
            children: [
              FierstRow(notesList),
              const SizedBox(
                height: 20,
              ),
              DescWidget(notesList)
            ],
          ),
        ),
        Positioned(
          top: 0,
          right: 5,
          child: NavButton(controller, notesList),
        ),
      ],
    ),
  );
}

SizedBox DescWidget(NoteModel notesList) {
  return SizedBox(
    height: Get.height / 3,
    child: SingleChildScrollView(
      child: Column(
        children: [
          Text(
            notesList.desc!,
            textAlign: TextAlign.center,
            style: TextStyle(color: Get.theme.primaryColor),
          ),
        ],
      ),
    ),
  );
}

FloatingActionButton NavButton(
    HomeProcessControllerImp controller, NoteModel notesList) {
  return FloatingActionButton(
    elevation: 0,
    backgroundColor: Get.theme.primaryColor,
    onPressed: () {
      Get.back();
      controller.toNoteData(notesList);
    },
    child: Icon(
      Icons.arrow_right,
      color: Get.theme.scaffoldBackgroundColor,
    ),
  );
}

Row FierstRow(NoteModel notesList) {
  return Row(
    children: [
      ClipRRect(
        borderRadius: BorderRadius.circular(33.0),
        child: Image.file(
          errorBuilder: (context, error, stackTrace) => Image.asset(
            width: 44,
            height: 44,
            fit: BoxFit.fill,
            notesList.image!,
          ),
          width: 44,
          height: 44,
          fit: BoxFit.fill,
          File(notesList.image!),
        ),
      ),
      const SizedBox(
        width: 20,
      ),
      Text(
        notesList.name!,
        style: TextStyle(
          color: Get.theme.primaryColor,
          fontWeight: FontWeight.bold,
        ),
      ),
    ],
  );
}
