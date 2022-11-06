import 'package:flutter_sqflite_project/core/constant/approutes.dart';
import 'package:flutter_sqflite_project/view/screen/home.dart';
import 'package:get/get.dart';

import 'view/screen/add_note.dart';


List<GetPage<dynamic>>? routes = [
  GetPage(
    name: AppRoute.home,
    page: () =>  const HomePage(),
  ),
  GetPage(
    name: AppRoute.addPage,
    page: () =>  const AddNotePage(),
  ),
];
