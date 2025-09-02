import 'package:better_mood/Pages/homepage.dart';
import 'package:better_mood/Screens/onboardingscreens/page_1.dart';
import 'package:better_mood/Screens/onboardingscreens/page_2.dart';
import 'package:better_mood/Screens/onboardingscreens/page_3.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {

  PageController _controller = PageController();

  bool onLastPage = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            controller: _controller,
            onPageChanged: (index){
              setState(() {
                onLastPage = (index == 2);
              });
            },
            children: [
              IntroPage1(),
              IntroPage2(),
              IntroPage3()
            ],
          ),

          Container(
            alignment: Alignment(0, 0.85),
            child: 
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                 TextButton(
                onPressed: (){
                  _controller.jumpToPage(2);
                },
                child: Text('Skip'),
                ),

                SmoothPageIndicator(controller: _controller, count: 3),

                onLastPage 
                ? TextButton(
                  onPressed: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=> Homepage()));
                  }, 
                  child: Text('Done'),
                  )
                  : TextButton(
                  onPressed: (){
                    _controller.nextPage(duration: Duration(milliseconds: 500), curve: Curves.easeIn);
                  }, 
                  child: Text('Next'),
                  ),
              ],
            ))
        ],
      ),
    );
  }
}