import 'package:better_mood/Pages/login_page.dart';
import 'package:better_mood/Theme/theme.dart';
import 'package:better_mood/auth/auth_gate.dart';
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

void main() async{
  //supabase setup
  await Supabase.initialize(
    url: "https://fiyzqcwelgcnmzdemsoo.supabase.co", 
    anonKey: "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImZpeXpxY3dlbGdjbm16ZGVtc29vIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NTY4NDI2NDgsImV4cCI6MjA3MjQxODY0OH0.27pXtZ3qkeRDiGH_SSs9W1wffdpV8OAGnp_09Cb46R8"
    );


  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.system,
      theme: BAppTheme.lightMode,
      darkTheme:  BAppTheme.darkMode,
      home: LoginPage(),
    );
  }
}
