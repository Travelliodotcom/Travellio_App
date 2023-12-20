import 'package:get/get.dart';
import 'package:travellio/app/screens/ai_generator/ai_generator_controller.dart';


class ai_generator_binding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ai_generator_Controller>(
      () => ai_generator_Controller(),
    );

  }
}
