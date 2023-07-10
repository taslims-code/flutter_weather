import 'package:flutter/foundation.dart';

class Location {
  double latitude = 23.02;
  double longitude = 91.40;

  getCurrentLocation() {
    try {
      latitude = latitude;
      longitude = longitude;
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
  }
}
