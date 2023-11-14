// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';

class tile extends StatelessWidget {
  final String imagePath;
  final VoidCallback onTap;

  const tile({super.key, required this.imagePath, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 40,
        height: 40,
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black26,
              blurRadius: 2,
            )
          ]
        ),
        child: Center(
            child: Image.asset(
          imagePath,
          width: 25,
          height: 25,
        )),
      ),
    );
  }
}
