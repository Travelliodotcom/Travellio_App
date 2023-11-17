import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:travellio/app/utils/app_colors.dart';
import 'host_trip_controller.dart';


class HostTripView extends GetView<hostTripController> {
  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
          centerTitle: true,
          title: const Text(
            "Host a Trip",
            style: TextStyle(color: Colors.black),
          ),
          elevation: 0,
          backgroundColor: Colors.transparent,
          leading: IconButton(
            onPressed: () => Get.offAllNamed('/home'),
            icon: const Icon(Icons.arrow_back),
            color: Colors.black,
          )),
      extendBody: true,
      body: Container(
        padding:
            EdgeInsets.only(left: screenWidth * 0.05, top: screenHeight * 0.01),
        child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
          Text(
            "Where are you going?",
            style: TextStyle(
              fontFamily: "Raleway",
              color: AppColor.hostTripText,
              fontWeight: FontWeight.w600,
            ),
          ),
          Obx(() => TextField(
                controller: controller.goingTo,
              ))
        ]),
      ),
    );
  }
}
