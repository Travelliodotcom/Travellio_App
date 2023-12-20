// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:travellio/app/controllers/page_index_controller.dart';
import '../utils/app_colors.dart';

class bottomNavBar extends GetView<PageIndexController> {
  const bottomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        child: GNav(
          haptic: true,
          gap: 10,
          backgroundColor: Colors.white,
          activeColor: AppColor.weirdBlue,
          padding: const EdgeInsets.all(16),
          iconSize: 30,
          tabs: [
            GButton(
              icon: Icons.home,
              iconColor: AppColor.accentGrey,
              text: "Home",
              onPressed: () => controller.changePage(0),
            ),
            GButton(
              icon: Icons.location_on,
              iconColor: AppColor.accentGrey,
              text: "Trip",
              onPressed: () => controller.changePage(1),
            ),
            GButton(
              icon: Icons.chat_rounded,
              iconColor: AppColor.accentGrey,
              text: "Chat",
              onPressed: () => controller.changePage(2),
            ),
            GButton(
              icon: Icons.favorite,
              iconColor: AppColor.accentGrey,
              text: "Search",
              onPressed: () => controller.changePage(3),
            ),
          ],
        ),
      ),
    );
  }
}
