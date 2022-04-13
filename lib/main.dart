import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:studycube/screen/splash_screen.dart';

import 'constants/app_colors.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: '스터디큐브',
      theme: ThemeData(
        primaryColor: AppColors.point3,
        appBarTheme: AppBarTheme(backgroundColor: Colors.white, elevation: 0.5, iconTheme: IconThemeData(color: Colors.black)),
        backgroundColor: AppColors.colorBackground,
        fontFamily: 'NotoSansCJKkr',
      ),
      home: SplashScreen(),
    );
  }
}
