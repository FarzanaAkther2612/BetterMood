import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:better_mood/Screens/on_boarding_screen.dart';
import 'package:better_mood/Theme/Text%20Theme/text_theme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      backgroundColor: Theme.of(context).colorScheme.surface,
      splash: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("Better Mood", 
          style: GoogleFonts.jaro(
            textStyle: TextStyle(
              fontSize: 42, 
              fontWeight: FontWeight.w900,
              color: Color(0xFF578A91),
              )
          )
          ),
    
          Text("Better days start with better mood", 
          style: BTextTheme.lightTextTheme.bodyMedium?.copyWith(
            fontStyle: FontStyle.italic,
            color: Color(0xEE578A91),
            letterSpacing: 1.5,
          )
          ),
        ],
      ), 
      nextScreen: OnBoardingScreen(),
      duration: 3000,
      splashTransition: SplashTransition.slideTransition,
      animationDuration: Duration(milliseconds: 400),
      pageTransitionType: PageTransitionType.rightToLeftWithFade,
      );
  }
}