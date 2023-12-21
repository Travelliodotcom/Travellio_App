// import 'dart:js_util';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:travellio/app/controllers/page_index_controller.dart';
import 'package:travellio/app/utils/app_colors.dart';
import '../../widgets/build_categories.dart';
import '../../widgets/build_group_trips.dart';
import '../../widgets/build_trips.dart';
import 'home_controller.dart';

class HomeView extends GetView<HomeController> {
  final pageIndexController = Get.find<PageIndexController>();

  HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: AppColor.pageColor,
      appBar: AppBar(
        scrolledUnderElevation: 0,
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  "Location",
                  style: TextStyle(
                      fontFamily: "inter",
                      color: AppColor.accentGrey,
                      fontSize: 18,
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  width: 2,
                ),
                Icon(
                  Icons.public_rounded,
                  color: AppColor.accentGrey,
                ),
              ],
            ),
            Obx(() {
              final locationText = controller.isFetch.value
                  ? '${controller.location.value}, ${controller.country_obs.value}'
                  : controller.location.value;
              return Text(
                locationText,
                style: const TextStyle(
                  fontFamily: "inter",
                  color: Colors.black,
                  fontWeight: FontWeight.w600,
                  fontSize: 18,
                ),
              );
            }),
          ],
        ),
        actions: [
          IconButton(
            onPressed: () => {
              Get.toNamed('/host'),
            },
            icon: IconButton(
              icon: const Icon(
                Icons.calendar_month_outlined,
                size: 30,
              ),
              onPressed: () => controller.selectDate(context),
              color: AppColor.notifIconColor,
            ),
          ),
          IconButton(
            onPressed: () => {
              Get.toNamed('/profile'),
            },
            icon: Icon(
              Icons.person,
              size: 30,
              color: AppColor.notifIconColor,
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
          child: Column(children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.02),
              child: Divider(
                color: AppColor.accentGrey,
              ),
            ),
            Title(
              color: Colors.orange,
              child: Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: EdgeInsets.only(left: screenWidth * 0.04),
                  child: const Text(
                    "Categories",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontFamily: "inter",
                      color: Colors.black,
                      fontSize: 18,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              // width: screenWidth,
              height: screenHeight * 0.09,
              child: buildCategories(controller),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Title(
                  color: Colors.orange,
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: EdgeInsets.only(left: screenWidth * 0.04),
                      child: const Text(
                        "Top Trips",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontFamily: "inter",
                          color: Colors.black,
                          fontSize: 18,
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                    padding: const EdgeInsets.only(right: 15),
                    child: TextButton(
                        onPressed: () {},
                        child: Text(
                          "See All",
                          style: TextStyle(
                            color: AppColor.accentGrey,
                          ),
                        )))
              ],
            ),
            SizedBox(
              height: screenHeight * 0.32,
              child: buildTrips(screenWidth),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.02),
              child: Divider(
                thickness: 0.5,
                color: Colors.grey[400],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Title(
                  color: Colors.orange,
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: EdgeInsets.only(left: screenWidth * 0.04),
                      child: const Text(
                        "Group Trips",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontFamily: "inter",
                          color: Colors.black,
                          fontSize: 18,
                        ),
                      ),
                    ),
                  ),
                ),
                Row(
                  children: [
                    Container(
                      width: screenWidth * 0.25,
                      height: screenHeight * 0.05,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10)),
                      child: TextButton(
                        onPressed: () {},
                        child: Row(
                          children: [
                            Text(
                              "See All",
                              style: TextStyle(
                                  color: AppColor.accentGrey, fontSize: 12),
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            Icon(
                              Icons.remove_red_eye_outlined,
                              size: 20,
                              color: AppColor.accentGrey,
                            )
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Container(
                      margin: EdgeInsets.only(right: screenWidth * 0.04),
                      width: screenWidth * 0.3,
                      height: screenHeight * 0.05,
                      decoration: BoxDecoration(
                          color: AppColor.weirdBlue,
                          borderRadius: BorderRadius.circular(10)),
                      child: TextButton(
                        onPressed: () {
                          Get.toNamed('/host');
                        },
                        child: const Row(
                          children: [
                            Text(
                              "Create One",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 12),
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Icon(
                              Icons.add_circle_outline_rounded,
                              size: 20,
                              color: Colors.white,
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(
              height: 3,
            ),
            SizedBox(
              height: screenHeight * 0.25,
              width: screenWidth * 0.95,
              child: buildGroupTrips(),
            ),
          ],
        ),
      ])),
    );
  }
}
