import 'package:get/get.dart';
import '../../utils/buildLayout/buildLayout_controller.dart';
import './login_controller.dart';

class LoginBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LoginController>(
      () => LoginController(),
    );
    // Get.lazyPut<BuildLayoutController>(
    //   () => BuildLayoutController(),
    // );
  }
}
