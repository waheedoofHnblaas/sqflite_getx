import 'dart:io';

import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_sqflite_project/controller/home_controllers/process_controller.dart';
import 'package:flutter_sqflite_project/core/class/statusrequest.dart';
import 'package:flutter_sqflite_project/view/widget/home/addFloatingButton.dart';
import 'package:flutter_sqflite_project/view/widget/home/homeAppNoteCard.dart';
import 'package:flutter_sqflite_project/view/widget/home/sub_desc_text.dart';
import 'package:flutter_sqflite_project/view/widget/search/appsearchwidget.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  HomeProcessControllerImp controllerProcessImp =
      Get.put(HomeProcessControllerImp());

  @override
  Widget build(BuildContext context) {
    return ThemeSwitchingArea(
      child: Scaffold(
        floatingActionButton:
            AddFloatingButton(controllerProcessImp: controllerProcessImp),
        appBar: AppBar(
          title: AppSearchWidget(),
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
              } else if (controller.notesList.isEmpty) {
                return Center(
                  child: Text(
                    'No Data',
                    style: TextStyle(
                        color: context.theme.primaryColor.withOpacity(0.7)),
                  ),
                );
              } else {
                return Container(
                  margin:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 0),
                  child: ListView.builder(
                    controller: controller.scrollController,
                    itemCount: controller.notesList.length,
                    itemBuilder: (context, index) {
                      return Column(
                        children: [
                          HomeAppNoteCard(controller: controller, index: index),
                          Divider(
                            color: context.theme.primaryColor,
                          )
                        ],
                      );
                    },
                  ),
                );
              }
            },
          ),
        ),
      ),
    );
  }
}
