import 'package:flutter_sqflite_project/core/class/statusrequest.dart';
import 'package:flutter_sqflite_project/core/constant/approutes.dart';
import 'package:flutter_sqflite_project/data/datasource/local/sql_db.dart';
import 'package:flutter_sqflite_project/data/model/note_model.dart';
import 'package:get/get.dart';

abstract class NoteDataController extends GetxController {
  Future<int> deleteNote(int id);

  void toUpdateNote(NoteModel note);
}

class NoteDataControllerImp extends NoteDataController {
  int isFav = 0;
  late NoteModel noteModel;
  StatusRequest? statusRequest = StatusRequest.success;
  SqlDB sqlDB = SqlDB();

  @override
  void onInit() {
    noteModel = Get.arguments[NoteModel];
    isFav = noteModel.fav!;
    update();
    super.onInit();
  }

  updateFav() {
    isFav == 0 ? isFav = 1 : isFav = 0;
    update();
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
  void toUpdateNote(NoteModel note) {
    Get.toNamed(
      AppRoute.updatePage,
      arguments: {NoteModel: noteModel},
    );
  }
}
