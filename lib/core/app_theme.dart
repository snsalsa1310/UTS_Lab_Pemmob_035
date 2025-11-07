import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {

  static final ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    primarySwatch: Colors.blue,
    colorScheme: const ColorScheme.light(
      primary: Colors.blue,
      secondary: Colors.blueAccent,
      background: Color(0xFFF5F5F5),
      surface: Colors.white,
    ),

    textTheme: GoogleFonts.poppinsTextTheme(
      ThemeData.light().textTheme,
    ),

    scaffoldBackgroundColor: const Color(0xFFF5F5F5),
  );


  static final ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    primarySwatch: Colors.blue,
    colorScheme: const ColorScheme.dark(
      primary: Colors.blue,
      secondary: Colors.blueAccent,
      background: Color(0xFF121212),
      surface: Color(0xFF1E1E1E),
    ),

    textTheme: GoogleFonts.poppinsTextTheme(
      ThemeData.dark().textTheme,
    ),

    scaffoldBackgroundColor: const Color(0xFF121212),
  );
}