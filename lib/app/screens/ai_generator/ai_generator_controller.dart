import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class ai_generator_Controller extends GetxController {
  TextEditingController destination = TextEditingController();

  RxString number = "0".obs;
  RxDouble sliderValue = 0.0.obs;
  RxList<String> selectedActivities = RxList<String>();

  void increment() {
    number.value = (int.parse(number.value) + 1).toString();
  }

  void decrement() {
    if (int.parse(number.value) > 0) {
      number.value = (int.parse(number.value) - 1).toString();
    }
  }

  void updateSlider(double val) {
    sliderValue.value = val;
  }

  void toggleActivitySelection(String activity) {
    if (selectedActivities.contains(activity)) {
      selectedActivities.remove(activity);
    } else {
      selectedActivities.add(activity);
    }
  }
}
