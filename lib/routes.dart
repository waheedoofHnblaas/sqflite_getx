import 'package:flutter_sqflite_project/core/constant/approutes.dart';
import 'package:flutter_sqflite_project/view/screen/home.dart';
import 'package:flutter_sqflite_project/view/screen/note_data.dart';
import 'package:flutter_sqflite_project/view/screen/update_note.dart';
import 'package:get/get.dart';

import 'view/screen/add_note.dart';

List<GetPage<dynamic>>? routes = [
  GetPage(
    name: AppRoute.home,
    page: () => HomePage(),
  ),
  GetPage(
    name: AppRoute.addPage,
    page: () => AddNotePage(),
  ),
  GetPage(
    name: AppRoute.noteData,
    page: () => NoteDataPage(),
    transition: Transition.rightToLeft,
    // fullscreenDialog: false,
  ),
  GetPage(
    name: AppRoute.updatePage,
    page: () => UpdateNotePage(),
  ),
];
