// ignore_for_file: constant_identifier_names

import 'package:get/get.dart';
import 'package:get/get_navigation/src/routes/default_transitions.dart';
import 'package:travellio/app/screens/ai_generator/ai_generator_bindings.dart';
import 'package:travellio/app/screens/ai_generator/ai_generator_view.dart';
import 'package:travellio/app/screens/chatroom/chatroom_binding.dart';
import 'package:travellio/app/screens/chatroom/chatroom_view.dart';
import 'package:travellio/app/screens/home/home_view.dart';
import 'package:travellio/app/screens/host_trip/host_trip_view.dart';
import 'package:travellio/app/screens/login/login_view.dart';
import 'package:travellio/app/screens/profile/profile_binding.dart';
import 'package:travellio/app/screens/profile/profile_view.dart';
import 'package:travellio/app/screens/saved_trips/saved_trips_view.dart';
import 'package:travellio/app/screens/sign_up/sign_up_binding.dart';
import 'package:travellio/app/screens/sign_up/sign_up_view.dart';
import 'package:travellio/app/utils/buildLayout/buildLayout_view.dart';
import '../screens/home/home_binding.dart';
import '../screens/host_trip/host_trip_binding.dart';
import '../screens/login/login_binding.dart';
import '../screens/saved_trips/saved_trips_binding.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      // page: () => BuildLayout(),
      page: () => HomeView(),
      binding: HomeBinding(),
      // transition: Transition.zoom
    ),
    GetPage(
      name: _Paths.LOGIN,
      page: () => const LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.SIGNUP,
      // page: () => BuildLayout(),
      page: () => SignUpView(),
      binding: SignUpBinding(),
    ),
    GetPage(
      name: _Paths.SAVEDTRIPS,
      // page: () => BuildLayout(),
      page: () => SavedTripsView(),
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
      // transition: Transition.zoom
    ),
    GetPage(
      name: _Paths.PROFILE,
      page: () => ProfileView(),
      binding: ProfileBinding(),
    ),
    GetPage(
      name: _Paths.CHAT,
      page: () => Chatroom(),
      binding: ChatroomBinding(),
    ),
  ];
}
