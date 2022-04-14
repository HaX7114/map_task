import 'package:flutter/material.dart';
import 'package:maps/Constants/constants.dart';
import 'package:maps/Shared/CustomWidgets/my_text.dart';

class CustomContainer extends StatelessWidget {
  final color;
  final text;

  const CustomContainer({Key? key, this.color, required this.text})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 55.0,
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.only(top: 18.0, left: 10),
        child: MyText(
          text: text,
          size: K_fontSizeM - 2,
          color: Colors.grey[400],
          fontWeight: FontWeight.normal,
        ),
      ),
    );
  }
}
