import 'package:get/get.dart';
import 'package:travellio/app/screens/swipe/swipe_controller.dart';


class swipeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<swipeController>(
      () => swipeController(),
    );

  }
}
