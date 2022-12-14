import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_sqflite_project/controller/home_controllers/process_controller.dart';
import 'package:flutter_sqflite_project/data/model/note_model.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class SearchFilter extends StatelessWidget {
  SearchFilter({Key? key, required this.query}) : super(key: key);
  String query;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeProcessControllerImp>(builder: (controller) {
      List<NoteModel> filterNames = controller.notesList
          .where(
            (element) =>
                (element.name!.toLowerCase().trim().contains(
                      query.toLowerCase().trim(),
                    )) ||
                (element.desc!.toLowerCase().trim().contains(
                      query.toLowerCase().trim(),
                    )) ||
                (element.type!.toLowerCase().trim().contains(
                      query.toLowerCase().trim(),
                    )) ||
                (element.image!.toLowerCase().trim().contains(
                      query.toLowerCase().trim(),
                    )),
          )
          .toList();

      return SizedBox(
        height: double.maxFinite,
        child: filterNames.isEmpty
            ? Center(
                child: Text(
                'No Notes',
                style: TextStyle(color: Get.theme.primaryColor),
              ))
            : ListView.builder(
                itemCount: filterNames.length,
                itemBuilder: (context, index) => Column(
                  children: [
                    InkWell(
                      onTap: () {
                        query != ''
                            ? controller.toNoteData(filterNames[index])
                            : controller
                                .toNoteData(controller.notesList[index]);
                      },
                      child: ListTile(
                        leading: ClipRRect(
                          borderRadius: BorderRadius.circular(33.0),
                          child: query != ''
                              ? Image.file(
                            errorBuilder: (context, error, stackTrace) => Image.asset(
                              width: 44,
                              height: 44,
                              fit: BoxFit.fill,
                              filterNames[index].image!,
                            ),
                            width: 44,
                            height: 44,
                            fit: BoxFit.fill,
                            File(filterNames[index].image!),
                          ) :Image.file(
                            errorBuilder: (context, error, stackTrace) => Image.asset(
                              width: 44,
                              height: 44,
                              fit: BoxFit.fill,
                              controller.notesList[index].image!,
                            ),
                            width: 44,
                            height: 44,
                            fit: BoxFit.fill,
                            File(controller.notesList[index].image!),
                          ),
                        ),
                        title: query != ''
                            ? Text(
                                filterNames[index].name.toString(),
                                style: TextStyle(color: Get.theme.primaryColor),
                              )
                            : Text(
                                controller.notesList[index].name.toString(),
                                style: TextStyle(color: Get.theme.primaryColor),
                              ),
                        trailing: query != ''
                            ? Text(
                                filterNames[index].type!,
                                style: TextStyle(color: Get.theme.primaryColor),
                              )
                            : Text(
                                controller.notesList[index].type!,
                                style: TextStyle(color: Get.theme.primaryColor),
                              ),
                      ),
                    ),
                    Divider(
                      color: Get.theme.primaryColor.withOpacity(0.4),
                      indent: 11,
                      endIndent: 11,
                    ),
                  ],
                ),
              ),
      );
    });
  }
}
