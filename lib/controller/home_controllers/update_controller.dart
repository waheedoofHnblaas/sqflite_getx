import 'package:flutter/material.dart';
import 'package:flutter_sqflite_project/core/class/statusrequest.dart';
import 'package:flutter_sqflite_project/core/constant/approutes.dart';
import 'package:flutter_sqflite_project/core/services/services.dart';
import 'package:flutter_sqflite_project/data/datasource/local/sql_db.dart';
import 'package:flutter_sqflite_project/data/model/note_model.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class UpdateController extends GetxController {
  late GlobalKey<FormState> formState = GlobalKey<FormState>();
  TextEditingController name = TextEditingController();
  TextEditingController desc = TextEditingController();
  TextEditingController type = TextEditingController();
  MyServices myServices = Get.find();
  StatusRequest? statusRequest = StatusRequest.success;
  SqlDB sqlDB = SqlDB();
  String? imagePath = '';
  final ImagePicker _picker = ImagePicker();
  late int id;
  late NoteModel noteModel;

  @override
  void onInit() {
    noteModel = Get.arguments[NoteModel];
    id = noteModel.id!;
    name = TextEditingController(text: noteModel.name);
    desc = TextEditingController(text: noteModel.desc);
    type = TextEditingController(text: noteModel.type);
    imagePath = noteModel.image;
    super.onInit();
  }

  @override
  Future<int> updateNote(
    int id,
    String name,
    String? image,
    String desc,
    String type,
  ) async {
    if (formState.currentState!.validate() && imagePath != '') {
      print('========== update =========');
      statusRequest = StatusRequest.loading;
      update();
      int i = await sqlDB.updateData(
          'UPDATE Note SET name = "$name" ,image = "$image", desc = "$desc", type = "$type" WHERE id = "$id"');

      print('==========updateNote success i = $i ==========');

      if (i >= 0) {
        Get.offAllNamed(AppRoute.home);

        // statusRequest = StatusRequest.success;
        // update();
      } else {}
      return i;
    } else {
      print('not validate');
      return 0;
    }
  }

  @override
  Future<void> changeImage() async {
    final PickedFile? image =
        await _picker.getImage(source: ImageSource.gallery);

    if (!image.isNull) {
      print('================image!.path');
      print(image!.path);
      imagePath = image.path;
      update();
    }
  }
}
