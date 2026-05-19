import 'package:docdoc/core/utils/colors.dart';
import 'package:flutter/material.dart';

class AppThemes {
  static get lightTheme => ThemeData(
    primaryColor: AppColors.primaryColor,
    scaffoldBackgroundColor: AppColors.wightColor,
    appBarTheme: const AppBarTheme(
      backgroundColor: AppColors.wightColor,
      elevation: 0,
      iconTheme: IconThemeData(color: AppColors.blackColor),
    ),
    colorScheme: ColorScheme.fromSeed(seedColor: AppColors.primaryColor, onSurface: AppColors.wightColor),
    inputDecorationTheme: InputDecorationTheme(
      hintStyle: TextStyle(color: AppColors.greyColor),
      enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(16), borderSide: BorderSide.none),
      focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(16), borderSide: BorderSide.none),
      errorBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(16), borderSide: BorderSide.none),
      focusedErrorBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(16), borderSide: BorderSide.none),
    ),
  );
}
