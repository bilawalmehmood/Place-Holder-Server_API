import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rest_api_flutter/screens/auth/log_in_screen.dart';

import 'res/constants/app_colors.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Rest Api Flutter',
      theme: ThemeData(
        brightness: Brightness.dark,
        primaryColor: AppColors.primeryColors,
        scaffoldBackgroundColor: AppColors.scaffoldBackgroundColor,
        textTheme: const TextTheme(
          bodyText1: TextStyle(
            color: AppColors.textColor,
          ),
        ),
      ),
      home: const LoginScreen(),
    );
  }
}
