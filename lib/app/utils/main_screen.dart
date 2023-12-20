import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:travellio/app/screens/ai_generator/ai_generator_view.dart';
import 'package:travellio/app/screens/chatpage/chatpage_view.dart';
import 'package:travellio/app/screens/chatroom/chatroom_view.dart';
import 'package:travellio/app/screens/home/home_view.dart';
import 'package:travellio/app/screens/host_trip/host_trip_view.dart';
import 'package:travellio/app/screens/swipe/swipe_view.dart';
import 'package:travellio/app/widgets/bottomNavBar.dart';

import '../controllers/page_index_controller.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final PageIndexController pageIndexController =
      Get.put(PageIndexController());

  final List<Widget> pages = [
    HomeView(),
    ai_generator_view(),
    Chatpage(),
    swipeView()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
        () => pages[pageIndexController.currentIndex.value],
      ),
      bottomNavigationBar: const bottomNavBar(),
    );
  }
}
