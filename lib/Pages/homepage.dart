import 'package:better_mood/Pages/appbodypages/calender.dart';
import 'package:better_mood/Pages/appbodypages/home.dart';
import 'package:better_mood/Pages/appbodypages/profile.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {

  int _selectedIndex = 0;

  void _navigateBottomBar(int index){
    setState(() {
      _selectedIndex = index;
    });
  }

  final List<Widget> _pages = [
    UserHomePage(),
    UserCalenderPage(),
    UserProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],

      bottomNavigationBar: BottomNavigationBar(
        elevation: 5,
        backgroundColor: Colors.white,
        selectedItemColor: Theme.of(context).primaryColor,
        unselectedItemColor: Colors.black,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.emoji_emotions), label: 'Emotions'),
          BottomNavigationBarItem(icon: Icon(FontAwesomeIcons.calendar), label: 'Calendar'),
          BottomNavigationBarItem(icon: Icon(FontAwesomeIcons.user), label: 'Profile'),
        ],
        currentIndex: _selectedIndex,
        onTap: _navigateBottomBar,
      ),
        
        
      
      );
  }
}