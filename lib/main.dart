import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:usuarios/presentation/home/view/HomaView.dart';
import 'package:usuarios/presentation/shared/theme/default_theme.dart';
import 'package:usuarios/presentation/shared/theme/palette.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'User',
      debugShowCheckedModeBanner: false,
      theme: DefaultTheme().theme,
      darkTheme: ThemeData(
        brightness: Brightness.dark,
      ),
      themeMode: ThemeMode.light,
      onReady: () {
        print('prueba');
      },
      onInit: () {
        print('prueba2');
      },
      home: HomeView(),
    );
  }
}
