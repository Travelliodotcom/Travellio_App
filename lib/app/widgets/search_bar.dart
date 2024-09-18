import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomSearchBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(40.0),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 2,
              blurRadius: 5,
              offset: Offset(0, 3),
            ),
          ],
        ),
        child: TextField(
          decoration: InputDecoration(
            hintText: 'Anywhere',
            prefixIcon: Padding(
              padding: const EdgeInsets.all(10.0), // Adjust padding if needed
              child: SvgPicture.asset(
                'assets/icons/searchicon.svg',
                width: 10,
                height: 10,
              ),
            ),
            suffixIcon: Padding(
              padding: const EdgeInsets.all(10.0),
              child: SvgPicture.asset(
                'assets/icons/filtericon.svg',
                width: 10,
                height: 10,
              ),
            ),
            border: InputBorder.none,
            contentPadding: EdgeInsets.symmetric(vertical: 15.0),
          ),
        ),
      ),
    );
  }
}
