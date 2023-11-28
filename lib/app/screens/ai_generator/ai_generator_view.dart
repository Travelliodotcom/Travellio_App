// ignore_for_file: must_be_immutable, camel_case_types, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:travellio/app/controllers/page_index_controller.dart';
import 'package:travellio/app/screens/ai_generator/ai_generator_controller.dart';
import 'package:travellio/app/widgets/activites_tile.dart';
import 'package:travellio/app/widgets/bottomNavBar.dart';
import 'package:travellio/app/widgets/custom_button.dart';

import '../../utils/app_colors.dart';

class ai_generator_view extends GetView<ai_generator_Controller> {
    final PageIndexController _pageIndexController = Get.find<PageIndexController>();

  ai_generator_view({super.key});
  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      bottomNavigationBar: bottomNavBar(),
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
      backgroundColor: AppColor.pageColor,
      body: SingleChildScrollView(
        // physics: const NeverScrollableScrollPhysics(),
        child: Center(
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
                  controller: controller.destination,
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
                height: 6,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: controller.increment,
                    style: ElevatedButton.styleFrom(
                        shape: const CircleBorder(),
                        backgroundColor: AppColor.weirdBlue,
                        splashFactory: NoSplash.splashFactory),
                    child: const Text(
                      "+",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                      ),
                    ),
                  ),
                  Obx(() => Text(
                        controller.number.value,
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 40,
                          fontFamily: "inter",
                          fontWeight: FontWeight.bold,
                        ),
                      )),
                  ElevatedButton(
                    onPressed: controller.decrement,
                    style: ElevatedButton.styleFrom(
                        shape: const CircleBorder(),
                        backgroundColor: AppColor.weirdBlue,
                        splashFactory: NoSplash.splashFactory),
                    child: const Icon(
                      Icons.remove,
                      color: Colors.white,
                      size: 20,
                      weight: 30,
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                "What is your budget?",
                style: TextStyle(
                    fontFamily: "Raleway",
                    fontWeight: FontWeight.w600,
                    color: AppColor.hostPageText),
              ),
              const SizedBox(
                height: 30,
              ),
              Obx(() => SliderTheme(
                    data: const SliderThemeData(
                      trackHeight: 5,
                    ),
                    child: Slider(
                      min: 0,
                      max: 1000,
                      divisions: 200,
                      label:
                          "\$${controller.sliderValue.value.toInt()}",
                      value: controller.sliderValue.value,
                      onChanged: controller.updateSlider,
                      activeColor: AppColor.weirdBlue,
                      inactiveColor: Colors.black12,
                    ),
                  )),
              Text(
                "What activites are you interested in?",
                style: TextStyle(
                    fontFamily: "Raleway",
                    fontWeight: FontWeight.w600,
                    color: AppColor.hostPageText),
              ),
              const SizedBox(
                height: 10,
              ),
              SizedBox(
                height: screenHeight * 0.38,
                child: Obx(
                  () => ListView(
                    physics: const NeverScrollableScrollPhysics(),
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ActivitesTile(
                            text: "Photography",
                            icon: Icons.camera_alt_outlined,
                            isSelected: controller
                                .selectedActivities
                                .contains("Photography"),
                            onTap: () => controller
                                .toggleActivitySelection("Photography"),
                          ),
                          ActivitesTile(
                            text: "Shopping",
                            icon: Icons.shopping_bag_outlined,
                            isSelected: controller
                                .selectedActivities
                                .contains("Shopping"),
                            onTap: () => controller
                                .toggleActivitySelection("Shopping"),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ActivitesTile(
                            text: "Museum",
                            icon: Icons.museum_sharp,
                            isSelected: controller
                                .selectedActivities
                                .contains("Museum"),
                            onTap: () => controller
                                .toggleActivitySelection("Museum"),
                          ),
                          ActivitesTile(
                            text: "Sports",
                            icon: Icons.sports_basketball,
                            isSelected: controller
                                .selectedActivities
                                .contains("Sports"),
                            onTap: () => controller
                                .toggleActivitySelection("Sports"),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ActivitesTile(
                            text: "Cooking",
                            icon: Icons.cookie_outlined,
                            isSelected: controller
                                .selectedActivities
                                .contains("Cooking"),
                            onTap: () => controller
                                .toggleActivitySelection("Cooking"),
                          ),
                          ActivitesTile(
                            text: "Beaches",
                            icon: Icons.waves,
                            isSelected: controller
                                .selectedActivities
                                .contains("Beaches"),
                            onTap: () => controller
                                .toggleActivitySelection("Beaches"),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ActivitesTile(
                            text: "Clubbing",
                            icon: Icons.nightlife,
                            isSelected: controller
                                .selectedActivities
                                .contains("Clubbing"),
                            onTap: () => controller
                                .toggleActivitySelection("Clubbing"),
                          ),
                          ActivitesTile(
                            text: "Music",
                            icon: Icons.library_music_outlined,
                            isSelected: controller
                                .selectedActivities
                                .contains("Music"),
                            onTap: () => controller
                                .toggleActivitySelection("Music"),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ActivitesTile(
                            text: "Art",
                            icon: Icons.palette_outlined,
                            isSelected: controller
                                .selectedActivities
                                .contains("Art"),
                            onTap: () => controller
                                .toggleActivitySelection("Art"),
                          ),
                          ActivitesTile(
                            text: "Drink",
                            icon: Icons.wine_bar_outlined,
                            isSelected: controller
                                .selectedActivities
                                .contains("Drink"),
                            onTap: () => controller
                                .toggleActivitySelection("Drink"),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 10,),
              const customButton(text: "Create Trip")
            ],
          ),
        ),
      ),
    );
  }
}
