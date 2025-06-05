import 'package:flutter/material.dart';

class AppTheme {
  ThemeData getTheme({isDarkMode = false}) => ThemeData(
    primarySwatch: Colors.lightBlue,
    secondaryHeaderColor: Colors.green,
    brightness: isDarkMode ? Brightness.dark : Brightness.light,
    appBarTheme: AppBarTheme(backgroundColor: Colors.lightBlue, foregroundColor: Colors.grey[100]),
  );
}
