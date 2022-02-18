import 'package:flutter/material.dart';

ThemeData themeData(){
  return ThemeData(
    primarySwatch: Colors.blue,
    scaffoldBackgroundColor: Colors.white,
    appBarTheme: AppBarTheme(
      color: Colors.white,
      iconTheme: IconThemeData(
          color: Colors.blue
      ),
      titleTextStyle: TextStyle(
          color: Colors.blue,
          fontSize: 20.0,
          fontWeight: FontWeight.bold
      ),
      elevation: 0.0,
      actionsIconTheme: IconThemeData(
          color: Colors.blue
      ),
    ),
  );
}