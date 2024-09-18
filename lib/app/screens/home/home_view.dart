import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:travellio/app/utils/app_colors.dart';
import 'package:travellio/app/widgets/filters.dart';
import 'package:travellio/app/widgets/locationcards.dart';
import 'package:travellio/app/widgets/search_bar.dart';
import 'home_controller.dart';

class HomeView extends StatelessWidget {
  final HomeController homeController = Get.put(HomeController());

  HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: AppColor.pageColor,
      body: SingleChildScrollView(
          physics: const NeverScrollableScrollPhysics(),
          child: Padding(
            padding: EdgeInsets.only(top: screenHeight * 0.04),
            child: Column(
              children: [
                CustomSearchBar(),
                Padding(
                  padding: EdgeInsets.only(
                      top: screenHeight * 0.005, bottom: screenHeight * 0.009),
                  child: ScrollableButtonRow(),
                ),
                SizedBox(
                  height: screenHeight * 0.7,
                  child: LocationCards(),
                ),
              ],
            ),
          )),
    );
  }
}
