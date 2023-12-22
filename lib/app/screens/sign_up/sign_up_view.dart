import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:travellio/app/utils/app_colors.dart';
import './sign_up_controller.dart';

class SignUpView extends GetView<SignUpController> {
  const SignUpView({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          Positioned(
            top: 0,
            right: 0,
            child: SvgPicture.asset(
              'assets/design/ion_earthearth.svg',
              color: AppColor.weirdBlue.withOpacity(0.6),
            ),
          ),
          Positioned(
            bottom: 0,
            child: SvgPicture.asset(
              'assets/design/ion_earth_bottom.svg',
              color: AppColor.weirdBlue.withOpacity(0.6),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: Text(
                  "Let's start your",
                  style: TextStyle(
                    fontFamily: 'Raleway',
                    fontWeight: FontWeight.w700,
                    fontSize: 30,
                    color: Colors.black,
                  ),
                ),
              ),
              Center(
                child: Text(
                  "Journey together",
                  style: TextStyle(
                    fontFamily: 'Raleway',
                    fontWeight: FontWeight.w700,
                    fontSize: 30,
                    color: Colors.black,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  top: 40,
                  left: 70,
                  right: 70,
                  bottom: 20,
                ),
                child: SvgPicture.asset('assets/design/card_earth.svg'),
              ),
              SizedBox(
                width: screenWidth * 0.8,
                child: TextField(
                  decoration: InputDecoration(
                      labelText: "Email-Id",
                      labelStyle: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: AppColor.accentGrey,
                      )),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              SizedBox(
                width: screenWidth * 0.8,
                child: TextField(
                  decoration: InputDecoration(
                      labelText: "Username",
                      labelStyle: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: AppColor.accentGrey,
                      )),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              SizedBox(
                width: screenWidth * 0.8,
                child: TextField(
                  decoration: InputDecoration(
                      labelText: "Password",
                      labelStyle: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: AppColor.accentGrey,
                        // color: Color.fromARGB(255, 68, 67, 67),
                      )),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              GestureDetector(
                onTap: () {
                  Get.toNamed('/login');
                },
                // Add onTap functionality
                child: Align(
                  alignment: Alignment.centerRight,
                  child: Padding(
                    padding: const EdgeInsets.only(
                      right: 35,
                    ),
                    child: Text(
                      "Already have an account?",
                      textAlign: TextAlign.right,
                      style: TextStyle(
                        decoration: TextDecoration.underline,
                        fontSize: 13,
                        color: AppColor.accentGrey,
                        fontFamily: "Inter",
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Container(
                padding: const EdgeInsets.only(bottom: 30),
                width: screenWidth * 0.75,
                child: ElevatedButton(
                    onPressed: () async {},
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 18),
                      backgroundColor: Colors.white,
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        side: BorderSide(color: AppColor.weirdBlue, width: 1),
                        borderRadius: BorderRadius.circular(33),
                      ),
                    ),
                    child: Text(
                      "Create Account",
                      style: TextStyle(
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w700,
                        color: AppColor.weirdBlue,
                      ),
                    )),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
