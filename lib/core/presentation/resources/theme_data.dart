import 'package:flutter/material.dart';
import 'colors.dart';

ThemeData appTheme() {
  final textTheme = TextTheme(
    headline5: TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.bold,
      color: AppColors.primaryColor(1),
    ),
    headline6: TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.bold,
      color: AppColors.primaryColor(1),
    ),
    bodyText1: const TextStyle(
        fontSize: 15, height: 1.5, fontWeight: FontWeight.normal),
    bodyText2: const TextStyle(
      fontSize: 14,
    ),
  );

  final inputDecorationTheme = InputDecorationTheme(
    contentPadding:
        const EdgeInsets.symmetric(vertical: 15.0, horizontal: 10.0),
    // fillColor: Color(0XFFF0F0F0),
    filled: true,
    errorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(5),
      borderSide: BorderSide(
        color: AppColors.primaryColor(1),
      ),
    ),
    focusedErrorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(5),
      borderSide: BorderSide(
        color: AppColors.primaryColor(1),
      ),
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(5),
      borderSide: BorderSide(
        color: AppColors.primaryColor(1),
      ),
    ),
    focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: AppColors.primaryColor(1),
        ),
        borderRadius: BorderRadius.circular(5)),
    alignLabelWithHint: true,
  );
  final buttonTheme = ButtonThemeData(
    colorScheme: ColorScheme.light(primary: AppColors.primaryColor(1)),
    buttonColor: AppColors.primaryColor(1),
    textTheme: ButtonTextTheme.primary,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(8),
    ),
  );

  return ThemeData(
    primaryColor: AppColors.primaryColor(1),
    secondaryHeaderColor: AppColors.secondaryColor(1),
    scaffoldBackgroundColor: const Color(0xFFF8F8F8),
    inputDecorationTheme: inputDecorationTheme,
    fontFamily: 'Roboto',
    textTheme: textTheme,
    buttonTheme: buttonTheme,
    iconTheme: IconThemeData(color: AppColors.primaryColor(1)),
    appBarTheme: AppBarTheme(
        color: AppColors.primaryColor(1),
        titleTextStyle: textTheme.bodyText1,
        iconTheme: const IconThemeData(color: Colors.white, size: 20),
        actionsIconTheme:
            const IconThemeData(color: Colors.black, opacity: 0.7, size: 28)),
  );
}
