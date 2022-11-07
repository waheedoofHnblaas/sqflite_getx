import 'package:flutter/material.dart';
import 'package:flutter_sqflite_project/controller/home_controllers/process_controller.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class SearchFilter extends StatelessWidget {
  SearchFilter({Key? key, required this.query}) : super(key: key);
  String query;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeProcessControllerImp>(builder: (controller) {
      List filterNames = controller.notesList
          .where(
            (element) => element.name!.toLowerCase().trim().contains(
                  query.toLowerCase().trim(),
                ),
          )
          .toList();

      return SizedBox(
        height: double.maxFinite,
        child: ListView.builder(
          itemCount: filterNames.length,
          itemBuilder: (context, index) => InkWell(
            onTap: () {
              query != ''
                  ? controller.toNoteData(index)
                  : controller.toNoteData(index);
            },
            child: ListTile(
              title: query != ''
                  ? Text(
                      filterNames[index].name.toString(),
                    )
                  : Text(
                      controller.notesList[index].name.toString(),
                    ),
              trailing: query != ''
                  ? Text(
                      '${filterNames[index].type} ',
                    )
                  : Text(
                      '${controller.notesList[index].type} ',
                    ),
            ),
          ),
        ),
      );
    });
  }
}
