// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../utils/app_colors.dart';

class MenuTile extends StatelessWidget {
  final String title;
  final Widget icon;
  final void Function() onTap;
  final bool isDanger;
  const MenuTile({
    super.key,
    required this.title,
    required this.icon,
    required this.onTap,
    this.isDanger = false,
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return InkWell(
      onTap: onTap,
      radius: 22,
      child: Container(
        width: screenWidth * 0.75,
        height: screenHeight * 0.1,
        decoration: const BoxDecoration(
          color: Colors.white,
          border: Border.symmetric(),
          borderRadius: BorderRadius.all(Radius.circular(22)),
        ),
        child: Padding(
          padding: const EdgeInsets.only(left: 10, top: 5),
          child: Row(
            children: [
              icon,
              const SizedBox(
                width: 10,
              ),
              Text(
                title,
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  color:
                      (title == "Sign Out" ? Colors.red : AppColor.accentGrey),
                  fontFamily: "inter",
                  fontSize: 20,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
