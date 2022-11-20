import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_sqflite_project/core/class/statusrequest.dart';
import 'package:flutter_sqflite_project/core/constant/approutes.dart';
import 'package:flutter_sqflite_project/core/function/handlingdata.dart';
import 'package:flutter_sqflite_project/core/services/services.dart';
import 'package:flutter_sqflite_project/data/datasource/local/sql_db.dart';
import 'package:flutter_sqflite_project/data/model/note_model.dart';
import 'package:flutter_sqflite_project/view/screen/note_data.dart';
import 'package:flutter_sqflite_project/view/widget/appsnackbar.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

abstract class HomeProcessController extends GetxController {
  Future<void> chooseImage();

  Future<int> addNote(String name, String image, String desc, String type);

  Future<List<NoteModel>> getNotes();

  Future<List<String>> getTypes();

  Future<List<NoteModel>> getFavNotes();

  Future<int> deleteNote(int id);

  Future<int> favNote(
    int id,
    int fav,
  );

  void toAdd();

  void toNoteData(NoteModel note);
}

class HomeProcessControllerImp extends HomeProcessController {
  late GlobalKey<FormState> formState = GlobalKey<FormState>();
  TextEditingController name = TextEditingController();
  TextEditingController desc = TextEditingController();
  TextEditingController type = TextEditingController();
  MyServices myServices = Get.find();
  StatusRequest? statusRequest = StatusRequest.success;
  SqlDB sqlDB = SqlDB();
  String imagePath = '';
  final ImagePicker _picker = ImagePicker();
  List<NoteModel> notesList = [];

  ScrollController scrollController = ScrollController();

  bool reverse = false;

  @override
  Future<void> onInit() async {
    await getNotes();
    await getTypes();
    scrollController.addListener(() {
      if (ScrollDirection.forward ==
          scrollController.position.userScrollDirection) {
        reverse = false;
        update();
      } else {
        reverse = true;
        update();
      }
    });
    super.onInit();
  }

  List<String> notesType = [];

  @override
  Future<List<String>> getTypes() async {
    print('======getNotes====');
    statusRequest = StatusRequest.loading;
    notesType.clear();
    update();
    var response =
        await sqlDB.readData('SELECT DISTINCT  "type" FROM "Note" DESC');
    statusRequest = handlingData(response);
    print('=====$statusRequest=====');
    if (statusRequest == StatusRequest.success) {
      if (response.isNotEmpty) {
        List notes = response;
        for (var element in notes) {
          notesType.add(element['type']);
          print(element['type']);
        }
        print(
          'notesType length = ${notesType.length}',
        );
      } else {
        AppSnackBar(title: 'no type available');

        statusRequest = StatusRequest.success;
      }
    }
    AppSnackBar(title: 'types update');
    update();
    return notesType;
  }

  @override
  Future<List<NoteModel>> getNotes() async {
    print('======getNotes====');
    statusRequest = StatusRequest.loading;
    notesList.clear();
    update();
    var response = await sqlDB.readData('SELECT * FROM "Note" ORDER BY "id" DESC');
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
        AppSnackBar(title: 'no data available');

        statusRequest = StatusRequest.success;
      }
    }
    AppSnackBar(title: 'done update');
    favList = false;
    update();
    return notesList;
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
          'INSERT INTO Note(name,image,desc,type,fav) VALUES("$name","$image","$desc","$type",0)');

      print('==========addNote success i = $i ==========');

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
      Get.offAllNamed(AppRoute.home);
    }
    update();
    return 0;
  }

  @override
  Future<int> favNote(
    int id,
    int fav,
  ) async {
    fav == 0 ? fav = 1 : fav = 0;
    print('========== update =========');
    statusRequest = StatusRequest.loading;
    update();
    int i =
        await sqlDB.updateData('UPDATE Note SET fav = "$fav" WHERE id = "$id"');

    print('==========updateNote success i = $i ==========');

    if (i >= 0) {
      await getNotes();
      statusRequest = StatusRequest.success;
      update();

      // statusRequest = StatusRequest.success;
      // update();
    } else {}
    return i;
  }

  @override
  void toAdd() {
    Get.toNamed(AppRoute.addPage);
  }

  @override
  void toNoteData(NoteModel note) {
    Get.toNamed(
      AppRoute.noteData,
      arguments: {NoteModel: note},
    );
  }

  bool favList = false;

  @override
  Future<List<NoteModel>> getFavNotes() async {
    print('======getNotes====');
    statusRequest = StatusRequest.loading;
    notesList.clear();
    update();
    var response =
        await sqlDB.readData('SELECT * FROM "Note" WHERE fav = "1" ');
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
        AppSnackBar(title: 'no data available');

        statusRequest = StatusRequest.success;
      }
    }
    AppSnackBar(title: 'done update');
    favList = true;
    update();
    return notesList;
  }
}
