import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:usuarios/presentation/home/view/HomaView.dart';
import 'package:usuarios/presentation/home/view_model/home_vm.dart';
import 'package:usuarios/presentation/shared/theme/default_theme.dart';

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
      onDispose: () {
        Get.delete<HomeViewModel>();
      },
      home: HomeView(),
    );
  }
}
