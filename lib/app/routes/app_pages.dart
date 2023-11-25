// ignore_for_file: constant_identifier_names

import 'package:get/get.dart';
import 'package:travellio/app/screens/ai_generator/ai_generator_view.dart';
import 'package:travellio/app/screens/host_trip/host_trip_view.dart';
import 'package:travellio/app/screens/login/login_view.dart';
import 'package:travellio/app/screens/sign_up/sign_up_binding.dart';
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
      page: () => BuildLayout(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.LOGIN,
      page: () => const LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.SIGNUP,
      page: () => BuildLayout(),
      binding: SignUpBinding(),
    ),
    GetPage(
      name: _Paths.SAVEDTRIPS,
      page: () => BuildLayout(),
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
      binding: hostTripBinding(),
    ),
  ];
}
