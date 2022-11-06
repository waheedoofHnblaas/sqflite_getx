import 'package:flutter/material.dart';
import 'package:flutter_sqflite_project/controller/home_controllers/getimages_controller.dart';
import 'package:flutter_sqflite_project/core/class/statusrequest.dart';
import 'package:flutter_sqflite_project/core/constant/approutes.dart';
import 'package:flutter_sqflite_project/core/function/handlingdata.dart';
import 'package:flutter_sqflite_project/core/services/services.dart';
import 'package:flutter_sqflite_project/data/datasource/local/sql_db.dart';
import 'package:flutter_sqflite_project/data/model/note_model.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

abstract class HomeProcessController extends GetxController {
  Future<void> chooseImage();

  Future<int> addNote(String name, String image, String desc, String type);
  Future<List<NoteModel>> getNotes();
  Future<int> deleteNote(int id);
}

class HomeProcessControllerImp extends HomeProcessController {
  MyServices myServices = Get.find();
  StatusRequest? statusRequest = StatusRequest.success;
  SqlDB sqlDB = SqlDB();
  late GlobalKey<FormState> formState = GlobalKey<FormState>();
  TextEditingController name = TextEditingController();
  TextEditingController desc = TextEditingController();
  TextEditingController type = TextEditingController();
  String imagePath = '';
  final ImagePicker _picker = ImagePicker();
  List<NoteModel> notesList = [];

  @override
  Future<void> onInit() async {
    await getNotes();
    super.onInit();
  }

  @override
  Future<List<NoteModel>> getNotes() async {
    print('======getNotes====');
    statusRequest = StatusRequest.loading;
    notesList.clear();
    update();
    var response = await sqlDB.readData('SELECT * FROM "Note"');
    statusRequest = handlingData(response);
    print('=====$statusRequest=====');
    if (statusRequest == StatusRequest.success) {
      if (response.isNotEmpty) {
        List notes = response;
        for (var element in notes) {
          notesList.add(NoteModel.fromJson(element));
        }
        print(
          'notesList length = ${notesList.length}',
        );
      } else {
        Get.defaultDialog(
          title: 'Warning',
          middleText: 'no data available',
        );
        statusRequest = StatusRequest.failure;
      }
    }
    Get.showSnackbar(
      const GetSnackBar(
        messageText: Center(
            child: Text(
              'done update',
              style: TextStyle(color: Colors.greenAccent),
            )),
        duration: Duration(
          seconds: 2,
        ),
      ),
    );
    update();
    return notesList;
  }
  @override
  void dispose() {
    super.dispose();
  }

  @override
  Future<int> addNote(
    String name,
    String image,
    String desc,
    String type,
  ) async {
    if (formState.currentState!.validate() && imagePath != '') {
      print('==========addNote==========');
      statusRequest = StatusRequest.loading;
      update();
      int i = await sqlDB.insertData(
          'INSERT INTO Note(name,image,desc,type) VALUES("$name","$image","$desc","$type")');

      print('==========addNote success i = $i ==========');

      if (i >= 0) {
        await  getNotes();

        Get.offAllNamed(AppRoute.home);
      } else {}
      return i;
    } else {
      print('not validate');
      return 0;
    }
  }

  @override
  Future<void> chooseImage() async {
    final PickedFile? image =
        await _picker.getImage(source: ImageSource.gallery);

    if (!image.isNull) {
      print('================image!.path');
      print(image!.path);
      imagePath = image.path;
      update();
    }
  }

  @override
  Future<int> deleteNote(int id) async {
    statusRequest = StatusRequest.loading;
    update();
    int i = await sqlDB.deleteData('DELETE FROM Note WHERE id = $id');
    if (i == 1) {
      await getNotes();
      statusRequest = StatusRequest.success;
    }
    update();
    return 0;
  }
}
