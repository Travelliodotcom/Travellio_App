// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';
import 'package:travellio/app/utils/app_colors.dart';

class SwipePill extends StatelessWidget {
  final String text;
  final IconData icon;
  final bool isSelected;
  final VoidCallback onTap;

  const SwipePill({
    Key? key,
    required this.text,
    required this.icon,
    required this.isSelected,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 20,
        width: screenWidth * 0.2,
        padding: EdgeInsets.all(3),
        
        margin: const EdgeInsets.only(right: 10, bottom: 10),
        decoration: BoxDecoration(
          color: isSelected ? AppColor.weirdBlue : Colors.white,
          borderRadius: BorderRadius.circular(30),
          border: Border.all(color: AppColor.weirdBlue, width: 1),
          boxShadow: isSelected
              ? [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 2,
                    blurRadius: 7,
                    offset: const Offset(0, 3),
                  ),
                ]
              : [],
        ),
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Icon(
                icon,
                color: isSelected ? Colors.white : AppColor.weirdBlue,
                size: 15,
              ),
              const SizedBox(
                width: 10,
              ),
              Text(
                text,
                style: TextStyle(
                  fontFamily: "Raleway",
                  color: isSelected ? Colors.white : Colors.black,
                  fontWeight: FontWeight.bold,
                 // fontWeight: isSelected ? FontWeight.w500 : FontWeight.normal,
                  fontSize: 8,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
