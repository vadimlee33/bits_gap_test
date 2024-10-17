import 'package:bitsgap_test_app/core/theme/app_colors.dart';
import 'package:flutter/material.dart';

class AppTheme {
  static final ThemeData lightTheme = ThemeData(
    primarySwatch: Colors.blue,
    visualDensity: VisualDensity.adaptivePlatformDensity,
    scaffoldBackgroundColor: AppColors.whiteSmoke,
    cardTheme: const CardTheme(
      color: AppColors.white,
    ),
    textTheme: const TextTheme(
      displayMedium: TextStyle(
          color: AppColors.grey, fontSize: 14.0, fontWeight: FontWeight.w500),
      titleMedium: TextStyle(
          color: AppColors.nero,
          fontSize: 14.0,
          fontWeight: FontWeight.w700), // For informationType
      titleLarge: TextStyle(
          color: AppColors.nero,
          fontSize: 16.0,
          fontWeight: FontWeight.w700), // For text
    ),
  );
}
