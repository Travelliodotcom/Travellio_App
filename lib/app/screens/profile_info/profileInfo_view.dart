// ignore_for_file: file_names, camel_case_types

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:travellio/app/screens/profile_info/profileInfo_controller.dart';
import '../../utils/app_colors.dart';

class profileInfoView extends GetView<profileInfoController> {
  const profileInfoView({super.key});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
        appBar: AppBar(
            centerTitle: true,
            title: const Text(
              "Profile",
              style: TextStyle(color: Colors.black),
            ),
            elevation: 0,
            backgroundColor: Colors.transparent,
            leading: IconButton(
              onPressed: () => Get.back(),
              icon: const Icon(Icons.arrow_back),
              color: Colors.black,
            )),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.055),
            child: Column(
              children: [
                Image.asset(
                  "assets/images/profile_pic_placeholder.png",
                  height: 300,
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Image.asset("assets/images/profile_carousel1.png"),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Image.asset("assets/images/profile_carousel2.png"),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Image.asset("assets/images/profile_carousel3.png"),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Image.asset("assets/images/profile_carousel4.png"),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    const Text(
                      "Jane Doe",
                      style: TextStyle(
                          fontFamily: "raleway",
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 30),
                    ),
                    const Text(
                      "(20)",
                      style: TextStyle(
                          fontFamily: "raleway",
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 30),
                    ),
                    const Spacer(),
                    Row(
                      children: [
                        Icon(
                          Icons.star,
                          size: 25,
                          color: AppColor.appYellow,
                        ),
                        Text(
                          "4.5",
                          style: TextStyle(
                            color: AppColor.accentGrey,
                            fontSize: 25,
                          ),
                        )
                      ],
                    )
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    Icon(
                      Icons.location_city,
                      color: AppColor.weirdBlue,
                    ),
                    const Text(
                      "Local",
                      style:
                          const TextStyle(fontFamily: "poppins", fontSize: 17),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Icon(
                      Icons.public_rounded,
                      color: AppColor.weirdBlue,
                    ),
                    const Text(
                      "32 Countries",
                      style: TextStyle(fontFamily: "poppins", fontSize: 17),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Icon(
                      Icons.person,
                      color: AppColor.weirdBlue,
                    ),
                    const Text(
                      "Female",
                      style: TextStyle(fontFamily: "poppins", fontSize: 17),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
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
                    controller: controller.biography,
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      hintText: "Biography",
                    ),
                  ),
                ),
                const Divider(
                  height: 1,
                ),
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  "Favourite View",
                  style: TextStyle(
                    fontFamily: "raleway",
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 10,),
                Image.asset(
                  
                  "assets/images/fav_view.png",
                  height: 300,
                ),
                const SizedBox(height: 20,)

              ],
            ),
          ),
        ));
  }
}
