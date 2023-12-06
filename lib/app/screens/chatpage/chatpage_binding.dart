import 'package:get/get.dart';
import 'package:travellio/app/screens/chatpage/chatpage_controller.dart';
import 'package:travellio/app/screens/chatroom/chatroom_controller.dart';
class ChatpageBinding extends Bindings{
  @override
  void dependencies(){
    Get.lazyPut(() => Chatpagecontroller());
  }
}