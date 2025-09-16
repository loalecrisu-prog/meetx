import 'package:meetx/constants/color.dart';
import 'package:meetx/screens/onboadingScreen/controller/onboarding_controller.dart';
import 'package:meetx/screens/onboadingScreen/utiles/onboarding_utiles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OnBoardingScreen extends StatelessWidget {
  final OnBoardingController onBoardingController =
      Get.put(OnBoardingController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConst.white,
      body: Stack(
        alignment: Alignment.center,
        children: [
          FirstPart(onBoardingController: onBoardingController),
          SecondPart(onBoardingController: onBoardingController),
        ],
      ),
    );
  }
}
