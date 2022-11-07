import 'package:flutter_sqflite_project/data/model/note_model.dart';
import 'package:get/get.dart';

abstract class NoteDataController extends GetxController {}

class NoteDataControllerImp extends NoteDataController {
  late NoteModel noteModel;

  @override
  void onInit() {
    noteModel = Get.arguments[NoteModel];
    update();
    super.onInit();
  }
}
