import 'package:flutter/material.dart';
import 'package:get/get.dart';

const primaryGray = Colors.green;
final principalColor = Colors.green.shade400;

class DefaultTheme {
  final theme = ThemeData.light().copyWith(
      colorScheme: ColorScheme(
          primary: principalColor,
          background: principalColor,
          onPrimary: principalColor,
          secondary: primaryGray,
          surface: Colors.white,
          error: Colors.red,
          onSecondary: Colors.white,
          brightness: Brightness.light,
          onError: Colors.red,
          onSurface: primaryGray,
          onBackground: primaryGray),
      scaffoldBackgroundColor: Colors.grey.shade100,
      backgroundColor: principalColor,
      appBarTheme: const AppBarTheme(
        color: primaryGray,
        elevation: 5,
        shadowColor: Colors.white,
        titleTextStyle: TextStyle(color: Colors.white, fontSize: 20),
        centerTitle: false,
        iconTheme: IconThemeData(color: Colors.white),
      ),
      indicatorColor: Colors.white,
      textTheme: TextTheme(
          headline5: TextStyle(
        color: Colors.white,
        fontSize: Get.textScaleFactor * 23,
      )));
}
