import 'package:flutter/material.dart';
import 'package:maps/Constants/constants.dart';

import 'my_text.dart';

class FallbackWidget extends StatelessWidget {
  final String message;
  final IconData iconData;
  const FallbackWidget(
      {Key? key, required this.message, required this.iconData})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: K_mainPadding * 5),
      child: Center(
        child: Column(
          children: [
            Icon(iconData, size: 80, color: Colors.blue),
            K_vSpace20,
            MyText(
                text: message,
                fontWeight: FontWeight.normal,
                size: K_fontSizeM),
          ],
        ),
      ),
    );
  }
}
