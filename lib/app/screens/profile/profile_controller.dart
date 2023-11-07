import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

import '../../routes/app_pages.dart';

class ProfileController extends GetxController {
  FirebaseAuth auth = FirebaseAuth.instance;

  logout() async {
    await auth.signOut();
    Get.offAllNamed(Routes.LOGIN);
  }
}
