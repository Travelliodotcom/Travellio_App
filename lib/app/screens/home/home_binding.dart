import 'package:get/get.dart';
import 'package:travellio/app/screens/home/home_controller.dart';

import '../../utils/buildLayout/buildLayout_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeController>(
      () => HomeController(),
    );
    Get.lazyPut<BuildLayoutController>(
      () => BuildLayoutController(),
    );
  }
}
