import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class SignUpController extends GetxController {
  RxBool obscureText = true.obs;
  RxBool emailIsValid = false.obs;
  RxBool passwordIsValid = false.obs;

  final FirebaseAuth _auth = FirebaseAuth.instance;

  void isEmailValid(String uname) {
    final emailRegex = RegExp(r'^[\w-]+(\.[\w-]+)*@[\w-]+(\.[\w-]+)+$');
    emailIsValid.value = emailRegex.hasMatch(uname);
  }

  // void isPasswordValid(String pwd) {
  //   final pwdRegex = RegExp(r'[A-Za-z0-9@#$%&*._]{5,20}');
  //   passwordIsValid.value = pwdRegex.hasMatch(pwd);
  // }

  Future<void> createAccount(String email, String password) async {
    try {
      UserCredential userCredential = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      Get.snackbar(
        'Success',
        'Account Created',
        snackPosition: SnackPosition.BOTTOM,
        duration: const Duration(seconds: 2),
      );

      Get.toNamed('/login');

    } catch (e) {
      Get.snackbar(
        'Error',
        e.toString(),
        snackPosition: SnackPosition.BOTTOM,
        duration: const Duration(seconds: 2),
      );
    }
  }

  bool success() {
    if (emailIsValid.isTrue) {
      return true;
    } else {
      Get.snackbar(
        'Error',
        'Invalid username or password',
        snackPosition: SnackPosition.BOTTOM,
        duration: const Duration(seconds: 2),
      );
      return false;
    }
  }
}
