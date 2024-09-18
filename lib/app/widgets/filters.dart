import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ScrollableButtonRow extends StatelessWidget {
  final List<Map<String, dynamic>> items = [
    {
      'icon': 'assets/images/mountaintemp.png',
      'text': 'Lakes'
    },
    {
      'icon': 'assets/images/mountaintemp.png',
      'text': 'Sea'
    },
    {
      'icon': 'assets/images/mountaintemp.png',
      'text': 'Mountain'
    },
    {
      'icon': 'assets/images/mountaintemp.png',
      'text': 'Forest'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: List.generate(items.length, (index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: ElevatedButton.icon(
              onPressed: () {
              },
              icon: Image.asset(
                items[index]['icon'],
                width: 20,
                height: 20,
              ),
              label: Text(
                items[index]['text'],
                style: TextStyle(color: Colors.black),
              ),
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
              ),
            ),
          );
        }),
      ),
    );
  }
}
