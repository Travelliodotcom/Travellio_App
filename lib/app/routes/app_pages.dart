// ignore_for_file: constant_identifier_names

import 'package:get/get.dart';
import 'package:travellio/app/screens/ai_generator/ai_generator_bindings.dart';
import 'package:travellio/app/screens/ai_generator/ai_generator_view.dart';
import 'package:travellio/app/screens/chatpage/chatpage_binding.dart';
import 'package:travellio/app/screens/chatpage/chatpage_view.dart';
import 'package:travellio/app/screens/host_trip/host_trip_view.dart';
import 'package:travellio/app/screens/login/login_view.dart';
import 'package:travellio/app/screens/profile/profile_binding.dart';
import 'package:travellio/app/screens/profile/profile_view.dart';
import 'package:travellio/app/screens/profile_info/profileInfo_binding.dart';
import 'package:travellio/app/screens/profile_info/profileInfo_view.dart';
import 'package:travellio/app/screens/saved_trips/saved_trips_view.dart';
import 'package:travellio/app/screens/sign_up/sign_up_binding.dart';
import 'package:travellio/app/screens/sign_up/sign_up_view.dart';
import 'package:travellio/app/screens/swipe/swipe_view.dart';
import 'package:travellio/app/utils/main_screen.dart';
import '../screens/home/home_binding.dart';
import '../screens/host_trip/host_trip_binding.dart';
import '../screens/login/login_binding.dart';
import '../screens/saved_trips/saved_trips_binding.dart';
import '../screens/swipe/swipe_binding.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => MainScreen(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.LOGIN,
      page: () => const LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.SIGNUP,
      page: () => const SignUpView(),
      binding: SignUpBinding(),
    ),
    GetPage(
      name: _Paths.SAVEDTRIPS,
      page: () => const SavedTripsView(),
      binding: SavedTripsBinding(),
    ),
    GetPage(
      name: _Paths.HOST,
      page: () => hostTripView(),
      binding: hostTripBinding(),
    ),
    GetPage(
      name: _Paths.GENERATOR,
      page: () => ai_generator_view(),
      binding: ai_generator_binding(),
    ),
    GetPage(
      name: _Paths.PROFILE,
      page: () => const ProfileView(),
      binding: ProfileBinding(),
    ),
    GetPage(
      name: _Paths.CHAT,
      page: () => Chatpage(),
      binding: ChatpageBinding(),
    ),
    GetPage(
      name: _Paths.SWIPE,
      page: () => swipeView(),
      binding: swipeBinding(),
    ),
    GetPage(
      name: _Paths.PROFILEINFO,
      page: () => const profileInfoView(),
      binding: profileInfoBinding(),
    ),
   
  ];
}
