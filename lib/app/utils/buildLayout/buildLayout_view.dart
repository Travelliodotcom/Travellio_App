// ignore_for_file: file_names

// import 'package:dot_navigation_bar/dot_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:travellio/app/screens/home/home_view.dart';
import 'package:travellio/app/screens/profile/profile_view.dart';
import 'package:travellio/app/screens/saved_trips/saved_trips_view.dart';
import 'package:travellio/app/utils/app_colors.dart';
import 'package:travellio/app/utils/buildLayout/buildLayout_controller.dart';

class BuildLayout extends GetView<BuildLayoutController> {
  BuildLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Scaffold(
        body: controller.pageList[controller.selectedIndex.value],
        bottomNavigationBar: BottomNavigationBar(
          unselectedItemColor: AppColor.botomNavBarItem,
          selectedItemColor: AppColor.weirdBlue,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          enableFeedback: false,
          items: [
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                "assets/icons/home.svg",

                height: 30,
                color: controller.selectedIndex.value == 0
                    ? AppColor.weirdBlue
                    : AppColor.botomNavBarItem,
              ),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                "assets/icons/match_icon.svg",
                height: 30,
                color: controller.selectedIndex.value == 1
                    ? AppColor.weirdBlue
                    : AppColor.botomNavBarItem,
              ),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.chat_rounded,
                color: controller.selectedIndex.value == 2
                    ? AppColor.weirdBlue
                    : AppColor.botomNavBarItem,
                size: 30,
              ),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                
                Icons.person,
                color: controller.selectedIndex.value == 3
                    ? AppColor.weirdBlue
                    : AppColor.botomNavBarItem,
                size: 30,
              ),
              label: '',
            ),
          ],
          currentIndex: controller.selectedIndex.value,
          onTap: controller.changeIndex,
        ),
      );
    });
  }
}
