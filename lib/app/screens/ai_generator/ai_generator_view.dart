// ignore_for_file: must_be_immutable, camel_case_types, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:travellio/app/screens/ai_generator/ai_generator_controller.dart';
import 'package:travellio/app/screens/host_trip/host_trip_controller.dart';

import '../../utils/app_colors.dart';

class ai_generator_view extends StatelessWidget {
  final ai_generator_Controller _ai_generator_controller =
      ai_generator_Controller();
  ai_generator_view({super.key});
  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
          centerTitle: true,
          title: const Text(
            "AI Trip Generator",
            style: TextStyle(color: Colors.black),
          ),
          elevation: 0,
          backgroundColor: Colors.transparent,
          leading: IconButton(
            onPressed: () => Get.offAllNamed('/home'),
            icon: const Icon(Icons.arrow_back),
            color: const Color.fromARGB(255, 141, 132, 132),
          )),
      body: Center(
        child: Column(
          children: [
            Text(
              "Where are you going?",
              style: TextStyle(
                  fontFamily: "Raleway",
                  fontWeight: FontWeight.w600,
                  color: AppColor.hostPageText),
            ),
            const SizedBox(
              height: 5,
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
                controller: _ai_generator_controller.destination,
                decoration: const InputDecoration(
                  border: InputBorder.none,
                  hintText: "New Delhi, IN",
                ),
              ),
            ),
            Text(
              "How long is your trip?",
              style: TextStyle(
                  fontFamily: "Raleway",
                  fontWeight: FontWeight.w600,
                  color: AppColor.hostPageText),
            ),
            const SizedBox(
              height: 5,
            ),
            Row(
              children: [
                
              ],
            )
          ],
        ),
      ),
    );
  }
}
