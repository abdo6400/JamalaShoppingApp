import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class JamalaTheme {
  static TextTheme lightTextTheme = TextTheme(
    bodyText1: GoogleFonts.openSans(
      fontSize: 14.0,
      fontWeight: FontWeight.w700,
      color: Colors.black,
    ),
    headline1: GoogleFonts.openSans(
      fontSize: 32.0,
      fontWeight: FontWeight.bold,
      color: Colors.black,
    ),
    headline2: GoogleFonts.openSans(
      fontSize: 21.0,
      fontWeight: FontWeight.w700,
      color: Colors.black,
    ),
    headline3: GoogleFonts.openSans(
      fontSize: 16.0,
      fontWeight: FontWeight.w600,
      color: Colors.black,
    ),
    headline4: GoogleFonts.openSans(
      fontSize: 18.0,
      fontWeight: FontWeight.w600,
      color: Colors.black,
    ),
    headline6: GoogleFonts.openSans(
      fontSize: 20.0,
      fontWeight: FontWeight.w600,
      color: Colors.black,
    ),
  );
  static ThemeData light() {
    return ThemeData(
      brightness: Brightness.light,
      primaryColor:  Color(0xffffcc2a),
      textSelectionTheme: const TextSelectionThemeData(
        selectionColor: Colors.black,
      ),
      textTheme: lightTextTheme,
      scaffoldBackgroundColor: Colors.white,
      accentColor: Color.fromRGBO(146, 180, 236, 1),
      cardColor:  Colors.white,
      iconTheme: IconThemeData(color: Color.fromRGBO(146, 180, 236, 1)),
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          selectedItemColor: Colors.yellow,
          unselectedItemColor: Colors.white,
          backgroundColor: Color.fromRGBO(36,47 ,155 , 1),
        ),

    );
  }
  static ThemeData Dark() {
    return ThemeData(
        brightness: Brightness.light,
        primaryColor:  Color.fromRGBO(36,47 ,155 , 1),
        textSelectionTheme: const TextSelectionThemeData(
          selectionColor: Colors.black,
        ),
        textTheme: lightTextTheme,
        scaffoldBackgroundColor: Colors.white,
        accentColor: Color.fromRGBO(155, 163, 235, 1),
        cardColor:  Color.fromRGBO(219,223, 253, 1),
        iconTheme: IconThemeData(color: Color.fromRGBO(100, 111, 212, 1)),
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          selectedItemColor: Colors.yellow,
          unselectedItemColor: Colors.white,
          backgroundColor: Color.fromRGBO(36,47 ,155 , 1),
        ),
    );
  }
}

