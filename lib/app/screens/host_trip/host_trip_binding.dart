import 'package:get/get.dart';
import 'package:travellio/app/screens/host_trip/host_trip_controller.dart';

class hostTripBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<hostTripController>(() => hostTripController());
  }
}
