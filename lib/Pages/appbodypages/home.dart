import 'package:better_mood/auth/auth_service.dart';
import 'package:better_mood/db/mood_database.dart';
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

  final moodDatabase = MoodDatabase();
  final authService = AuthService();

 
  
  //convert hex string to color
  Color hexToColor(String hexString) {
  final buffer = StringBuffer();
  if (hexString.length == 6 || hexString.length == 7) buffer.write('ff');
  buffer.write(hexString.replaceFirst('#', ''));
  return Color(int.parse(buffer.toString(), radix: 16));
}

  //delete mood log 
  void deleteMoodLog(dynamic id) async{
    await moodDatabase.deleteMood(id);
    
  }

  //update mood log 
  void updateMoodLog(dynamic id) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => EmotionsPage(
          onMoodLogged: (String mood, String moodHexColor, int moodValue) async{
            
              await moodDatabase.updateMood(id, mood, moodHexColor, moodValue);             
          },
        ),
      ),
    );
  }

  void _addMoodLog() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => EmotionsPage(
          onMoodLogged: (String mood, String moodHexColor, int moodValue) async{
            
            DateTime now = DateTime.now();
            String date = "${now.day} ${_getMonthName(now.month)}, ${now.year}";
            
              await moodDatabase.insertMood(mood, date, moodHexColor, moodValue);
            
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

    final uid = authService.getUserUID();

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
      
       body: StreamBuilder(
        stream: moodDatabase.moodsTable.stream(primaryKey: ['id']), 
        builder: (context, snapshot){
          if(!snapshot.hasData){
            return Center(child: Text('Loading...'));
          }

          final moods = snapshot.data!;

          return ListView.builder(
            itemCount: moods.length,
            itemBuilder: (context, index){
              final mood = moods[index];
              final id = mood['id'];
              final moodName = mood['mood_name'];
              final date = mood['date'];
              final moodHexColor = mood['mood_colour'] ?? '#D3D3D3';
              return MoodLogTile(
              date: date,
              mood: moodName,
              moodColor: hexToColor(moodHexColor),
              onDelete: (context) => deleteMoodLog(id),
              onUpdate: (context) => updateMoodLog(id),
            );
            }
       );

        },
        )
      
    );
  }
}