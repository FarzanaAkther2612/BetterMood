
import 'package:flutter/material.dart';

class UserCalenderPage extends StatefulWidget {
  const UserCalenderPage({super.key});

  @override
  State<UserCalenderPage> createState() => _UserCalenderPageState();
}

class _UserCalenderPageState extends State<UserCalenderPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('Calender Page'),

      ),
    );
  }
}