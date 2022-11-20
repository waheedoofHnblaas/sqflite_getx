import 'package:flutter/material.dart';

ThemeData darkTheme() {

  return ThemeData(
    scaffoldBackgroundColor: const Color(0xFF000017),
    backgroundColor: Colors.blueAccent,
    primaryColor: Colors.white,
    fontFamily: 'Cairo',
    appBarTheme: const AppBarTheme(
      centerTitle: true,
      titleTextStyle: TextStyle(
        fontSize: 21,
        fontWeight: FontWeight.bold,
        color: Colors.white,
      ),
      elevation: 0,
      backgroundColor: Color(0xEF00001A),
      foregroundColor: Colors.white,
    ),
    primarySwatch: Colors.blue,
  );
}

ThemeData lightTheme() {

  return ThemeData(
    scaffoldBackgroundColor: Colors.white,
    backgroundColor: Colors.blueAccent,
    primaryColor: const Color(0xEF00001A),
    fontFamily: 'Cairo',
    appBarTheme: const AppBarTheme(
      centerTitle: true,
      titleTextStyle: TextStyle(
        fontSize: 21,
        fontWeight: FontWeight.bold,
        color: Color(0xEF00001A),
      ),
      elevation: 0,
      backgroundColor: Colors.white,
      foregroundColor: Color(0xEF00001A),
    ),
    primarySwatch: Colors.blue,
  );
}