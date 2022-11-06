import 'package:flutter/material.dart';
import 'package:flutter_sqflite_project/core/class/statusrequest.dart';

class HandelingView extends StatelessWidget {
  HandelingView({Key? key, required this.statusRequest, required this.widget})
      : super(key: key);

  final StatusRequest statusRequest;
  Widget widget;

  @override
  Widget build(BuildContext context) {
    if (statusRequest == StatusRequest.loading) {
      return const Center(child: CircularProgressIndicator());
    } else if (statusRequest == StatusRequest.success) {
      return widget;
    } else if (statusRequest == StatusRequest.failure) {
      return const Center(child: Text('no data'));
    } else {
      return const Center(child: Text('AppEroor404Widget'));
    }
  }
}

class HandelingRequest extends StatelessWidget {
  HandelingRequest(
      {Key? key, required this.statusRequest, required this.widget})
      : super(key: key);

  final StatusRequest statusRequest;
  Widget widget;

  @override
  Widget build(BuildContext context) {
    if (statusRequest == StatusRequest.loading) {
      return const Center(child: CircularProgressIndicator());
    }
    // else if (statusRequest == StatusRequest.failure) {
    //   return const Text('no data');
    // }
    else if (statusRequest == StatusRequest.serverExp ||
        statusRequest == StatusRequest.offline) {
      return const Center(child: Text('AppEroor404Widget'));
    } else {
      return widget;
    }
  }
}
