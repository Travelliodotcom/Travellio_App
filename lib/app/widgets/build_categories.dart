import 'package:flutter/material.dart';

import '../screens/home/dataModels/data_models.dart';
import '../screens/home/home_controller.dart';
import '../utils/app_colors.dart';

Widget buildCategories(HomeController homeController) {
  return ListView.builder(
    scrollDirection: Axis.horizontal,
    itemCount: numberOfCategories,
    itemBuilder: (BuildContext context, index) {
      return TextButton(
        onPressed: () {
          homeController.changeIndex(index);
        },
        style: ButtonStyle(
          overlayColor: MaterialStateProperty.all(Colors.transparent),
          iconColor: MaterialStateProperty.all(AppColor.weirdBlue),
        ),
        child: Container(
          width: 120,
          height: 45,
          decoration: BoxDecoration(
            color: homeController.selectedIndex.value == index
                ? AppColor.weirdBlue
                : Colors.white,
            border: Border.all(
                width: 1, style: BorderStyle.solid, color: Colors.transparent),
            borderRadius: BorderRadius.circular(25),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            // crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(
                categoriesListIcons[categoriesList.values[index]],
                color: homeController.selectedIndex.value == index
                    ? Colors.white
                    : AppColor.accentGrey,
              ),

              // const SizedBox(width: 5,),
              Text(
                categoriesList.values[index].name,
                style: TextStyle(
                  color: homeController.selectedIndex.value == index
                      ? Colors.white
                      : AppColor.accentGrey,
                ),
              ),
            ],
          ),
        ),
      );
    },
  );
}
