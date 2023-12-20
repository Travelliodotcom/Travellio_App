import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:travellio/app/screens/swipe/swipe_controller.dart';
import 'package:swipe_cards/swipe_cards.dart';
import 'package:travellio/app/utils/app_colors.dart';
import '../../controllers/page_index_controller.dart';

class swipeView extends GetView<swipeController> {
  swipeView({super.key});
  final pageIndexController = Get.find<PageIndexController>();
  final swipeController controller = Get.put(swipeController());

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    controller.initialize();
    return Scaffold(
        backgroundColor: AppColor.pageColor,
        appBar: AppBar(
          scrolledUnderElevation: 0,
          centerTitle: true,
          title: const Text(
            "Find Match",
            style: TextStyle(color: Colors.black),
          ),
          elevation: 0,
          backgroundColor: Colors.transparent,
        ),
        body: SwipeCards(
          matchEngine: controller.matchEngine,
          itemBuilder: (BuildContext context, int index) {
            return Container(
              alignment: Alignment.center,
              child: controller.swipeItems[index].content,
            );
          },
          onStackFinished: () {},
          upSwipeAllowed: true,
          fillSpace: true,
        ));
  }
}
