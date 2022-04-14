import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:maps/Constants/constants.dart';

class MyTextField extends StatelessWidget {
  final hintText;
  final hintTextColor;
  final isEmailField;
  final isPasswordField;
  final labelText;
  final labelTextColor;
  final obscureText;
  final prifixIcon;
  final borderColor;
  final backColor;
  final maxlength;
  final borderRadius;
  final validatorText;
  ValueChanged<String>? onChange;
  ValueChanged<String>? onSubmit;
  var onTap;
  final TextEditingController textController;

  MyTextField({
    Key? key,
    this.hintText,
    this.hintTextColor,
    this.labelText,
    this.labelTextColor,
    this.maxlength,
    this.isEmailField = false, //default,
    this.isPasswordField = false, //default,
    this.obscureText,
    this.backColor,
    required this.borderColor,
    required this.validatorText,
    this.prifixIcon,
    required this.textController,
    this.borderRadius,
    this.onTap,
    this.onChange,
    this.onSubmit,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(borderRadius ?? K_radius),
          color: backColor),
      child: TextFormField(
        controller: textController,
        onTap: onTap,
        obscureText: obscureText ?? false,
        maxLength: maxlength,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return validatorText;
          }
          return null;
        },
        onChanged: onChange,
        onFieldSubmitted: onSubmit,
        style: GoogleFonts.poppins(
          color: labelTextColor ?? K_blackColor,
          fontSize: 13.0,
        ),
        decoration: InputDecoration(
          prefixIcon: prifixIcon != null
              ? Icon(
                  prifixIcon,
                  color: K_blackColor,
                )
              : null,
          labelText: labelText,
          labelStyle: GoogleFonts.poppins(
            color: labelTextColor ?? K_blackColor,
            fontSize: 13.0,
          ),
          hintText: hintText,
          hintStyle: GoogleFonts.poppins(
            color: hintTextColor ?? Colors.grey[500],
            fontSize: 13.0,
          ),
          errorStyle: GoogleFonts.poppins(
            fontSize: 13.0,
          ),
          focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(borderRadius ?? K_radius),
              borderSide: BorderSide(
                color: borderColor,
              )),
          errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(borderRadius ?? K_radius),
              borderSide: BorderSide(
                color: borderColor,
              )),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(borderRadius ?? K_radius),
              borderSide: BorderSide(
                color: borderColor,
              )),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(borderRadius ?? K_radius),
              borderSide: BorderSide(
                color: borderColor,
              )),
        ),
      ),
    );
  }
}
