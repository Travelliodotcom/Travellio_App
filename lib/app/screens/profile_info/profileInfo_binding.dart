import 'package:get/get.dart';

import 'profileInfo_controller.dart';



class profileInfoBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<profileInfoController>(
      () => profileInfoController(),
    );

  }
}
