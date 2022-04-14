import 'package:maps/Constants/constants.dart';
import 'package:maps/Models/location.dart';

class Destination extends Location {
  String country;

  @override
  final String name;
  @override
  final dynamic latitude;
  @override
  final dynamic longitude;

  Destination(
      {required this.country,
      required this.name,
      required this.latitude,
      required this.longitude})
      : super(name: name, latitude: latitude, longitude: longitude);

  @override
  static searchLocation(text) {
    final suggestions = destinations.where((destination) {
      final names = destination.name.toLowerCase();
      final input = text.toLowerCase();
      return names.contains(input);
    }).toList();
    return suggestions;
  }
}
