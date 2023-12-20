import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Chatpagecontroller extends GetxController
    with GetSingleTickerProviderStateMixin {
  late TabController controller;
  var tabIndex = 0.obs; // Reactive variable to track the current index

  @override
  void onInit() {
    controller = TabController(length: 2, vsync: this, initialIndex: 0);
    controller.addListener(() {
      tabIndex.value = controller.index;
    });
    super.onInit();
  }

  @override
  void onClose() {
    controller.dispose();
    super.onClose();
  }

   
}
