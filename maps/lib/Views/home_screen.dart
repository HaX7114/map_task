import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:maps/Constants/constants.dart';
import 'package:maps/Controllers/HomeScreenController/home_screen_cubit.dart';
import 'package:maps/Controllers/HomeScreenController/home_screen_states.dart';
import 'package:maps/Models/location.dart';
import 'package:maps/Shared/CustomWidgets/custom_container.dart';
import 'package:maps/Shared/CustomWidgets/my_button.dart';
import 'package:maps/Shared/CustomWidgets/my_drawer.dart';
import 'package:maps/Shared/Functions/toasters.dart';
import 'package:maps/Views/destination_screen.dart';
import 'package:maps/Views/source_screen.dart';

import '../Shared/Functions/navigation_functions.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => HomeScreenCubit(),
        child: BlocConsumer<HomeScreenCubit, HomeScreenStates>(
          listener: (context, state) {},
          builder: (context, state) {
            HomeScreenCubit homeScreenCubit = HomeScreenCubit.get(context);
            return Scaffold(
              key: scaffoldKey,
              drawer: MyDrawer(cubit: homeScreenCubit),
              body: Stack(
                children: [
                  Image.asset(
                    'assets/images/Map.jpg',
                    fit: BoxFit.cover,
                    height: double.infinity,
                    width: double.infinity,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(K_mainPadding),
                    child: Column(
                      children: [
                        K_vSpace20,
                        K_vSpace20,
                        Container(
                          decoration: BoxDecoration(
                            boxShadow: shadow,
                            color: Colors.grey[100],
                            borderRadius: BorderRadius.circular(K_radius),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                CircleAvatar(
                                  backgroundColor: K_whiteColor,
                                  child: IconButton(
                                    onPressed: () {
                                      scaffoldKey.currentState!.openDrawer();
                                    },
                                    color: K_blackColor,
                                    icon: const Icon(Icons.menu_rounded),
                                  ),
                                ),
                                K_vSpace10,
                                openContainerNavigation(
                                  context,
                                  SourceScreen(cubit: homeScreenCubit),
                                  CustomContainer(
                                    color: K_whiteColor,
                                    text: homeScreenCubit.currentLocation.name,
                                  ),
                                ),
                                K_vSpace10,
                                openContainerNavigation(
                                  context,
                                  DestinationScreen(cubit: homeScreenCubit),
                                  CustomContainer(
                                    color: K_whiteColor,
                                    text: homeScreenCubit.destination.name,
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                        K_ExpandedSpace,
                        MyButton(
                          onPressed: () {
                            double firstLat =
                                homeScreenCubit.currentLocation.latitude;
                            double firstLng =
                                homeScreenCubit.currentLocation.longitude;
                            double secondLat =
                                homeScreenCubit.destination.latitude;
                            double secondLng =
                                homeScreenCubit.destination.longitude;
                            double distance = Location.measureDistance(
                                firstLat, firstLng, secondLat, secondLng);

                            checkAndShowTheResult(
                                firstLat, secondLat, distance);
                          },
                          text: 'REQUEST RD',
                          fillColor: Colors.blue[500],
                        )
                      ],
                    ),
                  )
                ],
              ),
            );
          },
        ));
  }

  void checkAndShowTheResult(double lat1, double lat2, double distance) {
    if (lat1 == 0.0) {
      showToastMessage('Source is not selected !', color: Colors.red);
    } else if (lat2 == 0.0) {
      showToastMessage('Destination is not selected !', color: Colors.red);
    } else {
      viewCalculatedDistance(distance);
    }
  }

  void viewCalculatedDistance(double distance) {
    if (distance <= 1000) {
      showToastMessage(
          'The Distance is : ${distance.ceilToDouble().toStringAsFixed(0)} KM',
          color: Colors.green);
    } else {
      showToastMessage(
          'The Distance is : ${distance.ceilToDouble().toStringAsFixed(0)} m',
          color: Colors.green);
    }
  }
}
