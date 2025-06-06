import 'package:dolar_hoy/core/constants/theme_colors.dart';
import 'package:flutter/material.dart';

class AppTheme {
  ThemeData getTheme({isDarkMode = false}) => ThemeData(
    primaryColor: isDarkMode ? ThemeColors.darkPrimary : ThemeColors.primary,
    secondaryHeaderColor: isDarkMode ? ThemeColors.darkSecondary : ThemeColors.secondary,
    brightness: isDarkMode ? Brightness.dark : Brightness.light,
    appBarTheme: AppBarTheme(
      backgroundColor: isDarkMode ? ThemeColors.darkPrimary : ThemeColors.primary,
      foregroundColor: isDarkMode ? Colors.grey[800] : Colors.grey[100],
    ),
  );
}
