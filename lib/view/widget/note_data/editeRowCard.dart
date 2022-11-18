import 'package:flutter/material.dart';
import 'package:flutter_sqflite_project/controller/home_controllers/notedata_controller.dart';
import 'package:flutter_sqflite_project/controller/home_controllers/process_controller.dart';
import 'package:get/get.dart';

class EditeRowCard extends StatelessWidget {
  const EditeRowCard({
    Key? key,
    required this.homeProcessControllerImp,
    required this.controllerImp,
  }) : super(key: key);

  final HomeProcessControllerImp homeProcessControllerImp;
  final NoteDataControllerImp controllerImp;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 10,
      left: 10,
      right: 10,
      child: Container(
        padding: const EdgeInsets.all(6),
        decoration: BoxDecoration(
          color: Colors.blueAccent.withOpacity(0.8),
          borderRadius: const BorderRadius.all(Radius.circular(18)),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            FavorateIcon(),
            IconButton(
              onPressed: () {
                controllerImp.toUpdateNote(controllerImp.noteModel);
              },
              icon: const Icon(
                Icons.edit,
              ),
              color: Get.theme.scaffoldBackgroundColor,
            ),
            IconButton(
              onPressed: () async {
                await homeProcessControllerImp
                    .deleteNote(controllerImp.noteModel.id!);
              },
              icon: const Icon(
                Icons.delete,
              ),
              color: Get.theme.scaffoldBackgroundColor,
            ),
          ],
        ),
      ),
    );
  }

 Widget FavorateIcon() {
    return IconButton(
      onPressed: () async {
        await homeProcessControllerImp.favNote(
          controllerImp.noteModel.id!,
          controllerImp.isFav,
        );
        controllerImp.updateFav();
      },
      icon: GetBuilder<NoteDataControllerImp>(
        builder: (cont) {
          print(cont.isFav);

          return cont.isFav == 1
              ? const Icon(
                  Icons.favorite,
                  color: Colors.red,
                )
              : const Icon(
                  Icons.favorite_border,
                );
        },
      ),
      color: Get.theme.scaffoldBackgroundColor,
    );
  }
}
