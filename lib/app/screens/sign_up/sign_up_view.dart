import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:travellio/app/routes/app_pages.dart';
import './sign_up_controller.dart';
import 'package:travellio/app/utils/app_colors.dart';

class SignUpView extends GetView<SignUpController> {
  SignUpView({super.key});
  final emailController = TextEditingController();
  final passwordController = TextEditingController();  

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: AppColor.weirdBlue,
      body: SingleChildScrollView(
        physics: const RangeMaintainingScrollPhysics(),
        child: Stack(
          children: [
            Positioned(
              top: 0,
              right: 0,
              child: SvgPicture.asset('assets/design/ion_earthearth.svg'),
            ),
            Positioned(
              bottom: 0,
              child: SvgPicture.asset('assets/design/ion_earth_bottom.svg'),
            ),
            Center(
              child: Padding(
                padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.1,
                    bottom: screenHeight * 0.1),
                child: Column(
                  children: [
                    SizedBox(
                      width: screenWidth * 0.9,
                      child: Card(
                        elevation: 4,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Column(
                          children: [
                            const SizedBox(height: 15),
                            const Text(
                              "   Let's start your\nJourney together!",
                              style: TextStyle(
                                fontFamily: 'Raleway',
                                fontWeight: FontWeight.w700,
                                fontSize: 30,
                                color: Colors.black,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                left: 70,
                                right: 70,
                                bottom: 20,
                              ),
                              child: SvgPicture.asset(
                                  'assets/design/card_earth.svg'),
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: screenWidth * 0.1),
                              child: Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  'Email ID',
                                  style: TextStyle(
                                    fontFamily: 'raleway',
                                    fontSize: 14,
                                    fontWeight: FontWeight.w800,
                                    color: AppColor.accentGrey,
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              margin: const EdgeInsets.only(bottom: 15),
                              width: screenWidth * 0.75,
                              decoration: BoxDecoration(
                                color: AppColor.weirdBlue,
                                borderRadius: BorderRadius.circular(33),
                              ),
                              child: TextField(
                                controller: emailController,
                                cursorColor: Colors.white,
                                cursorWidth: 1,
                                maxLines: 1,
                                style: const TextStyle(
                                  fontFamily: 'raleway',
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.white,
                                ),
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText: "example@domain.com",
                                  hintStyle: const TextStyle(
                                    fontFamily: 'raleway',
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.white,
                                  ),
                                  prefixIcon: const Icon(
                                    Icons.mail_outlined,
                                    color: Colors.white,
                                  ),
                                  suffixIcon: Obx(
                                    () => controller.emailIsValid.isTrue
                                        ? const Icon(
                                            Icons.check_circle_outline,
                                            color: Colors.white,
                                          )
                                        : const SizedBox.shrink(),
                                  ),
                                ),
                                onChanged: (text) {
                                  controller.isEmailValid(text);
                                },
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: screenWidth * 0.1),
                              child: Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  'Password',
                                  style: TextStyle(
                                    fontFamily: 'raleway',
                                    fontSize: 14,
                                    fontWeight: FontWeight.w800,
                                    color: AppColor.accentGrey,
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              margin: const EdgeInsets.only(bottom: 20),
                              width: screenWidth * 0.75,
                              decoration: BoxDecoration(
                                color: AppColor.weirdBlue,
                                borderRadius: BorderRadius.circular(33),
                              ),
                              child: TextField(
                                controller: passwordController,
                                cursorColor: Colors.white,
                                cursorWidth: 1,
                                obscureText: controller.obscureText.value,
                                maxLines: 1,
                                style: const TextStyle(
                                  fontFamily: 'raleway',
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.white,
                                ),
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText: "***********",
                                  hintStyle: const TextStyle(
                                    fontFamily: 'raleway',
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.white,
                                  ),
                                  prefixIcon: const Icon(
                                    Icons.lock_outlined,
                                    color: Colors.white,
                                  ),
                                  suffixIcon: IconButton(
                                    icon: controller.obscureText.value
                                        ? SvgPicture.asset(
                                            'assets/icons/show.svg',
                                            color: AppColor.weirdBlue,
                                          )
                                        : SvgPicture.asset(
                                            'assets/icons/hide.svg',
                                            color: AppColor.weirdBlue,
                                          ),
                                    onPressed: () {
                                      controller.obscureText.value =
                                          !controller.obscureText.value;
                                    },
                                  ),
                                ),
                                onChanged: (text) {
                                  // controller.isPasswordValid(text);
                                },
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: ElevatedButton(
                                onPressed: () {
                                  if (controller.success()) {
                                    controller.createAccount(
                                      emailController.text,
                                      passwordController.text,
                                    );
                                  }
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.transparent,
                                  minimumSize: const Size(double.infinity, 50),
                                  foregroundColor: AppColor.weirdBlue,
                                  side: BorderSide(
                                      color: AppColor.weirdBlue, width: 2),
                                  elevation: 0,
                                ),
                                child: const Text('Create Account',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                    )),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(bottom: screenHeight * 0.1),
                      alignment: Alignment.bottomCenter,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          const SizedBox(height: 20),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text(
                                "Already have an account?",
                                style: TextStyle(
                                    fontFamily: 'raleway',
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                              const SizedBox(
                                width: 4,
                              ),
                              GestureDetector(
                                onTap: () {
                                  Get.toNamed('/login');
                                },
                                child: const Text(
                                  "Login",
                                  style: TextStyle(
                                    fontFamily: 'raleway',
                                    decoration: TextDecoration.underline,
                                    decorationColor: Colors.white,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
