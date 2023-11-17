import 'package:flutter/material.dart';
import 'package:flutter_animation_progress_bar/flutter_animation_progress_bar.dart';
import 'package:get/get.dart';
import 'package:travellio/app/screens/home/dataModels/data_models.dart';
import 'package:travellio/app/utils/app_colors.dart';
import 'package:travellio/app/utils/buildLayout/buildLayout_controller.dart';
import 'home_controller.dart';

int itemCounter = 10;

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
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Title(
                    color: Colors.orange,
                    child: const Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
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
                  Padding(
                      padding: EdgeInsets.only(right: 15),
                      child: TextButton(
                          onPressed: () {},
                          child: Text(
                            "See All",
                            style: TextStyle(color: AppColor.accentGrey),
                          )))
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                height: screenHeight * 0.31,
                child: buildTrips(),
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Title(
                    color: Colors.orange,
                    child: const Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
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
                  Row(
                    children: [
                      TextButton(
                        onPressed: () {},
                        child: Text(
                          "See All",
                          style: TextStyle(color: AppColor.accentGrey),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 15),
                        child: TextButton(
                          onPressed: () {},
                          child: Text(
                            "Create One",
                            style: TextStyle(color: AppColor.weirdBlue),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Container(
                height: screenHeight * 0.20,
                // color: Colors.orange,
                width: screenWidth,
                child: buildGroupTrips(),
              ),
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
            border: Border.all(
                width: 1, style: BorderStyle.solid, color: AppColor.weirdBlue),
            borderRadius: BorderRadius.circular(25),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 22,
                backgroundColor: AppColor.weirdBlue,
                child: Icon(
                  categoriesListIcons[categoriesList.values[index]],
                  color: Colors.white,
                ),
              ),

              // const SizedBox(width: 5,),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
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

Widget buildTrips() {
  return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: 6,
      itemBuilder: (BuildContext context, index) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 2),
          child: TextButton(
            style: ButtonStyle(overlayColor: MaterialStateProperty.all(Colors.transparent),),
              onPressed: () {},
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Column(
                  // mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        width: 160,
                        height: 120,
                        decoration: BoxDecoration(
                            // color: Colors.red,
                            image: DecorationImage(
                                image: NetworkImage(
                                  imageURL[index],
                                ),
                                fit: BoxFit.fill),
                            borderRadius: BorderRadius.circular(15),
                            boxShadow: [
                              BoxShadow(
                                  blurRadius: 2,
                                  spreadRadius: 0.5,
                                  offset: Offset.fromDirection(70, 5),
                                  color: Color.fromARGB(117, 0, 0, 0))
                            ]),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SizedBox(
                        width: 160,
                        height: 100,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  locationNames.elementAt(index),
                                  style: TextStyle(
                                      color: AppColor.titleBlack,
                                      letterSpacing: -0.3,
                                      fontWeight: FontWeight.bold),
                                ),
                                Row(
                                  children: [
                                    Icon(
                                      Icons.star,
                                      color: AppColor.goldenStar,
                                      size: 15,
                                    ),
                                    Text(
                                      "4.5",
                                      style: TextStyle(
                                        color: AppColor.accentGrey,
                                        fontSize: 12,
                                      ),
                                    )
                                  ],
                                )
                              ],
                            ),
                            Row(
                              children: [
                                Icon(
                                  Icons.pin_drop_rounded,
                                  color: AppColor.accentGrey,
                                ),
                                Text(
                                  "Idaho",
                                  style: TextStyle(
                                      color: AppColor.accentGrey, fontSize: 12),
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  // crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text(
                                      itemCounter.toString(),
                                      style: TextStyle(
                                          color: AppColor.weirdBlue,
                                          fontSize: 20),
                                    ),
                                    SizedBox(
                                      width: 2,
                                    ),
                                    Text(
                                      "Joined",
                                      style: TextStyle(
                                          color: AppColor.accentGrey,
                                          fontSize: 12),
                                    )
                                  ],
                                ),
                                // IconButton(onPressed: (){}, icon:Icon(Icons.heart_broken, size: 25,))
                                Icon(
                                  Icons.heart_broken,
                                  size: 30,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              )),
        );
      });
}

Widget buildGroupTrips() {
  return ListView.builder(scrollDirection: Axis.horizontal, itemCount: 5, itemBuilder: (BuildContext context, index) {
    return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 2),
          child: TextButton(
            style: ButtonStyle(overlayColor: MaterialStateProperty.all(Colors.transparent),),
              onPressed: () {},
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Row(
                  // mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        width: 160,
                        height: 140,
                        decoration: BoxDecoration(
                            // color: Colors.red,
                            image: DecorationImage(
                                image: NetworkImage(
                                  imageURL[index],
                                ),
                                fit: BoxFit.fill),
                            borderRadius: BorderRadius.circular(15),
                            boxShadow: [
                              BoxShadow(
                                  blurRadius: 2,
                                  spreadRadius: 0.5,
                                  offset: Offset.fromDirection(70, 5),
                                  color: Color.fromARGB(117, 0, 0, 0))
                            ]),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SizedBox(
                        width: 160,
                        height: 100,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  locationNames.elementAt(index),
                                  style: TextStyle(
                                      color: AppColor.titleBlack,
                                      letterSpacing: -0.3,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Icon(
                                  Icons.pin_drop_rounded,
                                  color: AppColor.accentGrey,
                                ),
                                Text(
                                  "Idaho",
                                  style: TextStyle(
                                      color: AppColor.accentGrey, fontSize: 12),
                                ),
                              ],
                            ),
                            FAProgressBar(
                              currentValue: 80,
                              displayText: '%',
                              progressColor: AppColor.weirdBlue,
                              backgroundColor: AppColor.progressBarBackground,
                              size: 15,
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              )),
        );
  });
}
// Widget tripCard() {
//   return Container(
//     decoration: BoxDecoration(
//       color: Colors.white,
//       borderRadius: BorderRadius.circular(15),
//     ),
//     child: Column(
//       children: [
//         Padding(
//           padding: const EdgeInsets.all(8.0),
//           child: Container(
//             width: 200,
//             height: 180,
//             decoration: BoxDecoration(
//                 // color: Colors.red,
//                 image: DecorationImage(
//                     image: NetworkImage(
//                       imageURL[buildTrips.index],
//                     ),
//                     fit: BoxFit.fill),
//                 borderRadius: BorderRadius.circular(15),
//                 boxShadow: [
//                   BoxShadow(
//                       blurRadius: 2,
//                       spreadRadius: 0.5,
//                       offset: Offset.fromDirection(70, 5),
//                       color: Color.fromARGB(117, 0, 0, 0))
//                 ]),
//           ),
//         )
//         // Image(
//         //   image: NetworkImage(
//         //       "https://images.pexels.com/photos/1450082/pexels-photo-1450082.jpeg?auto=compress&cs=tinysrgb&w=1600"),
//         //       fit: BoxFit.contain,
//         // ),
//       ],
//     ),
//   );
// }

List<String> locationNames = [
  "OrangeFish lake",
  "Scary Mountains",
  "Ancient Pillars",
  "OrangeFish lake",
  "Scary Mountains",
  "Ancient Pillars"
];

List<String> imageURL = [
  "https://images.pexels.com/photos/1450082/pexels-photo-1450082.jpeg?auto=compress&cs=tinysrgb&w=1600",
  "https://images.pexels.com/photos/1367192/pexels-photo-1367192.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
  "https://images.pexels.com/photos/4916671/pexels-photo-4916671.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
  "https://images.pexels.com/photos/1450082/pexels-photo-1450082.jpeg?auto=compress&cs=tinysrgb&w=1600",
  "https://images.pexels.com/photos/1367192/pexels-photo-1367192.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
  "https://images.pexels.com/photos/4916671/pexels-photo-4916671.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1"
];
