import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:ufrgs_mobile/utils/colors.dart';
import 'package:asuka/asuka.dart' as asuka;

class AppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'UFRGS Mobile',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: AppColors.red,
        primaryColorDark: AppColors.redDark,
        accentColor: AppColors.darkBlue,
      ),
      builder: asuka.builder,
    ).modular();
  }
}
