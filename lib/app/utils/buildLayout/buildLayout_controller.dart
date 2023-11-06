import 'package:get/get.dart';

class BuildLayoutController extends GetxController {
  var selectedIndex = 0.obs;
  
  void changeIndex(int index) {
    selectedIndex.value = index;
  }

  String getTitle(int index) {
    switch (index) {
      case 0:
        return 'Home';
      case 1:
        return 'Saved Trips';
      case 2:
        return 'Business';
      default:
        return 'Home';
    }
  }
}
