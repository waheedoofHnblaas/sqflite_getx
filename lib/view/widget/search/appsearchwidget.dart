import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sqflite_project/controller/home_controllers/searchcontroller.dart';
import 'package:flutter_sqflite_project/view/widget/search/datasearch.dart';
import 'package:get/get.dart';

class AppSearchWidget extends StatelessWidget {
  AppSearchWidget(
      {Key? key, this.title = 'Notes', this.showback = false})
      : super(key: key);

  late String title;
  late bool showback;

  @override
  Widget build(BuildContext context) {
    SearchController searchController = Get.put(SearchController());
    return Row(
      children: [
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
