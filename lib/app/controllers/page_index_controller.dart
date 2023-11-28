import 'package:get/get.dart';

class PageIndexController extends GetxController {
  RxInt pageIndex = 0.obs;

  void changePage(int index) {
    pageIndex.value = index;
    switch (index) {
      case 0:
        Get.offAllNamed("/home");
        break;
      case 1:
        Get.offAllNamed("/generator");
        break;
      case 2:
        Get.offAllNamed("/chat");
        break;
      case 3:
        Get.offAllNamed("/host");
        break;
      default:
        Get.offAllNamed("/home");
        break;
    }
  }
}
