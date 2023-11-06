import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:travellio/app/screens/home/home_view.dart';
import 'package:travellio/app/screens/saved_trips/saved_trips_view.dart';
import 'package:travellio/app/utils/buildLayout/buildLayout_controller.dart';

class BuildLayout extends GetView<BuildLayoutController> {
  final List<Widget> pageList = [
    HomeView(),
    SavedTrips(),
  ];

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Scaffold(
        appBar: AppBar(
          title: Text(controller.getTitle(controller.selectedIndex.value)),
        ),
        body: pageList[controller.selectedIndex.value],
        bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.business),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.school),
              label: '',
            ),
          ],
          currentIndex: controller.selectedIndex.value,
          selectedItemColor: Colors.amber[800],
          onTap: controller.changeIndex,
        ),
      );
    });
  }
}
