import 'package:flutter/material.dart';
import 'package:better_mood/Theme/Text Theme/text_theme.dart';
import 'package:better_mood/component/moodlog_tile.dart';
import 'package:better_mood/Pages/emotions.dart';

class UserHomePage extends StatefulWidget {
  const UserHomePage({super.key});

  @override
  State<UserHomePage> createState() => _UserHomePageState();
}

class _UserHomePageState extends State<UserHomePage> {

  List moodLogs = [
    ["4 September, 2025", "Happy Mood"],
    ["5 September, 2025", "Sad Mood"],
  ];

  void deleteMoodLog(int index) {
    setState(() {
      moodLogs.removeAt(index);
    });
  }

  void _addMoodLog() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => EmotionsPage(
          onMoodLogged: (String mood) {
            // Get current date
            DateTime now = DateTime.now();
            String date = "${now.day} ${_getMonthName(now.month)}, ${now.year}";
            
            setState(() {
              moodLogs.insert(0, [date, mood]);
            });
          },
        ),
      ),
    );
  }

  String _getMonthName(int month) {
    const months = [
      'January', 'February', 'March', 'April', 'May', 'June',
      'July', 'August', 'September', 'October', 'November', 'December'
    ];
    return months[month - 1];
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text("Mood Logs", style: BTextTheme.lightTextTheme.headlineMedium),
      ),
      
      floatingActionButton: FloatingActionButton(
        onPressed: _addMoodLog,
        backgroundColor: Colors.white,
        foregroundColor: Theme.of(context).primaryColor,
        shape: RoundedRectangleBorder(borderRadius: BorderRadiusGeometry.circular(30)),
        child: Icon(Icons.add),
      ),
      
      body: ListView.builder(
        itemCount: moodLogs.length,
        itemBuilder: (context, index) => MoodLogTile(
          date: moodLogs[index][0],
          mood: moodLogs[index][1],
          onDelete: (context) => deleteMoodLog(index),
        ),
      ),
      
    );
  }
}