import 'package:flutter/material.dart';
import 'package:flutter_sqflite_project/view/widget/search/searchfilter.dart';
import 'package:get/get.dart';

class DataSearch extends SearchDelegate {



  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
          onPressed: () {
            query != '' ? query = '' : Get.back();
          },
          icon: const Icon(Icons.close))
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
        onPressed: () {
          Get.back();
        },
        icon: const Icon(
          Icons.arrow_back_ios,
        ));
  }

  @override
  Widget buildResults(BuildContext context) {

    return SearchFilter(query: query);
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return SearchFilter(query: query);
  }
}
