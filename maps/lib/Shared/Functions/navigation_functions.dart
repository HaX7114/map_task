import 'package:flutter/material.dart';
import 'package:animations/animations.dart';
import 'package:maps/Constants/constants.dart';
import 'package:page_transition/page_transition.dart';

//Calling this function to back to the previous screen
class NavigationFunctions {
  static void navigateBack(BuildContext context) {
    Navigator.pop(context);
  }
}

//This will navigate to the next page using animations
Widget openContainerNavigation(context, nextWidget, currentWidget) {
  return OpenContainer(
    closedBuilder: (context, action) => currentWidget,
    openBuilder: (context, action) => nextWidget,
    openElevation: 0.0,
    closedElevation: 0.0,
    closedShape:
        RoundedRectangleBorder(borderRadius: BorderRadius.circular(K_radius)),
    transitionDuration: const Duration(milliseconds: 700),
    transitionType: ContainerTransitionType.fade,
  );
}

//Navigate to a page
navigateTo(context, page, {transition}) {
  Navigator.push(
    context,
    PageTransition(
      type: transition ?? PageTransitionType.rightToLeftWithFade,
      child: page,
      reverseDuration: const Duration(milliseconds: 500),
      duration: const Duration(milliseconds: 500),
    ),
  );
}
