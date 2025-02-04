import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../app_colors.dart';

class AppTheme {
  AppTheme._();

  static const String merienda = 'Merienda';
  static const String roboto = 'Roboto';
  static final AppTheme _instance = AppTheme._();

  static AppTheme get instance => _instance;

  static ThemeData get lightTheme => ThemeData(
      brightness: Brightness.light,
      fontFamily: roboto,
      textTheme: textTheme(AppColors.black));

  static ThemeData get darkTheme => ThemeData(
        brightness: Brightness.dark,
        fontFamily: roboto,
        textTheme: textTheme(AppColors.white),
      );

  static TextTheme textTheme(Color color) {
    return TextTheme(
        bodySmall: TextStyle(
          fontSize: 16.sp,
          fontWeight: FontWeight.w400,
          color: color,
        ),
        bodyMedium: TextStyle(
          fontSize: 20.sp,
          fontWeight: FontWeight.w500,
          color: color,
        ),
        bodyLarge: TextStyle(
          fontSize: 30.sp,
          fontWeight: FontWeight.w500,
          color: color
        ),
        titleSmall: TextStyle(
            fontSize: 40.sp,
            fontWeight: FontWeight.w600,
            color: color
        ),
        titleMedium: TextStyle(
            fontSize: 50.sp,
            fontWeight: FontWeight.w700,
            color: color
        ),
        titleLarge: TextStyle(
          fontSize: 60.sp,
          fontWeight: FontWeight.w800,
          color: color
        ));
  }
}
