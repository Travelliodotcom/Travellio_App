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
      bool isFirstTile = index == 0;

      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 5),
        child: GestureDetector(
          onTap: () {},
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(15),
            ),
            child: Column(
              children: [
                Stack(alignment: Alignment.topCenter, children: [
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
                  if (isFirstTile)
                    Container(
                      margin: const EdgeInsets.symmetric(horizontal:2),
                      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                      width: 175,
                      decoration: BoxDecoration(
                        color: AppColor.weirdBlue,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: const Center(
                        child: Text(
                          'Featured Trip',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'inter'
                          ),
                        ),
                      ),
                    ),
                ]),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SizedBox(
                    width: 160,
                    height: 100,
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              controller.locationNames.elementAt(index),
                              style: TextStyle(
                                  color: AppColor.titleBlack,
                                  fontFamily: "Raleway",
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
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Icon(
                              Icons.pin_drop_rounded,
                              color: AppColor.weirdBlue,
                            ),
                            Text(
                              "Idaho",
                              style: TextStyle(
                                  color: AppColor.accentGrey,
                                  fontSize: 12,
                                  fontFamily: "poppins"),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 3,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: 20,
                              width: 20,
                              child: Image.asset("assets/images/trimulka.png"),
                            ),
                            Text(
                              " Trimulka Gupta",
                              style: TextStyle(
                                  fontFamily: "raleway",
                                  fontWeight: FontWeight.bold,
                                  fontSize: 12,
                                  color: AppColor.hostPageText),
                            )
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Text(
                                  controller.itemCounter.toString(),
                                  style: TextStyle(
                                      color: AppColor.weirdBlue, fontSize: 20),
                                ),
                                const SizedBox(
                                  width: 2,
                                ),
                                Text(
                                  "Joined",
                                  style: TextStyle(
                                      color: AppColor.accentGrey, fontSize: 12),
                                )
                              ],
                            ),
                            Icon(
                              Icons.favorite_outline,
                              size: 30,
                              color: AppColor.accentGrey,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    },
  );
}
