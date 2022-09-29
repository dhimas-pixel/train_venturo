import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';

class HistoryController extends GetxController
    with GetSingleTickerProviderStateMixin {
  late TabController controller;

  @override
  void onInit() {
    super.onInit();
    controller = TabController(vsync: this, length: 2);
  }
}
