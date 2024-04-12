import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'app_colors.dart';

class MyTheme {
  static ThemeData darkTheme(BuildContext context) => ThemeData(

      iconTheme: IconThemeData(
        color: AppColors.primaryColor,
      ),
      primaryIconTheme: IconThemeData(color: AppColors.blackColor),
      cardTheme: CardTheme(
          shadowColor: AppColors.primaryColor, elevation: 6),
      appBarTheme: AppBarTheme(
          elevation: 0,
          backgroundColor: AppColors.primaryColor,
          actionsIconTheme: IconThemeData(color: AppColors.blackColor)),
      hintColor: AppColors.primaryColor);
}