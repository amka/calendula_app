import 'package:flutter/material.dart';

const textColor = Color(0xFF170b04);
const backgroundColor = Color(0xFFfdfdfd);
const primaryColor = Color(0xFFCE6133);
const primaryFgColor = Color(0xFF170b04);
const secondaryColor = Color(0xFF79AD6D);
const secondaryFgColor = Color(0xFF170b04);
const accentColor = Color(0xFF17ca7f);
const accentFgColor = Color(0xFF170b04);

const colorScheme = ColorScheme(
  brightness: Brightness.light,
  primary: primaryColor,
  onPrimary: primaryFgColor,
  secondary: secondaryColor,
  onSecondary: secondaryFgColor,
  tertiary: accentColor,
  onTertiary: accentFgColor,
  surface: backgroundColor,
  onSurface: textColor,
  error: Brightness.light == Brightness.light
      ? Color(0xffB3261E)
      : Color(0xffF2B8B5),
  onError: Brightness.light == Brightness.light
      ? Color(0xffFFFFFF)
      : Color(0xff601410),
);
