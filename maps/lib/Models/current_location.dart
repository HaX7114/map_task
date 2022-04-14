import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:maps/Models/location.dart';

class CurrentLocation extends Location {
  @override
  final String name;
  @override
  final dynamic latitude;
  @override
  final dynamic longitude;

  static final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  CurrentLocation(
      {required this.name, required this.latitude, required this.longitude})
      : super(name: name, latitude: latitude, longitude: longitude);

  @override
  static searchLocation(text) {
    return _firestore
        .collection('Source')
        .orderBy('name')
        .startAfter([text.toUpperCase()]);
  }
}
