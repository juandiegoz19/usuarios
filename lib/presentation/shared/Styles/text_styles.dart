import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TextStyles {
  static TextStyle titleStyle(
      {Color color = Colors.black, bool isBold = false}) {
    return TextStyle(
      color: color,
      fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
      fontFamily: 'OpenSans',
      fontSize: Get.textScaleFactor * 20,
    );
  }

  static TextStyle title2Style(
      {Color color = Colors.black, bool isBold = false}) {
    return TextStyle(
      color: color,
      fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
      fontFamily: 'OpenSans',
      fontSize: Get.textScaleFactor * 15,
    );
  }

  static TextStyle title3Style(
      {Color color = Colors.black, bool isBold = false}) {
    return TextStyle(
      color: color,
      fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
      fontFamily: 'OpenSans',
      fontSize: Get.textScaleFactor * 16,
    );
  }

  static TextStyle subTitleStyle(
      {Color color = Colors.black, bool isBold = false}) {
    return TextStyle(
      color: color,
      fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
      fontFamily: 'OpenSans',
      fontSize: Get.textScaleFactor * 12,
    );
  }

  static TextStyle headlineStyle(
      {Color color = Colors.black, bool isBold = false}) {
    return TextStyle(
      color: color,
      fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
      fontFamily: 'OpenSans',
      fontSize: Get.textScaleFactor * 16,
    );
  }

  static TextStyle subHeadLineUnderLineStyle(
      {Color color = Colors.black, bool isBold = false}) {
    return TextStyle(
      decoration: TextDecoration.underline,
      color: color,
      fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
      fontFamily: 'OpenSans',
      fontSize: Get.textScaleFactor * 14,
    );
  }

  static TextStyle subHeadLineStyle(
      {Color color = Colors.black, bool isBold = false}) {
    return TextStyle(
      color: color,
      fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
      fontFamily: 'OpenSans',
      fontSize: Get.textScaleFactor * 14,
    );
  }

  static TextStyle captionStyle(
      {Color color = Colors.black, bool isBold = false}) {
    return TextStyle(
      color: color,
      fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
      fontFamily: 'OpenSans',
      fontSize: Get.textScaleFactor * 12,
    );
  }

  static TextStyle caption2Style(
      {Color color = Colors.black, bool isBold = false}) {
    return TextStyle(
      color: color,
      fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
      fontFamily: 'OpenSans',
      fontSize: Get.textScaleFactor * 11,
    );
  }

  static TextStyle caption3Style(
      {Color color = Colors.black, bool isBold = false}) {
    return TextStyle(
      color: color,
      fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
      fontFamily: 'OpenSans',
      fontSize: Get.textScaleFactor * 10,
    );
  }

  static TextStyle bodyStyle(
      {Color color = Colors.black, bool isBold = false}) {
    return TextStyle(
      color: color,
      fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
      fontFamily: 'OpenSans',
      fontSize: Get.textScaleFactor * 18,
    );
  }
}
