// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:travellio/app/screens/host_trip/host_trip_controller.dart';
import 'package:travellio/app/utils/app_colors.dart';
import 'package:travellio/app/widgets/custom_button.dart';

// ignore: must_be_immutable
class hostTripView extends GetView {
  hostTripView({super.key});
  @override
  hostTripController controller = hostTripController();
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
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
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(
              left: screenWidth * 0.05,
              top: screenHeight * 0.02,
              right: screenWidth * 0.05),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Where are you going?",
                style: TextStyle(
                    fontFamily: "Raleway",
                    fontWeight: FontWeight.w600,
                    color: AppColor.hostPageText),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                padding: EdgeInsets.only(left: screenWidth * 0.05),
                width: screenWidth * 0.90,
                margin: const EdgeInsets.only(bottom: 20),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black12, width: 1),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: TextField(
                  controller: controller.members,
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                    hintText: "New Delhi, IN",
                  ),
                ),
              ),
              Text(
                "Who all are going?",
                style: TextStyle(
                    fontFamily: "Raleway",
                    fontWeight: FontWeight.w600,
                    color: AppColor.hostPageText),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                padding: EdgeInsets.only(left: screenWidth * 0.05),
                width: screenWidth * 0.90,
                margin: const EdgeInsets.only(bottom: 20),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black12, width: 1),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: TextField(
                  controller: controller.goingTo,
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                    hintText: "4 people joined",
                  ),
                ),
              ),
              Text(
                "How long are you going for?",
                style: TextStyle(
                    fontFamily: "Raleway",
                    fontWeight: FontWeight.w600,
                    color: AppColor.hostPageText),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                padding: EdgeInsets.only(left: screenWidth * 0.05),
                width: screenWidth * 0.90,
                margin: const EdgeInsets.only(bottom: 20),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black12, width: 2),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: TextField(
                  controller: controller.duration,
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                    hintText: "1 week",
                  ),
                ),
              ),
              Center(
                child: Text(
                  "Your Itinerary",
                  style: TextStyle(
                    fontFamily: "Raleway-bold",
                    fontWeight: FontWeight.bold,
                    color: AppColor.hostPageText,
                    fontSize: 20,
                  ),
                ),
              ),
              Text(
                "Day 1:",
                style: TextStyle(
                    fontFamily: "Raleway",
                    fontWeight: FontWeight.w600,
                    color: AppColor.hostPageText),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                padding: EdgeInsets.only(left: screenWidth * 0.05),
                width: screenWidth * 0.90,
                margin: const EdgeInsets.only(bottom: 20),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black12, width: 2),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: TextField(
                  maxLines: 2,
                  controller: controller.duration,
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                    hintText: "Enter Day 1 Itinerary",
                  ),
                ),
              ),
              Text(
                "Day 2:",
                style: TextStyle(
                    fontFamily: "Raleway",
                    fontWeight: FontWeight.w600,
                    color: AppColor.hostPageText),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                padding: EdgeInsets.only(left: screenWidth * 0.05),
                width: screenWidth * 0.90,
                margin: const EdgeInsets.only(bottom: 20),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black12, width: 2),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: TextField(
                  maxLines: 2,
                  controller: controller.duration,
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                    hintText: "Enter Day 2 Itinerary",
                  ),
                ),
              ),
              Text(
                "Day 3:",
                style: TextStyle(
                    fontFamily: "Raleway",
                    fontWeight: FontWeight.w600,
                    color: AppColor.hostPageText),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                padding: EdgeInsets.only(left: screenWidth * 0.05),
                width: screenWidth * 0.90,
                margin: const EdgeInsets.only(bottom: 20),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black12, width: 2),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: TextField(
                  maxLines: 2,
                  controller: controller.duration,
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                    hintText: "Enter Day 3 Itinerary",
                  ),
                ),
              ),
              const Center(child: customButton(text: "Create Group")),
            ],
          ),
        ),
      ),
    );
  }
}
