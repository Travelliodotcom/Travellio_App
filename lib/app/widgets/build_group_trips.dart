import 'package:flutter/material.dart';
import 'package:flutter_animation_progress_bar/flutter_animation_progress_bar.dart';
import 'package:get/get.dart';
import 'package:travellio/app/screens/home/home_controller.dart';

import '../utils/app_colors.dart';

class buildGroupTrips extends StatelessWidget {
  HomeController controller = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return ListView.builder(
        scrollDirection: Axis.vertical,
        itemCount: 5,
        itemBuilder: (BuildContext context, index) {
          return TextButton(
              style: ButtonStyle(
                overlayColor: MaterialStateProperty.all(Colors.transparent),
              ),
              onPressed: () {},
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Row(
                  children: [
                    Container(
                      width: 160,
                      height: 140,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                            image: NetworkImage(
                              controller.imageURL[index],
                            ),
                            fit: BoxFit.fill),
                        borderRadius: BorderRadius.circular(15),
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
                              mainAxisAlignment:
                                  MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  controller.locationNames.elementAt(index),
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
                                      color: AppColor.accentGrey,
                                      fontSize: 12),
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
              ));
        });
  }
}
