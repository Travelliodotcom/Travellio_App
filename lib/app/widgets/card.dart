import 'package:flutter/material.dart';
import 'package:travellio/app/utils/app_colors.dart';

class CardWidget extends StatelessWidget {
  final String imageUrl;
  final String name;
  final int age;

  const CardWidget({
    required this.imageUrl,
    required this.name,
    required this.age,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Container(
      // alignment: Alignment.center,
      width: screenWidth * 0.8,
      height: screenHeight * 0.6,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16.0),
        color: AppColor.weirdBlue,
      ),
      child: Column(
        children: [
          Container(
            width: screenWidth * 0.8,
            height: screenWidth * 0.7,
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: NetworkImage(imageUrl), fit: BoxFit.fill),
              borderRadius: BorderRadius.circular(15),
            ),
          ),
          const SizedBox(height: 8.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                '$name, ',
                style: const TextStyle(
                  fontSize: 25.0,
                  fontFamily: "inter",
                  fontWeight: FontWeight.w800,
                  color: Colors.white70,
                ),
              ),
              Text(
                '$age',
                style: const TextStyle(
                  fontSize: 25.0,
                  fontFamily: "inter",
                  fontWeight: FontWeight.w800,
                  color: Colors.white70,
                ),
              ),
            ],
          ),
          const SizedBox(height: 8.0),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              maxLines: 5,
              "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.",
              style: TextStyle(
                fontSize: 14,
                fontFamily: "inter",
                color: Colors.white,
              ),
            ),
          )
        ],
      ),
    );
  }
}
