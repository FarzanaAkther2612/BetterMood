import 'package:supabase_flutter/supabase_flutter.dart';

class MoodDatabase {
    final moodsTable = Supabase.instance.client.from('Moods');

    //insert
    Future<void> insertMood(String moodName) async{
      await moodsTable.insert({
        'mood': moodName,
        
      });
    }

    //update
    Future<void> updateMood(dynamic moodId, String moodName) async{
      await moodsTable.update({
        'mood': moodName,
      }).eq('id', moodId);
    }

    //delete
    Future<void> deleteMood(dynamic moodId) async{
      await moodsTable.delete().eq('id', moodId);
    }

}