import 'package:better_mood/Pages/login_page.dart';
import 'package:better_mood/Screens/onboardingscreens/page_1.dart';
import 'package:better_mood/Screens/onboardingscreens/page_2.dart';
import 'package:better_mood/Screens/onboardingscreens/page_3.dart';
import 'package:better_mood/auth/auth_gate.dart';
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
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.surface,
        toolbarHeight: 50,
        leadingWidth: 60,
        leading: Padding(
          padding: EdgeInsets.only(left: 16, top: 10),
          child: BackButton(
            style: ButtonStyle(
              backgroundColor: WidgetStateProperty.all(Theme.of(context).primaryColor),
              padding: WidgetStateProperty.all(EdgeInsets.all(8)),
            ),
            color: Colors.black,
            onPressed: (){
              _controller.previousPage(duration: Duration(milliseconds: 500), curve: Curves.easeIn);
            },
          ),
        )
      ),
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
            alignment: Alignment(0, 0.80),
            child: 
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                 TextButton(
                onPressed: (){
                  _controller.jumpToPage(2);
                },
                style: TextButton.styleFrom(
                  backgroundColor: Theme.of(context).primaryColor,
                  foregroundColor: Colors.white,
                ),
                child: Text('Skip'),
                ),

                SmoothPageIndicator(
                  controller: _controller, 
                  count: 3,
                  effect: WormEffect(
                    activeDotColor: Theme.of(context).primaryColor,
                    dotColor: Colors.grey,
                    dotHeight: 15,
                    dotWidth: 15,
                  ),
                  ),

                onLastPage 
                ? TextButton(
                  onPressed: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=> LoginPage()));
                  }, 
                  style: TextButton.styleFrom(
                  backgroundColor: Theme.of(context).primaryColor,
                  foregroundColor: Colors.white,
                ),
                  child: Text('Done'),
                  )
                  : TextButton(
                  onPressed: (){
                    _controller.nextPage(duration: Duration(milliseconds: 500), curve: Curves.easeIn);
                  }, 
                  style: TextButton.styleFrom(
                  backgroundColor: Theme.of(context).primaryColor,
                  foregroundColor: Colors.white,
                ),
                  child: Text('Next'),
                  ),
              ],
            ))
        ],
      ),
    );
  }
}