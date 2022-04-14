import 'package:geolocator/geolocator.dart';

class Location {
  String name;
  dynamic latitude;
  dynamic longitude;

  Location(
      {required this.name, required this.latitude, required this.longitude});

  static searchLocation(text) {}

  static measureDistance(
      double firstLat, double firstLng, double secondLat, double secondLng) {
    double distanceInMeters =
        Geolocator.distanceBetween(firstLat, firstLng, secondLat, secondLng);
    return distanceInMeters;
  }
}
