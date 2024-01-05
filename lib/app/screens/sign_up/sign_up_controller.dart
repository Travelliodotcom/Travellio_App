  // ignore_for_file: unused_local_variable

  import 'package:firebase_auth/firebase_auth.dart';
  import 'package:flutter/widgets.dart';
  import 'package:get/get.dart';

  class SignUpController extends GetxController {
    var emailc = TextEditingController();
    var passc = TextEditingController();
    var userc = TextEditingController();
    var auth = FirebaseAuth.instance;
    Future signupUser() async {
      if (emailc.text.isNotEmpty && passc.text.isNotEmpty) {
        try {
          var credential = await auth.createUserWithEmailAndPassword(
              email: emailc.text.trim(), password: passc.text);
          Get.offAllNamed('/login');
        } catch (e) {
          if (e is FirebaseAuthException) print(e.code);
        }
      }
    }
  }
