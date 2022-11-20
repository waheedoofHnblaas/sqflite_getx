import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sqflite_project/controller/home_controllers/process_controller.dart';
import 'package:flutter_sqflite_project/controller/home_controllers/searchcontroller.dart';
import 'package:flutter_sqflite_project/controller/home_controllers/theme_controller.dart';
import 'package:flutter_sqflite_project/view/widget/search/datasearch.dart';
import 'package:get/get.dart';

class AppSearchWidget extends StatelessWidget {
  AppSearchWidget({Key? key, this.title = 'Notes', this.showback = false})
      : super(key: key);

  late String title;
  late bool showback;

  @override
  Widget build(BuildContext context) {
    SearchController searchController = Get.put(SearchController());
    ThemeController controller = Get.find();
    return Row(
      children: [
        Expanded(
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
            ),
            child: ThemeSwitcher(
              builder: (context) => IconButton(
                onPressed: () {
                  controller.changeThemeMode(context);
                  print(controller.getThemeMode());
                },
                icon: const Icon(
                  CupertinoIcons.sun_max,
                ),
              ),
            ),
          ),
        ),
        Expanded(
          flex: 8,
          child: Center(
            child: Text(
              title,
            ),
          ),
        ),
        Expanded(
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
            ),
            child: GetBuilder<HomeProcessControllerImp>(
              builder: (homeController) {
                return IconButton(
                  onPressed: () {
                    if (homeController.favList) {
                      homeController.getNotes();
                    } else {
                      homeController.getFavNotes();
                    }
                  },
                  icon: !homeController.favList
                      ? const Icon(
                          Icons.favorite_border_outlined,
                        )
                      : const Icon(
                          Icons.favorite,
                        ),
                );
              },
            ),
          ),
        ),
        const SizedBox(
          width: 22,
        ),
        Expanded(
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
            ),
            child: IconButton(
              onPressed: () {
                if (showback) {
                  Get.back();
                } else {
                  showSearch(
                    context: context,
                    delegate: DataSearch(),
                  );
                }
              },
              icon: Icon(
                showback ? CupertinoIcons.back : CupertinoIcons.search,
              ),
            ),
          ),
        ),
        const SizedBox(
          width: 5,
        ),
      ],
    );
  }
}
