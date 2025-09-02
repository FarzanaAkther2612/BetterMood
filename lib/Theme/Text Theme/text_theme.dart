
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class BTextTheme{
  BTextTheme._();

  static TextTheme lightTextTheme = TextTheme(
    
    headlineLarge: GoogleFonts.albertSans(
      fontSize: 32.0,
      fontWeight: FontWeight.w800,
      color: Colors.black,
    ),
    headlineMedium: GoogleFonts.albertSans(
      fontSize: 20.0,
      fontWeight: FontWeight.w500,
      color: Colors.black,
    ),
    headlineSmall: GoogleFonts.albertSans(
      fontSize: 18.0,
      fontWeight: FontWeight.w500,
      color: Colors.black,
    ),
    
    titleLarge: GoogleFonts.albertSans(
      fontSize: 16.0,
      fontWeight: FontWeight.w500,
      color: Colors.black,
    ),
    titleMedium: GoogleFonts.albertSans(
      fontSize: 14.0,
      fontWeight: FontWeight.w500,
      color: Colors.black,
    ),
    titleSmall: GoogleFonts.albertSans(
      fontSize: 12.0,
      fontWeight: FontWeight.w500,
      color: Colors.black,
    ),
    
    bodyLarge: GoogleFonts.hind(
      fontSize: 16.0,
      fontWeight: FontWeight.w400,
      color: Colors.black,
    ),
    bodyMedium: GoogleFonts.hind(
      fontSize: 14.0,
      fontWeight: FontWeight.w400,
      color: Colors.black,
    ),
    bodySmall: GoogleFonts.hind(
      fontSize: 12.0,
      fontWeight: FontWeight.w400,
      color: Colors.black,
    ),
    
    labelLarge: GoogleFonts.albertSans(
      fontSize: 14.0,
      fontWeight: FontWeight.w500,
      color: Colors.black,
    ),
    labelMedium: GoogleFonts.albertSans(
      fontSize: 12.0,
      fontWeight: FontWeight.w500,
      color: Colors.black,
    ),
    labelSmall: GoogleFonts.albertSans(
      fontSize: 10.0,
      fontWeight: FontWeight.w500,
      color: Colors.black,
    ),
  );

  static TextTheme darkTextTheme = TextTheme(

    headlineLarge: GoogleFonts.albertSans(
      fontSize: 32.0,
      fontWeight: FontWeight.w800,
      color: Colors.white,
    ),
    headlineMedium: GoogleFonts.albertSans(
      fontSize: 20.0,
      fontWeight: FontWeight.w500,
      color: Colors.white,
    ),
    headlineSmall: GoogleFonts.albertSans(
      fontSize: 18.0,
      fontWeight: FontWeight.w500,
      color: Colors.white,
    ),
    
  
    titleLarge: GoogleFonts.albertSans(
      fontSize: 16.0,
      fontWeight: FontWeight.w500,
      color: Colors.white,
    ),
    titleMedium: GoogleFonts.albertSans(
      fontSize: 14.0,
      fontWeight: FontWeight.w500,
      color: Colors.white,
    ),
    titleSmall: GoogleFonts.albertSans(
      fontSize: 12.0,
      fontWeight: FontWeight.w500,
      color: Colors.white,
    ),
    
    bodyLarge: GoogleFonts.hind(
      fontSize: 16.0,
      fontWeight: FontWeight.w400,
      color: Colors.white,
    ),
    bodyMedium: GoogleFonts.hind(
      fontSize: 14.0,
      fontWeight: FontWeight.w400,
      color: Colors.white,
    ),
    bodySmall: GoogleFonts.hind(
      fontSize: 12.0,
      fontWeight: FontWeight.w400,
      color: Colors.white,
    ),
    
    // Label styles (for buttons, etc.)
    labelLarge: GoogleFonts.albertSans(
      fontSize: 14.0,
      fontWeight: FontWeight.w500,
      color: Colors.white,
    ),
    labelMedium: GoogleFonts.albertSans(
      fontSize: 12.0,
      fontWeight: FontWeight.w500,
      color: Colors.white,
    ),
    labelSmall: GoogleFonts.albertSans(
      fontSize: 10.0,
      fontWeight: FontWeight.w500,
      color: Colors.white,
    ),
  );
}
