import 'package:flutter/material.dart';
import 'package:maps/Models/destination_location.dart';

//Colors
const Color K_whiteColor = Color(0XFFFFFFFF);
const Color K_blackColor = Color(0XFF000000);
const Color K_transColor = Colors.transparent;

//Spaces
const SizedBox K_hSpace10 = SizedBox(
  width: 10.0,
);
const SizedBox K_vSpace10 = SizedBox(
  height: 10.0,
);
const SizedBox K_hSpace20 = SizedBox(
  width: 20.0,
);
const SizedBox K_vSpace20 = SizedBox(
  height: 20.0,
);
dynamic K_ExpandedSpace = Expanded(child: Container());

//Doubles
const double K_fontSizeM = 15.0;
const double K_fontSizeL = 20.0;
const double K_radius = 20.0;
const double K_mainPadding = 20.0;

//Progress Indicator
const Widget K_progressIndicator = Center(
    child: CircularProgressIndicator(
  color: K_blackColor,
  strokeWidth: 5.0,
));
//Shadows
dynamic shadow = [const BoxShadow(color: Colors.black12, blurRadius: 20.0)];

//List of destinations

List<Destination> destinations = [
  Destination(
      country: 'Andorra',
      name: 'Sant Julià de Lòria',
      latitude: 42.46372,
      longitude: 1.49129),
  Destination(
      country: 'Andorra',
      name: 'Pas de la Casa',
      latitude: 42.54277,
      longitude: 1.73361),
  Destination(
      country: 'Andorra',
      name: 'Ordino',
      latitude: 42.55623,
      longitude: 1.53319),
  Destination(
      country: 'Andorra',
      name: 'les Escaldes',
      latitude: 42.50729,
      longitude: 1.53414),
  Destination(
      country: 'Andorra',
      name: 'la Massana',
      latitude: 42.54499,
      longitude: 1.51483),
  Destination(
      country: 'Andorra',
      name: 'Encamp',
      latitude: 42.53474,
      longitude: 1.58014),
  Destination(
      country: 'Andorra',
      name: 'Canillo',
      latitude: 42.5676,
      longitude: 1.59756),
  Destination(
      country: 'Andorra',
      name: 'Arinsal',
      latitude: 42.57205,
      longitude: 1.48453),
  Destination(
      country: 'Andorra',
      name: 'Andorra la Vella',
      latitude: 42.50779,
      longitude: 1.52109),
  Destination(
      country: 'United Arab Emirates',
      name: 'Umm al Qaywayn',
      latitude: 25.56473,
      longitude: 55.55517),
  Destination(
      country: 'United Arab Emirates',
      name: 'Ras al-Khaimah',
      latitude: 25.78953,
      longitude: 55.9432),
  Destination(
      country: 'United Arab Emirates',
      name: 'Muzayri',
      latitude: 23.14355,
      longitude: 53.7881),
  Destination(
      country: 'United Arab Emirates',
      name: 'Murbaḩ',
      latitude: 25.27623,
      longitude: 56.36256),
  Destination(
      country: 'United Arab Emirates',
      name: 'Khawr Fakkān',
      latitude: 25.33132,
      longitude: 56.34199),
  Destination(
      country: 'United Arab Emirates',
      name: 'Dubai',
      latitude: 25.0657,
      longitude: 55.17128),
  Destination(
      country: 'United Arab Emirates',
      name: 'Dibba Al-Fujairah',
      latitude: 25.59246,
      longitude: 56.26176),
];
