// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyTheme {
  static ThemeData lightTheme(BuildContext context) => ThemeData(
      primaryTextTheme: Typography.blackRedmond,
      primarySwatch: Colors.orange,
      fontFamily: GoogleFonts.aBeeZee().fontFamily,
//primaryTextTheme: GoogleFonts.aBeeZeeTextTheme(),
      appBarTheme: AppBarTheme(
          color: Colors.white,
          elevation: 0.0,
          iconTheme: IconThemeData(color: Colors.black)),
      textTheme: Theme.of(context).textTheme);

  static ThemeData darkTheme(BuildContext context) => ThemeData(
      primaryTextTheme: Typography.blackRedmond,
      listTileTheme:
          ListTileThemeData(textColor: Colors.black, iconColor: Colors.black),
      drawerTheme: DrawerThemeData(
        backgroundColor: Colors.black,
      ),
      primarySwatch: Colors.orange,
      brightness: Brightness.dark,
      fontFamily: GoogleFonts.aBeeZee().fontFamily,
      //primaryTextTheme: TextTheme(color: Colors.white),
      appBarTheme: AppBarTheme(
          color: Colors.black,
          elevation: 0.0,
          iconTheme: IconThemeData(color: Colors.white)),
      textTheme: Theme.of(context).textTheme);

  // static bool getDrawerTheme(bool isDarkMode) {
  //   return backgroundColor: isDarkMode ? true : false;
  //     // Add other drawer theme properties as needed

  // }
}
