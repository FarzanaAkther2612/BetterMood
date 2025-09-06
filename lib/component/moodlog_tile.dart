import 'package:flutter/material.dart';
import 'package:better_mood/Theme/Text%20Theme/text_theme.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';


class MoodLogTile extends StatelessWidget {

  final String date;
  final String mood;
  final Color moodColor;
  final Function(BuildContext)? onDelete;
  final Function(BuildContext)? onUpdate;

  const MoodLogTile({super.key, required this.date, required this.mood, required this.moodColor, required this.onDelete, required this.onUpdate});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsGeometry.fromLTRB(16, 16, 16, 0),
      child: Slidable(
      endActionPane: ActionPane(
        motion: const DrawerMotion(),
        children: [
          //update slidable
          SlidableAction(
            onPressed: onUpdate,
            icon: Icons.edit,
            backgroundColor: Theme.of(context).colorScheme.primaryContainer,
            foregroundColor: Colors.white,
            borderRadius: BorderRadius.circular(16),
          ),

          //delete slidable
          SlidableAction(
            onPressed: onDelete,
            icon: Icons.delete,
            backgroundColor: Theme.of(context).colorScheme.error,
            foregroundColor: Colors.white,
            borderRadius: BorderRadius.circular(16),
          ),
        ],
      ),
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: moodColor,
          borderRadius: BorderRadius.circular(16),
        ),
                 child: Column(
           mainAxisSize: MainAxisSize.min,
           crossAxisAlignment: CrossAxisAlignment.start,
           children: [
            Text(date, 
            style: BTextTheme.lightTextTheme.titleLarge, 
            ),
            SizedBox(height: 8,),


            Row(
              children: [
                Icon(FontAwesomeIcons.hashtag, size: 16),
                SizedBox(width: 10,),
                Text(mood,
                style: BTextTheme.lightTextTheme.bodyLarge,
            ),
              ],
            )
          ],
        ),
      ),
      )
      );
  }
}