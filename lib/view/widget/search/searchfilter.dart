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
                            ? controller.toNoteData(index)
                            : controller.toNoteData(index);
                      },
                      child: ListTile(
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
                                '${filterNames[index].type} ',
                                style: TextStyle(color: Get.theme.primaryColor),
                              )
                            : Text(
                                '${controller.notesList[index].type} ',
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
