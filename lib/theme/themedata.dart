import 'package:flutter/material.dart';

ThemeData themeData(BuildContext context) {
  final screenSize = MediaQuery.sizeOf(context);
  return ThemeData(
    useMaterial3: true,
    canvasColor: Colors.black,
    colorScheme: ColorScheme.fromSeed(seedColor: Colors.red),
    appBarTheme: const AppBarTheme(
      elevation: 0,
      scrolledUnderElevation: 0,
      titleSpacing: 0,
      backgroundColor: Colors.black,
    ),
    scaffoldBackgroundColor: Colors.black,
    textTheme: TextTheme(
      titleLarge: TextStyle(
        fontSize: screenSize.height * 0.0330,
        color: Colors.red,
        fontWeight: FontWeight.bold,
      ),
      titleMedium: TextStyle(
        fontSize: screenSize.height * 0.0290,
        color: Colors.white,
        fontWeight: FontWeight.bold,
      ),
      titleSmall: TextStyle(
        fontSize: screenSize.height * 0.0250,
        color: Colors.white,
        fontWeight: FontWeight.bold,
      ),
      bodyLarge: TextStyle(
        fontSize: screenSize.height * 0.0330,
        color: Colors.white,
        fontWeight: FontWeight.normal,
      ),
      bodyMedium: TextStyle(
        fontSize: screenSize.height * 0.0290,
        color: Colors.white,
        fontWeight: FontWeight.normal,
      ),
      bodySmall: TextStyle(
        fontSize: screenSize.height * 0.0250,
        color: Colors.white,
        fontWeight: FontWeight.normal,
      ),
      labelSmall: TextStyle(
        fontSize: screenSize.height * 0.0184,
        color: Colors.white,
        fontWeight: FontWeight.normal,
      ),
      labelMedium: TextStyle(
        fontSize: screenSize.height * 0.0220,
        color: Colors.white,
        fontWeight: FontWeight.normal,
      ),
    ),
  );
}
