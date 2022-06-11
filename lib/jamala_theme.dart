import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class JamalaTheme {
  static TextTheme lightTextTheme = TextTheme(
    bodyText1: GoogleFonts.openSans(
      fontSize: 14.0,
      fontWeight: FontWeight.w700,
      color: Colors.white,
    ),
    headline1: GoogleFonts.openSans(
      fontSize: 24.0,
      fontWeight: FontWeight.bold,
      color: Colors.white,
    ),
    headline2: GoogleFonts.openSans(
      fontSize: 21.0,
      fontWeight: FontWeight.w700,
      color: Colors.white,
    ),
    headline3: GoogleFonts.openSans(
      fontSize: 18.0,
      fontWeight: FontWeight.w600,
      color: Colors.white,
    ),
    headline4: GoogleFonts.openSans(
      fontSize: 16.0,
      fontWeight: FontWeight.w400,
      color: Colors.white,
    ),
    headline6: GoogleFonts.openSans(
      fontSize: 14.0,
      fontWeight: FontWeight.w300,
      color: Colors.white,
    )
  );
  static ThemeData light() {
    return ThemeData(
      brightness: Brightness.light,
      backgroundColor: Colors.grey.shade500,
      primaryColor:  Color.fromRGBO(36,47 ,155 , 1),
      textSelectionTheme: const TextSelectionThemeData(
        selectionColor: Colors.black,
      ),
      textTheme: lightTextTheme,
      appBarTheme: AppBarTheme(
         backgroundColor:  Colors.white,
          //titleTextStyle: lightTextTheme.headline3,
        centerTitle: true,
        elevation: 2.0
      ),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        selectedItemColor: Colors.yellow,
        unselectedItemColor: Colors.white,
        unselectedIconTheme: IconThemeData(
          size: 15
        ),
        selectedIconTheme: IconThemeData(
          size: 20
        ),
        backgroundColor: Color.fromRGBO(36,47 ,155 , 1),
      ),
      // drawerTheme: DrawerThemeData(
      //   backgroundColor: Color.fromRGBO(155,163 ,235 , 1)
      // ),
      colorScheme: ColorScheme.fromSwatch().copyWith(secondary: Color.fromRGBO(100, 111, 212, 1),primary:  Color.fromRGBO(219, 223, 253, 1)),
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

