import 'package:flutter/material.dart';

class AppTheme {
  ThemeData getTheme({isDarkMode = false}) => ThemeData(
    primarySwatch: Colors.blue,
    secondaryHeaderColor: Colors.green,
    brightness: isDarkMode ? Brightness.dark : Brightness.light,
    appBarTheme: AppBarTheme(backgroundColor: Colors.blue, foregroundColor: Colors.white),
  );
}
