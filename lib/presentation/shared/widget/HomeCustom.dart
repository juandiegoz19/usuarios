import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:usuarios/presentation/shared/Styles/text_styles.dart';

class HomeCustom extends StatelessWidget {
  HomeCustom(
      {super.key,
      required this.body,
      this.title = '',
      this.iconBack = false,
      this.paddingVertical = 10,
      this.paddingHorizontal = 15});

  final Widget body;
  String title;
  bool iconBack;
  double paddingVertical;
  double paddingHorizontal;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: title.isNotEmpty
            ? AppBar(
                leading: iconBack
                    ? IconButton(
                        icon: const Icon(Icons.arrow_back_ios,
                            color: Colors.white),
                        onPressed: () => Get.back(),
                      )
                    : null,
                title: Text(
                  title,
                  style:
                      TextStyles.titleStyle(color: Colors.white, isBold: true),
                ),
              )
            : null,
        body: AnnotatedRegion<SystemUiOverlayStyle>(
            value: SystemUiOverlayStyle.light,
            child: Padding(
              padding: EdgeInsets.symmetric(
                  vertical: paddingVertical, horizontal: paddingHorizontal),
              child: body,
            )),
      ),
    );
  }
}
