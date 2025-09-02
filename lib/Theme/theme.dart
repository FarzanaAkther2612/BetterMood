import 'package:better_mood/Theme/Text%20Theme/text_theme.dart';
import 'package:flutter/material.dart';


class BAppTheme{
  BAppTheme._();

  static ThemeData lightMode = ThemeData(
    brightness: Brightness.light,
    scaffoldBackgroundColor: Color(0xFFEFEFEF),
    primaryColor: Color(0xFF769DA2),
    textTheme: BTextTheme.lightTextTheme,

  );

  static ThemeData darkMode = ThemeData(
  brightness: Brightness.dark,
  scaffoldBackgroundColor:  const Color.fromARGB(255, 61, 59, 59),
  textTheme: BTextTheme.darkTextTheme,
  );

}