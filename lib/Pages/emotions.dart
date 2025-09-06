
import 'package:flutter/material.dart';
import 'package:better_mood/Theme/Text Theme/text_theme.dart';


class EmotionsPage extends StatefulWidget {
  final Function(String) onMoodLogged;
  const EmotionsPage({super.key, required this.onMoodLogged});

  @override
  State<EmotionsPage> createState() => _EmotionsPageState();
}

class _EmotionsPageState extends State<EmotionsPage> {

  double _value = 0;

  String getMoodName(int value) {
    switch (value) {
      case 0:
        return 'Very Happy';
      case 1:
        return 'Happy';
      case 2:
        return 'Neutral';
      case 3:
        return 'Sad';
      case 4:
        return 'Angry';
      default:
        return 'Unknown';
    }
  }

  void _logMood() {
    String mood = getMoodName(_value.toInt());
    
    // Show confirmation
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: Theme.of(context).primaryColor,
        content: Text('Mood logged: $mood', style: BTextTheme.lightTextTheme.labelLarge,),
        duration: Duration(seconds: 2),
      ),
    );
    
    // Call the callback with mood name
    widget.onMoodLogged(mood);
    
    // Navigate back
    Navigator.pop(context);
  }

  final List<Widget> _emotions = [
    Center(
      child: Column(
        children: [
          Container(
            width: 200,
            height: 200,
            child: Image.asset(
              'image/vhappy.png',
              fit: BoxFit.contain,
            ),
          ),
              
          SizedBox(height: 100),
          Text('Very happy', style: BTextTheme.lightTextTheme.headlineMedium),
        ],
      ),
    ),

    Center(
      child: Column(
        children: [
          Container(
            width: 200,
            height: 200,
            child: Image.asset(
              'image/happy.png',
              fit: BoxFit.contain,
            ),
          ),
              
          SizedBox(height: 100),
          Text('Happy', style: BTextTheme.lightTextTheme.headlineMedium),
        ],
      ),

    ),
    
    Center(
      child: Column(
        children: [
          Container(
            width: 200,
            height: 200,
            child: Image.asset(
              'image/neutral.png',
              fit: BoxFit.contain,
            ),
          ),
              
          SizedBox(height: 100),
          Text('Neutral', style: BTextTheme.lightTextTheme.headlineMedium),
        ],
      ),
    ),
    
    Center(
      child: Column(
        children: [
          Container(
            width: 200,
            height: 200,
            child: Image.asset(
              'image/sad.png',
              fit: BoxFit.contain,
            ),
          ),
              
          SizedBox(height: 100),
          Text('Sad', style: BTextTheme.lightTextTheme.headlineMedium),
        ],
      ),
    ),

    Center(
      child: Column(
        children: [
          Container(
            width: 200,
            height: 200,
            child: Image.asset(
              'image/angry.png',
              fit: BoxFit.contain,
            ),
          ),
              
          SizedBox(height: 100),
          Text('Angry', style: BTextTheme.lightTextTheme.headlineMedium),
        ],
      ),

    ),

  ];

  @override
  Widget build(BuildContext context) {
    // Define background colors for each emotion
    final List<Color> backgroundColors = [
      Theme.of(context).colorScheme.secondaryContainer, // very happy 
      Color(0xFFBAD491), // happy 
      Color(0xFFA5BBBD), // neutral 
      Theme.of(context).colorScheme.tertiaryContainer, // sad 
      Color(0xFFFA5563), // angry 
    ];
    
    return Scaffold(
      backgroundColor: backgroundColors[_value.toInt()],
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        toolbarHeight: 50,
        leadingWidth: 60,
        leading: Padding(
          padding: EdgeInsets.only(left: 16, top: 10),
          child: BackButton(
            style: ButtonStyle(
              backgroundColor: WidgetStateProperty.all(Colors.white60),
              padding: WidgetStateProperty.all(EdgeInsets.all(8)),
            ),
            color: Colors.black,
            onPressed: (){
              Navigator.pop(context);
            },
          ),
        )
      ),
      body: Stack(
        children: [
          
          
          Column(
            children: [
              Text("What's your mood today?",
              style: BTextTheme.lightTextTheme.titleLarge,
              ),

              SizedBox(height: 200),
              _emotions[_value.toInt()],
              
              SizedBox(height: 80),
              Slider(
                activeColor: Theme.of(context).primaryColor,
                inactiveColor: const Color.fromARGB(255, 213, 226, 233),
                value: _value, 
                min: 0,
                max: 4,
                divisions: 4,
                onChanged: (value){
                  setState(() {
                    _value = value;
                  });
                },
                ),

                SizedBox(height: 20),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadiusGeometry.circular(30)),
                  ),
                  onPressed: _logMood,
                  child: Text("Log mood",
                  style: BTextTheme.lightTextTheme.labelLarge?.copyWith(
                    color: Theme.of(context).primaryColor,
                  ),
                  ),
                ),
            ],
          )
        ]
      ),
    );
  }
}