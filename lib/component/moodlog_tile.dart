import 'package:flutter/material.dart';
import 'package:better_mood/Theme/Text%20Theme/text_theme.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';


class MoodLogTile extends StatelessWidget {

  final String date;
  final String mood;
  final Function(BuildContext) onDelete;

  const MoodLogTile({super.key, required this.date, required this.mood, required this.onDelete});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsGeometry.fromLTRB(16, 16, 16, 0),
      child: Slidable(
      endActionPane: ActionPane(
        motion: const DrawerMotion(),
        children: [
          SlidableAction(
            onPressed: onDelete,
            icon: Icons.delete,
            backgroundColor: Colors.red,
            foregroundColor: Colors.white,
            borderRadius: BorderRadius.circular(16),
          ),
        ],
      ),
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.secondaryContainer,
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