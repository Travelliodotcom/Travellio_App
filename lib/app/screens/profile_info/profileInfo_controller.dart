import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import '../../routes/app_pages.dart';

class profileInfoController extends GetxController {
  FirebaseAuth auth = FirebaseAuth.instance;
  TextEditingController biography = TextEditingController();

}
