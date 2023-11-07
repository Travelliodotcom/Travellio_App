import 'package:get/get.dart';
import 'package:travellio/app/utils/buildLayout/buildLayout_controller.dart';

import 'profile_controller.dart';

class ProfileBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ProfileController>(
      () => ProfileController(),
    );
    Get.lazyPut<BuildLayoutController>(
      () => BuildLayoutController(),
    );
  }
}
