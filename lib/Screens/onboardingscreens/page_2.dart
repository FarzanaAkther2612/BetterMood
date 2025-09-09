import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:better_mood/Theme/Text%20Theme/text_theme.dart';
import 'package:lottie/lottie.dart';


class IntroPage2 extends StatelessWidget {
  const IntroPage2({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).colorScheme.surface,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        
        children: [
          Text("Track your feelings", style: BTextTheme.lightTextTheme.headlineMedium),

          SizedBox(height: 110),

          Lottie.asset('assets/hu.json',
          errorBuilder: (context, error, stackTrace) => 
              Icon(FontAwesomeIcons.solidCalendarCheck, color: Colors.blueGrey, size: 100,)
          ),

          SizedBox(height: 100),

          Text("Log your mood in seconds", style: BTextTheme.lightTextTheme.titleLarge),

          SizedBox(height: 10),

          Padding(
            padding: EdgeInsets.only(left: 30, right: 30),
            child: Text("Pick an emotion that matches your mood and add a short note if you like",
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