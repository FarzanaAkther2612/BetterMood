import 'package:better_mood/auth/auth_service.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class MoodDatabase {
    final moodsTable = Supabase.instance.client.from('Moods');
    final authService = AuthService();

    //insert
    Future<void> insertMood(String moodName, String date, String moodColor, int moodValue) async{
      final uid = authService.getUserUID();

      await moodsTable.insert({
        'mood_name': moodName,
        'mood_colour': moodColor,
        'date': date,
        'uid': uid,
        'mood_value': moodValue,
      });
    }

    //update
    Future<void> updateMood(dynamic moodId, String moodName, String moodColor, int moodValue) async{
      await moodsTable.update({
        'mood_name': moodName,  
        'mood_colour': moodColor,
        'mood_value': moodValue,
      }).eq('id', moodId);
    }

    //delete
    Future<void> deleteMood(dynamic moodId) async{
      await moodsTable.delete().eq('id', moodId);
    }

}