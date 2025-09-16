import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:meetx/constants/color.dart';
import 'package:meetx/constants/image.dart';
import 'package:meetx/constants/textstyle.dart';

// Widget pentru primele două carduri
Widget firstTow() {
  return Container(
    height: 70,
    width: Get.width,
    margin: const EdgeInsets.only(left: 24, right: 24, bottom: 12),
    decoration: BoxDecoration(
      color: ColorConst.white,
      borderRadius: BorderRadius.circular(5),
      boxShadow: [
        BoxShadow(
          color: ColorConst.black.withOpacity(0.1),
          blurRadius: 5,
        ),
      ],
    ),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image( // ✅ am scos const
              image: AssetImage(ImageConst.appLogo),
              height: 15,
            ),
            const SizedBox(width: 8),
            Text(
              "tinder",
              textAlign: TextAlign.center,
              style: TextStyleClass.interBold(
                size: 20.0,
                color: ColorConst.black09,
              ),
            ),
          ],
        ),
        Text(
          "Unlock our most exclusive features",
          textAlign: TextAlign.center,
          style: TextStyleClass.interRegular(
            size: 16.0,
            color: ColorConst.grey69,
          ),
        ),
      ],
    ),
  );
}

// Secțiune exemplu – rând cu două butoane
Widget rowTwo() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: [
      Container(
        height: 70,
        width: Get.width / 2.3,
        decoration: BoxDecoration(
          color: ColorConst.white,
          borderRadius: BorderRadius.circular(5),
          boxShadow: [
            BoxShadow(
              color: ColorConst.black.withOpacity(0.1),
              blurRadius: 5,
            ),
          ],
        ),
        child: Center(
          child: SvgPicture.asset(
            ImageConst.star,
            height: 30,
            color: ColorConst.appColorFF,
          ),
        ),
      ),
      Container(
        height: 70,
        width: Get.width / 2.3,
        decoration: BoxDecoration(
          color: ColorConst.white,
          borderRadius: BorderRadius.circular(5),
          boxShadow: [
            BoxShadow(
              color: ColorConst.black.withOpacity(0.1),
              blurRadius: 5,
            ),
          ],
        ),
        child: Center(
          child: SvgPicture.asset(
            ImageConst.heart,
            height: 30,
            color: ColorConst.appColorFF,
          ),
        ),
      ),
    ],
  );
}

// Titlu pentru secțiuni
Widget editInfoText({required String text}) {
  return Padding(
    padding: const EdgeInsets.only(left: 24, top: 12, bottom: 8),
    child: Text(
      text,
      style: TextStyleClass.interSemiBold(
        size: 18.0,
        color: ColorConst.black09,
      ),
    ),
  );
}
