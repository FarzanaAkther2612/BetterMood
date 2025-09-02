
import 'package:better_mood/Pages/login_page.dart';
import 'package:better_mood/Pages/signup_page.dart';
import 'package:better_mood/Screens/on_boarding_screen.dart';
import 'package:better_mood/Theme/theme.dart';
import 'package:flutter/material.dart';

void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginPage(),
    );
  }
}
