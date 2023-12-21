import 'package:flutter/material.dart';
import 'package:flutter_animation_progress_bar/flutter_animation_progress_bar.dart';
import 'package:flutter_image_stack/flutter_image_stack.dart';
import 'package:get/get.dart';
import 'package:travellio/app/screens/home/home_controller.dart';

import '../utils/app_colors.dart';

class buildGroupTrips extends StatelessWidget {
  HomeController controller = Get.put(HomeController());

  buildGroupTrips({super.key});

  @override
  Widget build(BuildContext context) {
    // final screenWidth = MediaQuery.of(context).size.width;

    return ListView.builder(
      scrollDirection: Axis.vertical,
      itemCount: 5,
      itemBuilder: (BuildContext context, index) {
        return ListTile(
          contentPadding: const EdgeInsets.all(2),
          onTap: () {},
          title: Container(
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
                      image: NetworkImage(controller.imageURL[index]),
                      fit: BoxFit.fill,
                    ),
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SizedBox(
                    width: 160,
                    height: 120,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              controller.locationNames.elementAt(index),
                              style: TextStyle(
                                color: AppColor.titleBlack,
                                letterSpacing: -0.3,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              "Seelisburg",
                              style: TextStyle(
                                fontFamily: "inter",
                                fontSize: 12,
                                color: AppColor.accentGrey,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Icon(
                              Icons.pin_drop_rounded,
                              color: AppColor.accentGrey,
                              size: 17,
                            ),
                            Text(
                              "Idaho",
                              style: TextStyle(
                                color: AppColor.accentGrey,
                                fontSize: 12,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            FlutterImageStack(
                                imageList: const [
                                  "https://as2.ftcdn.net/v2/jpg/02/67/12/89/1000_F_267128921_Sh7Kk8LTpnykKoWM7k1p86X4HzfLK6Pc.jpg",
                                  "https://images.indianexpress.com/2016/09/pisa3.jpg",
                                  "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ1T7noMiMob7ZM_QImqeIF2C-JtQEaJ_s-Dw&usqp=CAU",
                                  "https://as2.ftcdn.net/v2/jpg/02/67/12/89/1000_F_267128921_Sh7Kk8LTpnykKoWM7k1p86X4HzfLK6Pc.jpg",
                                  'https://images.unsplash.com/photo-1593642532842-98d0fd5ebc1a?ixid=MXwxMjA3fDF8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=2250&q=80',
                                  'https://images.unsplash.com/photo-1612594305265-86300a9a5b5b?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=1000&q=80',
                                  'https://images.unsplash.com/photo-1612626256634-991e6e977fc1?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=1712&q=80',
                                  'https://images.unsplash.com/photo-1593642702749-b7d2a804fbcf?ixid=MXwxMjA3fDF8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=1400&q=80'
                                ],
                                itemCount: 6,
                                totalCount: 8,
                                showTotalCount: false,
                                itemBorderWidth: 3,
                                itemRadius: 25),
                            const Text(
                              "+110 orders",
                              style: TextStyle(fontSize: 7),
                            )
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
          ),
        );
      },
    );
  }
}
