
import 'package:better_mood/Pages/login_page.dart';
import 'package:better_mood/auth/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:better_mood/Theme/Text%20Theme/text_theme.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class UserProfilePage extends StatefulWidget {
  const UserProfilePage({super.key});

  @override
  State<UserProfilePage> createState() => _UserProfilePageState();
}

class _UserProfilePageState extends State<UserProfilePage> {


  final authService = AuthService();

  void signOut() async{
    await authService.signOut();
    if(mounted){
      Navigator.push(context, MaterialPageRoute(builder: (context)=> LoginPage()));
    }
  }

  @override
  Widget build(BuildContext context) {


    final userEmail = authService.getUserEmail();

    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: Column(
        mainAxisSize: MainAxisSize.min,
        children: [

         //title
          Row(
            children: [
              Padding(
            padding: EdgeInsets.fromLTRB(20, 60, 20, 5),
            child: Text("Profile", style: BTextTheme.lightTextTheme.headlineMedium),
            ),
            SizedBox(width: 200),
            Padding(
              padding: EdgeInsets.fromLTRB(20, 60, 20, 5),
              child: Icon(Icons.account_circle, color: Colors.black45, size: 35,),
            ),
            ],
          ),

          SizedBox(height: 50),

          Expanded(
            child: 
            Container(
              width: double.infinity,
              height: 100,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(60),
                ),
            ),

            //profile info
            child: Column(
              children: [
                SizedBox(height: 50),

                 Row(
                  
                  children: [
                    Padding(
                    padding: EdgeInsets.only(left: 30, top: 30),
                    child: Align(
                    alignment: Alignment.centerLeft,
                    child: CircleAvatar(
                      backgroundColor: Colors.transparent,
                      radius: 40,
                      backgroundImage: AssetImage('image/pfp.png'),
                    ),
                    ),
                    ),
                    
                    Padding(
                      padding: EdgeInsets.only(left: 10, top: 30),
                      child: Text(userEmail.toString(), style: BTextTheme.lightTextTheme.titleMedium?.copyWith(fontStyle: FontStyle.italic)),
                    ),
                  ],
                 ),
                

                  SizedBox(height: 30),

                  Padding(
                    padding: EdgeInsets.all(16),
                    child: Card(
                      color: Theme.of(context).scaffoldBackgroundColor,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Padding(
                          padding: EdgeInsets.all(16),
                          child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Get help", style: BTextTheme.lightTextTheme.bodyLarge),
                            Icon(FontAwesomeIcons.chevronRight, size: 16,),
                          ],
                        ),
                        ),

                        Divider(color: Colors.black45, indent: 15, endIndent: 15,),

                        Padding(
                          padding: EdgeInsets.all(16),
                          child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Privacy Policy", style: BTextTheme.lightTextTheme.bodyLarge),
                            Icon(FontAwesomeIcons.chevronRight, size: 16,),
                          ],
                        ),
                        ),

                        Divider(color: Colors.black45, indent: 15, endIndent: 15,),

                        Padding(
                          padding: EdgeInsets.all(16),
                          child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Terms & Conditions", style: BTextTheme.lightTextTheme.bodyLarge),
                            Icon(FontAwesomeIcons.chevronRight, size: 16,),
                          ],
                        ),
                        ),
                      ],
                    ),
                  ),
                  ),

                  SizedBox(height: 50),
                  //sign out button
                  Padding(
                          padding: const EdgeInsets.fromLTRB(16.0, 30.0, 16.0, 5.0),
                          child: TextButton(
                            onPressed: signOut, 
                            style: TextButton.styleFrom(
                              fixedSize: Size(290, 50),
                              shape: RoundedRectangleBorder(borderRadius: BorderRadiusGeometry.circular(30)),
                              backgroundColor: Color(0xFFE0C995),
                              foregroundColor: Color(0xFFF7F2EF)
                            ),
                            child: Text('Sign out',
                                        style: TextStyle(
                                          
                                          fontSize: 21.0,
                                          fontWeight: FontWeight.w500,
                                          letterSpacing: 1.5,
                                          wordSpacing: 2.0
                                        ),
                            )
                            ),
                        ),
              ],
            )
            ),
            ),

        ],
      ),
    );
  }
}