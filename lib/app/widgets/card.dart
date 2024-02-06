import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:travellio/app/utils/app_colors.dart';
import 'package:travellio/app/widgets/swipe_pill_container.dart';

class CardWidget extends StatelessWidget {
  final String imageUrl;
  final String name;
  final int age;
  final VoidCallback onTap;

  const CardWidget({
    required this.imageUrl,
    required this.name,
    required this.age,
    Key? key, required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Container(
      // alignment: Alignment.center,
      width: screenWidth * 0.85,
      height: screenHeight * 0.7,
      decoration: BoxDecoration(
        border: Border.all(color: AppColor.weirdBlue, width: 5),
        borderRadius: BorderRadius.circular(16.0),
        color: Colors.white,
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                '$name, ',
                style: const TextStyle(
                  fontSize: 30.0,
                  fontFamily: "Raleway",
                  fontWeight: FontWeight.w800,
                  color: Colors.black,
                ),
              ),
              Text(
                '$age',
                style: const TextStyle(
                  fontSize: 30.0,
                  fontFamily: "Raleway",
                  fontWeight: FontWeight.w800,
                  color: Colors.black,
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              width: screenWidth * 0.75,
              height: screenWidth * 0.7,
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: NetworkImage(imageUrl), fit: BoxFit.fill),
                borderRadius: BorderRadius.circular(15),
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.location_on,
                color: AppColor.weirdBlue,
              ),
              Text(
                "Vadodara",
                style: TextStyle(
                  fontFamily: "Raleway",
                  //fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
            ],
          ),
          Text(
            "Trips Completed : 26",
            style: TextStyle(
              fontFamily: "Raleway",
              //fontWeight: FontWeight.bold,
              fontSize: 13,
              color: AppColor.accentGrey,
            ),
          ),
          Text(
            "About",
            style: TextStyle(
              fontFamily: "Raleway",
              fontWeight: FontWeight.bold,
              fontSize: 23,
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Center(
              child: Text(
                textAlign: TextAlign.center,
                maxLines: 5,
                "boris nisi ut aliquip ex ea commodo consequat.boris nisi ut aliquip ex ea commodo consequat.boris dhry jemfsk dorem ipsum lotis ",
                style: TextStyle(
                  fontSize: 14,
                  fontFamily: "Raleway",
                  color: Colors.black,
                ),
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              SwipePill(
                  text: "Drinks",
                  icon: Icons.local_drink,
                  isSelected: false,
                  onTap: () {}),
              SwipePill(
                  text: "Oceans",
                  icon: Icons.water,
                  isSelected: false,
                  onTap: () {}),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              SwipePill(
                  text: "Forests",
                  icon: CupertinoIcons.tree,
                  isSelected: false,
                  onTap: () {}),
              SwipePill(
                  text: "Music",
                  icon: Icons.play_arrow,
                  isSelected: false,
                  onTap: () {}),
            ],
          ),
        ],
      ),
    );
  }
}
