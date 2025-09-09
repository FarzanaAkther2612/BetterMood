import 'package:flutter/material.dart';
import 'package:better_mood/Theme/Text%20Theme/text_theme.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:lottie/lottie.dart';


class IntroPage3 extends StatelessWidget {
  const IntroPage3({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).colorScheme.surface,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        
        children: [
          Text("Reflect & Understand", style: BTextTheme.lightTextTheme.headlineMedium),
          

          SizedBox(height: 150),

          Lottie.asset('assets/bar.json',
          errorBuilder: (context, error, stackTrace) => 
              Icon(FontAwesomeIcons.chartArea, color: Colors.black54, size: 100,)
              ),

          SizedBox(height: 150),

          Text("See your mood history", style: BTextTheme.lightTextTheme.titleLarge),

          SizedBox(height: 10),

          Padding(
            padding: EdgeInsets.only(left: 30, right: 30),
            child: Text("View past moods and discover simple patterns that help you understand yourself better",
            style: BTextTheme.lightTextTheme.bodyLarge,
            textAlign: TextAlign.center,
            ),
            ),

          SizedBox(height: 200),
        ],
      ),
    );
  }
}