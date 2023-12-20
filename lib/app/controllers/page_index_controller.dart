import 'package:get/get.dart';

class PageIndexController extends GetxController {
  RxInt currentIndex = 0.obs;

  void changePage(int index) {
    currentIndex.value = index;
    update();
  }
}
