import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_sqflite_project/controller/home_controllers/getimages_controller.dart';
import 'package:flutter_sqflite_project/controller/home_controllers/process_controller.dart';
import 'package:flutter_sqflite_project/core/class/statusrequest.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    HomeNotesControllerImp controllerImp = Get.put(HomeNotesControllerImp());
    HomeProcessControllerImp controllerProcessImp =
        Get.put(HomeProcessControllerImp());
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          controllerImp.toAdd();
        },
        child: const Icon(Icons.add),
      ),
      appBar: AppBar(
        title: const Text('Notes'),
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          await controllerProcessImp.getNotes();
        },
        child: GetBuilder<HomeProcessControllerImp>(
          builder: (controller) {
            if (StatusRequest.loading == controller.statusRequest) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }else if(controller.notesList.isEmpty){
              return const Center(child: Text('No Data'),);
            } else {
              return Center(
                child: ListView.builder(
                  itemCount: controller.notesList.length,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () async {
                        await controller
                            .deleteNote(controller.notesList[index].id!);
                      },
                      child: ListTile(
                        title: Text(
                          controller.notesList[index].name!,
                        ),
                        trailing: Text(
                          controller.notesList[index].id!.toString(),
                        ),
                        leading: SizedBox(
                            width: 30,
                            height: 30,
                            child: Image.file(
                                File(controller.notesList[index].image!))),
                        subtitle: Text(
                          controller.notesList[index].desc!,
                        ),
                      ),
                    );
                  },
                ),
              );
            }
          },
        ),
      ),
    );
  }
}
