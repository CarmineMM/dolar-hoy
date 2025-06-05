import 'package:flutter/material.dart';

class AppTheme {
  ThemeData getTheme({isDarkMode = false}) => ThemeData(
    primaryColor: Color.fromRGBO(36, 43, 52, 1),
    secondaryHeaderColor: Color.fromRGBO(246, 134, 31, 1),
    brightness: isDarkMode ? Brightness.dark : Brightness.light,
    appBarTheme: AppBarTheme(
      backgroundColor: Color.fromRGBO(36, 43, 52, 1),
      foregroundColor: Colors.grey[100],
    ),
  );
}
