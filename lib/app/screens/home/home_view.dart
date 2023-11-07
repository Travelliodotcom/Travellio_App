import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:travellio/app/screens/home/dataModels/data_models.dart';
import 'package:travellio/app/utils/app_colors.dart';
import 'package:travellio/app/utils/buildLayout/buildLayout_controller.dart';
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
        child: Padding(
          padding: EdgeInsets.only(
              top: screenHeight * 0.05, left: screenWidth * 0.05),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Location",
                          style: TextStyle(
                            fontFamily: "inter",
                            color: AppColor.accentGrey,
                            fontSize: 18,
                          ),
                        ),
                        const SizedBox(
                          height: 4,
                        ),
                        Row(
                          children: [
                            Icon(
                              Icons.location_on,
                              size: 30,
                              color: AppColor.locIconColor,
                            ),
                            Obx(() {
                              final locationText =
                                  '${homeController.location.value}, ${homeController.country_obs.value} ';
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
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        right: screenWidth * 0.05, top: screenHeight * 0.02),
                    child: IconButton(
                        onPressed: () => {
                              showDialog(
                                  context: (context),
                                  builder: ((BuildContext context) {
                                    return AlertDialog(
                                      title: Text("PUT NOTIFICATION SCREEN"),
                                      actions: [
                                        TextButton(
                                            onPressed:
                                                Navigator.of(context).pop,
                                            child: Text("Okay"))
                                      ],
                                    );
                                  }))
                            },
                        icon: Icon(
                          Icons.notifications,
                          size: 25,
                          color: AppColor.notifIconColor,
                        )),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Title(
                color: Colors.orange,
                child: const Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
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
              Container(
                // width: screenWidth,
                height: screenHeight * 0.1,
                child: buildCategories(),
              )
            ],
          ),
        ),
      ),
    );
  }
}

Widget buildCategories() {
  return ListView.builder(
    scrollDirection: Axis.horizontal,
    itemCount: numberOfCategories,
    itemBuilder: (BuildContext context, index) {
      return TextButton(
        onPressed: () {},
        style: ButtonStyle(
          overlayColor: MaterialStateProperty.all(Colors.transparent),
          iconColor: MaterialStateProperty.all(AppColor.weirdBlue),
        ),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(width: 1, style: BorderStyle.solid, color: AppColor.weirdBlue),
            borderRadius: BorderRadius.circular(25),
            
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 22,
                backgroundColor: AppColor.weirdBlue,
                child:Icon(
                categoriesListIcons[categoriesList.values[index]],
                color: Colors.white,
              ),
              ),

              // const SizedBox(width: 5,),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Text(
                  categoriesList.values[index].name,
                  style: TextStyle(color: AppColor.accentGrey),
                ),
              ),
            ],
          ),
        ),
      );
    },
  );
}