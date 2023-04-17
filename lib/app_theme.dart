import 'package:flutter/material.dart';

class AppTheme {
  static const Color primaryColor = Color(0xFFFC578D);
  static const Color secondaryColor = Color(0XFFF96D69);
  static const Color textColor1 = Color(0XFF414141);
  static const Color textColor2 = Color(0XFFA6A6A6);
  static const Color elementColor = Color(0XFFF5F5F5);

  final ThemeData themeData = ThemeData(
    primarySwatch: MaterialColor(
      primaryColor.value,
      <int, Color>{
        50: primaryColor.withOpacity(0.1),
        100: primaryColor.withOpacity(0.2),
        200: primaryColor.withOpacity(0.3),
        300: primaryColor.withOpacity(0.4),
        400: primaryColor.withOpacity(0.5),
        500: primaryColor.withOpacity(0.6),
        600: primaryColor.withOpacity(0.7),
        700: primaryColor.withOpacity(0.8),
        800: primaryColor.withOpacity(0.9),
        900: primaryColor.withOpacity(1.0),
      },
    ),
    scaffoldBackgroundColor: Colors.white,
    primaryColor: primaryColor,
    textTheme: const TextTheme(
      headlineLarge: TextStyle(
        color: Colors.black,
        fontSize: 40,
        fontFamily: 'Gilroy',
        fontStyle: FontStyle.italic,
      ),
      headlineMedium: TextStyle(
        color: textColor1,
        fontSize: 25,
        fontFamily: 'Gilroy',
      ),
      headlineSmall: TextStyle(
        color: textColor1,
        fontSize: 12,
        fontFamily: 'Gilroy',
      ),
      bodyLarge: TextStyle(
        color: Colors.black,
        fontSize: 18,
        fontWeight: FontWeight.bold,
        fontFamily: 'Gilory',
      ),
      bodyMedium: TextStyle(
        color: Colors.black,
        fontSize: 14,
        fontWeight: FontWeight.bold,
        fontFamily: 'Gilory',
      ),
    ),
    inputDecorationTheme: const InputDecorationTheme(
      floatingLabelBehavior: FloatingLabelBehavior.never,
      contentPadding: EdgeInsets.only(left: 10),
      prefixIconColor: textColor2,
      enabledBorder: UnderlineInputBorder(
        borderSide: BorderSide(
          color: textColor2,
        ),
      ),
      focusedBorder: UnderlineInputBorder(
        borderSide: BorderSide(color: textColor2),
      ),
    ),
    appBarTheme: const AppBarTheme(
      elevation: 0,
      color: Colors.white,
      iconTheme: IconThemeData(color: textColor1),
      actionsIconTheme: IconThemeData(color: textColor2),
    ),
  );
}
