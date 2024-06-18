import 'package:flutter/material.dart';

const textColor = Color(0xFFfbf0e9);
const backgroundColor = Color(0xFF0d0602);
const primaryColor = Color.fromARGB(255, 156, 59, 18);
const primaryFgColor = Color(0xFFfbf0e9);
const secondaryColor = Color.fromARGB(255, 69, 128, 55);
const secondaryFgColor = Color(0xFFfbf0e9);
const accentColor = Color(0xFF35e99e);
const accentFgColor = Color(0xFF0d0602);

const colorScheme = ColorScheme(
  brightness: Brightness.dark,
  primary: primaryColor,
  onPrimary: primaryFgColor,
  secondary: secondaryColor,
  onSecondary: secondaryFgColor,
  tertiary: accentColor,
  onTertiary: accentFgColor,
  surface: backgroundColor,
  onSurface: textColor,
  error: Brightness.dark == Brightness.light
      ? Color(0xffB3261E)
      : Color(0xffF2B8B5),
  onError: Brightness.dark == Brightness.light
      ? Color(0xffFFFFFF)
      : Color(0xff601410),
);
