import 'package:dolar_hoy/core/constants/theme_colors.dart';
import 'package:flutter/material.dart';

class AppTheme {
  ThemeData getTheme({isDarkMode = false}) => ThemeData(
    primaryColor: ThemeColors.primary,
    secondaryHeaderColor: ThemeColors.secondary,
    brightness: isDarkMode ? Brightness.dark : Brightness.light,
    appBarTheme: AppBarTheme(
      backgroundColor: ThemeColors.primary,
      foregroundColor: Colors.grey[100],
    ),
  );
}
