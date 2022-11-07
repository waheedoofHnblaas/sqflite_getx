import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_sqflite_project/controller/home_controllers/process_controller.dart';
import 'package:flutter_sqflite_project/view/widget/home/sub_desc_text.dart';

class HomeAppNoteCard extends StatelessWidget {
  HomeAppNoteCard({Key? key,required this.controller,required this.index}) : super(key: key);
  HomeProcessControllerImp controller;
  int index;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async {
        // await controller
        //     .deleteNote(controller.notesList[index].id!);
        controller.toNoteData(index);
      },
      child: Padding(
        padding: const EdgeInsets.all(3.0),
        child: ListTile(
          title: Text(
            controller.notesList[index].name!,
            style: const TextStyle(fontSize: 18),
            textAlign: TextAlign.center,
          ),
          trailing: Text(
            controller.notesList[index].id!.toString(),
          ),
          leading:ClipRRect(
            borderRadius: BorderRadius.circular(8.0),
            child: Image.file(

              width: 50,
              height: 80,
              fit: BoxFit.fill,
              File(controller.notesList[index].image!),
            ),
          ),
          subtitle: SubText(
              text: controller.notesList[index].desc!),
        ),
      ),
    );
  }
}
