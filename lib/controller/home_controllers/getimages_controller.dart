import 'package:flutter_sqflite_project/core/constant/approutes.dart';
import 'package:get/get.dart';

abstract class HomeNotesController extends GetxController {
  void toAdd();
}

class HomeNotesControllerImp extends HomeNotesController {




  @override
  Future<void> onInit() async {
  }
  @override
  void toAdd() {

    Get.toNamed(AppRoute.addPage);
  }

}
