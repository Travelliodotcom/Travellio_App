import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:travellio/app/utils/buildLayout/buildLayout_controller.dart';
import 'home_controller.dart';

class HomeView extends GetView<BuildLayoutController> {
  final HomeController homeController = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
    );
  }
}
