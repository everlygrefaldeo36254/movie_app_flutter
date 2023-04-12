import 'package:flutter/material.dart';

final ThemeData appThemeData = ThemeData(
  colorScheme: const ColorScheme.light(
    primary: Colors.blue,
    secondary: Colors.yellow,
  ),
  fontFamily: 'Roboto',
  textTheme: const TextTheme(
    headline6: TextStyle(
      fontSize: 20.0,
      fontWeight: FontWeight.bold,
    ),
    subtitle2: TextStyle(
      fontSize: 16.0,
      fontWeight: FontWeight.normal,
    ),
    bodyText2: TextStyle(
      fontSize: 14.0,
      fontWeight: FontWeight.normal,
    ),
  ),
);
