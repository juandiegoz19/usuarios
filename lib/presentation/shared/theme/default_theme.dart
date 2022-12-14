import 'package:flutter/material.dart';

final primaryGray = Colors.green;
final principalColor = Colors.green.shade400;

class DefaultTheme {
  final theme = ThemeData.light().copyWith(
      visualDensity: VisualDensity.adaptivePlatformDensity,
      colorScheme: ColorScheme(
          primary: principalColor,
          background: Colors.red,
          onPrimary: principalColor,
          secondary: primaryGray,
          surface: Colors.red,
          error: Colors.red,
          onSecondary: Colors.white,
          brightness: Brightness.light,
          onError: Colors.red,
          onSurface: primaryGray,
          onBackground: Colors.red),
      scaffoldBackgroundColor: Colors.grey.shade100,
      appBarTheme: const AppBarTheme(
        color: Colors.green,
      ),
      iconTheme: IconThemeData(
        color: Colors.green.shade900,
      ));
}
