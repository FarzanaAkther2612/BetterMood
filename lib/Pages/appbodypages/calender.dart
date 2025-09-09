import 'package:better_mood/db/mood_database.dart';
import 'package:flutter/material.dart';
import 'package:better_mood/auth/auth_service.dart';
import 'package:better_mood/component/heatmap.dart';

class UserCalenderPage extends StatefulWidget {
  const UserCalenderPage({super.key});

  @override
  State<UserCalenderPage> createState() => _UserCalenderPageState();
}

class _UserCalenderPageState extends State<UserCalenderPage> {

  final moodDatabase = MoodDatabase();
  final authService = AuthService();


  @override
  Widget build(BuildContext context) {

    final uid = authService.getUserUID();
    
    return StreamBuilder(
      stream: moodDatabase.moodsTable.stream(primaryKey: ['id']).eq('uid', uid!), 
        builder: (context, snapshot){
          if(!snapshot.hasData){
            return Center(child: Text('Loading...'));
          }

          final moods = snapshot.data!;

          Map<DateTime, int> heatmapDatasets = {};

          for (int i = 0; i < moods.length; i++) {
          var mood = moods[i];
          final createdAt = DateTime.parse(mood['created_at']);
          final day = DateTime(createdAt.year, createdAt.month, createdAt.day);
          final moodValue = mood['mood_value'];
          
          heatmapDatasets[day] = moodValue;
        }
          

          return MyHeatmap(
            datasets: heatmapDatasets);
        },
      );
  }
}