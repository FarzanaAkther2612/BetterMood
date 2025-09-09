import 'package:better_mood/Theme/Text%20Theme/text_theme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';


class IntroPage1 extends StatelessWidget {
  const IntroPage1({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).colorScheme.surface,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        
        children: [
          Text("Welcome to,", style: BTextTheme.lightTextTheme.headlineMedium),
          Text("Better Mood", 
          style: GoogleFonts.jaro(
            textStyle: TextStyle(
              fontSize: 42, 
              fontWeight: FontWeight.w900,
              color: Color(0xFF578A91),
              ),
          ),
          ),

          SizedBox(height: 30),

          Lottie.asset('assets/smiling.json',
          errorBuilder: (context, error, stackTrace) => 
              Icon(Icons.emoji_emotions, color: Colors.orangeAccent, size: 100,)
              ),


          Text("Better days start here", style: BTextTheme.lightTextTheme.titleLarge),

          SizedBox(height: 10),

          Padding(
            padding: EdgeInsets.only(left: 30, right: 30),
            child: Text("Track your feelings daily and take small steps toward a better, healthier you",
            style: BTextTheme.lightTextTheme.bodyLarge,
            textAlign: TextAlign.center,
            ),
            ),

          SizedBox(height: 170),
        ],
      ),
    );
  }
}