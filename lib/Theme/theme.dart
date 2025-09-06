import 'package:better_mood/Theme/Text%20Theme/text_theme.dart';
import 'package:flutter/material.dart';


ThemeData lightMode = ThemeData(
    brightness: Brightness.light,
    scaffoldBackgroundColor: Color(0xFFEFEFEF),
    primaryColor: Color(0xFF769DA2),
    colorScheme: ColorScheme.light(
      primaryContainer: Color(0xFFD0D1BC), 
      secondaryContainer: Color(0xFFF6C870), 
      tertiaryContainer: Color(0xFFE8AFA1), 
      surface: Color(0xFFEEECD8), 
      error: Color(0xFFFA5563),
    ),
    textTheme: BTextTheme.lightTextTheme,

  );

ThemeData darkMode = ThemeData(
  brightness: Brightness.dark,
  scaffoldBackgroundColor:  const Color.fromARGB(255, 61, 59, 59),
  textTheme: BTextTheme.darkTextTheme,
  );

