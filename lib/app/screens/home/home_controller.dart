// ignore_for_file: non_constant_identifier_names

import 'dart:async';

import 'package:get/get.dart';
import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';

class HomeController extends GetxController {
  var selectedIndex = 0.obs;
  RxString location = "Fetching Location..".obs;
  RxString country_obs = "".obs;
  int itemCounter = 10;
  RxBool isFetch = false.obs;

  final Duration updateInterval = const Duration(seconds: 20);
  late Timer locationUpdateTimer;

  void changeIndex(int index) {
    selectedIndex.value = index;
    update();
  }

  @override
  void onInit() {
    super.onInit();
    locationUpdateTimer = Timer.periodic(updateInterval, (_) {
      fetchLocation();
    });
    fetchLocation();
  }

  Future<void> fetchLocation() async {
    try {
      Position position = await _determinePosition();
      double latitude = position.latitude;
      double longitude = position.longitude;

      List<Placemark> placemarks =
          await placemarkFromCoordinates(latitude, longitude);
      if (placemarks.isNotEmpty) {
        String? city = placemarks[0].locality;
        String? country = placemarks[0].country;
        country_obs.value = country!;
        location.value = city!;
        isFetch = true.obs;
      } else {
        location.value = 'Location not found';
      }
    } catch (e) {
      print('Error: $e');
      location.value = 'Switch on Location';
    }
  }

  Future<Position> _determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      throw 'Location services are disabled.';
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        throw 'Location permissions are denied';
      }
    }

    if (permission == LocationPermission.deniedForever) {
      throw 'Location permissions are permanently denied, we cannot request permissions.';
    }
    return await Geolocator.getCurrentPosition();
  }

  List<String> locationNames = [
    "OrangeFish lake",
    "Scary Mountains",
    "Ancient Pillars",
    "OrangeFish lake",
    "Scary Mountains",
    "Ancient Pillars"
  ];

  List<String> imageURL = [
    "https://images.pexels.com/photos/1450082/pexels-photo-1450082.jpeg?auto=compress&cs=tinysrgb&w=1600",
    "https://images.pexels.com/photos/1367192/pexels-photo-1367192.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
    "https://images.pexels.com/photos/4916671/pexels-photo-4916671.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
    "https://images.pexels.com/photos/1450082/pexels-photo-1450082.jpeg?auto=compress&cs=tinysrgb&w=1600",
    "https://images.pexels.com/photos/1367192/pexels-photo-1367192.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
    "https://images.pexels.com/photos/4916671/pexels-photo-4916671.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1"
  ];
}
