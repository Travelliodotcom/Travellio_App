import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:travellio/app/screens/home/home_controller.dart';

import '../utils/app_colors.dart';

Widget buildTrips(double cardWidth) {
  HomeController controller = Get.put(HomeController());
  return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: 6,
      itemBuilder: (BuildContext context, index) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 2),
          child: TextButton(
              style: ButtonStyle(
                overlayColor: MaterialStateProperty.all(Colors.transparent),
              ),
              onPressed: () {},
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Column(
                  children: [
                    Container(
                      width: 175,
                      height: 120,
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
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  controller.locationNames.elementAt(index),
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
                                      controller.itemCounter.toString(),
                                      style: TextStyle(
                                          color: AppColor.weirdBlue,
                                          fontSize: 20),
                                    ),
                                    const SizedBox(
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
                                const Icon(
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
