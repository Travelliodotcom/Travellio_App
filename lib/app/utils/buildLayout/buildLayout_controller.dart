// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:travellio/app/screens/chatpage/chatpage_view.dart';
import 'package:travellio/app/screens/chatroom/chatroom_view.dart';

import '../../screens/home/home_view.dart';
import '../../screens/profile/profile_view.dart';
import '../../screens/saved_trips/saved_trips_view.dart';

class BuildLayoutController extends GetxController {
  var selectedIndex = 0.obs;

  void changeIndex(int index) {
    selectedIndex.value = index;
  }

  final List<Widget> pageList = [
    HomeView(),
    Chatpage(),
    SavedTripsView(),
    ProfileView(),
  ];
}
