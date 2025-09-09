import 'package:flutter/material.dart';
import 'package:flutter_heatmap_calendar/flutter_heatmap_calendar.dart';

class MyHeatmap extends StatelessWidget {

  final Map<DateTime, int> datasets;

  const MyHeatmap({super.key, required this.datasets});
  

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned.fill(
          child: Image.asset(
            'image/cbg.jpg', 
            fit: BoxFit.cover,
            errorBuilder: (context, error, stackTrace) => Container( color: Theme.of(context).colorScheme.surface,),
          ),
        ),
        Align(
          alignment: Alignment(0, -0.2),
          child:HeatMap(
            datasets: datasets,
            colorMode: ColorMode.color,
            startDate: DateTime(2025, 9, 1),
            endDate: DateTime(2025, 9, 30),
            size: 40,
            borderRadius: 20.0,
            showColorTip: false,
            showText: true,
            scrollable: true,
            defaultColor: Color(0xFFEEECD8),
            colorsets: {
              0: Color(0xFFF6C870),
              1: Color(0xFFBAD491),
              2: Color(0xFFA5BBBD),
              3: Color(0xFFE8AFA1),
              4: Color(0xFFFA5563),
            },
            onClick: (value) {},
          )
        ),
      ],
    );
  }
}