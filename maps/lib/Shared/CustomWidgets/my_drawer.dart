import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:maps/Constants/constants.dart';
import 'package:maps/Controllers/HomeScreenController/home_screen_cubit.dart';
import 'package:maps/Shared/CustomWidgets/my_text.dart';
import 'package:maps/Shared/Functions/navigation_functions.dart';
import 'package:maps/Views/destination_screen.dart';
import 'package:maps/Views/source_screen.dart';

class MyDrawer extends StatelessWidget {
  final HomeScreenCubit cubit;
  const MyDrawer({Key? key, required this.cubit}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double deviceHeight = MediaQuery.of(context).size.height;
    double deviceWidth = MediaQuery.of(context).size.width;
    return Container(
      color: K_whiteColor,
      height: deviceHeight,
      width: deviceWidth * 0.7,
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: MyText(text: 'Maps', size: K_fontSizeL),
            ),
            DrawerItem(
              iconData: CupertinoIcons.map_pin_ellipse,
              itemText: 'Set a source point',
              page: SourceScreen(cubit: cubit),
            ),
            DrawerItem(
              iconData: CupertinoIcons.map,
              itemText: 'Set destination',
              page: DestinationScreen(cubit: cubit),
            ),
            Expanded(child: Container()),
            Padding(
              padding: const EdgeInsetsDirectional.all(10.0),
              child: MyText(
                text: 'Maps v1.0.0',
                size: 12.0,
                fontWeight: FontWeight.normal,
              ),
            )
          ],
        ),
      ),
    );
  }
}

class DrawerItem extends StatelessWidget {
  final iconData;
  final itemText;
  final page;
  const DrawerItem({
    Key? key,
    required this.iconData,
    required this.itemText,
    required this.page,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        navigateTo(context, page);
      },
      child: Padding(
        padding: const EdgeInsetsDirectional.all(10.0),
        child: Row(
          children: [
            Icon(
              iconData,
              color: K_blackColor,
              size: 30.0,
            ),
            K_hSpace20,
            MyText(text: itemText, size: K_fontSizeM + 2)
          ],
        ),
      ),
    );
  }
}
