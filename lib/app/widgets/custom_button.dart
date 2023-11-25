// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';
import 'package:travellio/app/utils/app_colors.dart';

class customButton extends StatelessWidget {
  final String text;

  const customButton({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
          padding:
              EdgeInsets.symmetric(vertical: 2, horizontal: screenWidth * 0.25),
          backgroundColor: AppColor.weirdBlue,
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        onPressed: () {},
        child: Text(
          text,
          style: const TextStyle(
              fontFamily: "inter", color: Colors.white, fontSize: 18),
        ));
  }
}
