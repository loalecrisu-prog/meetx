import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meetx/screens/splashScreen/splash_screen.dart';

class MyApp extends StatelessWidget {
MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}
