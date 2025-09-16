import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import 'package:meetx/constants/color.dart';
import 'package:meetx/constants/image.dart';
import 'package:meetx/constants/textstyle.dart';

// controller
import 'package:meetx/screens/bottomScreen/profile/subscreenlist/contaroller/setting_controller.dart';

// utils (AICI sunt rowTwo și editInfoText)
import 'package:meetx/screens/bottomScreen/profile/subscreenlist/utiles/setting/setting_utiles.dart';

// ✅ Phone edit screen – îl importăm direct aici, nu în setting_utiles.dart
import 'package:meetx/screens/bottomScreen/profile/subscreenlist/phone_edit_screen.dart';

class SettingScreen extends StatelessWidget {
  final SettingController settingController = Get.put(SettingController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            height: 101,
            width: Get.width,
            padding: const EdgeInsets.only(bottom: 10),
            decoration: BoxDecoration(
              color: ColorConst.white,
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(23),
                bottomRight: Radius.circular(23),
              ),
              boxShadow: [
                BoxShadow(
                  blurRadius: 14,
                  color: ColorConst.black.withOpacity(0.15),
                ),
              ],
            ),
            child: AppBar(
              backgroundColor: Colors.transparent,
              elevation: 0.0,
              leading: IconButton(
                onPressed: () => Get.back(),
                icon: Icon(
                  Icons.arrow_back,
                  size: 25,
                  color: ColorConst.appColorFF,
                ),
              ),
              centerTitle: true,
              title: Text(
                "Settings",
                style: TextStyleClass.interSemiBold(
                  size: 20.0,
                  color: ColorConst.black09,
                ),
              ),
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 20),
                  firstTow(),
                  firstTow(),
                  rowTwo(),
                  const SizedBox(height: 5),
                  editInfoText(text: "Account Settings"),
                  const Divider(),
                  InkWell(
                    onTap: () {
                      Get.to(() => PhoneEditScreen()); // ✅ corect acum
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 12, horizontal: 24),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Phone Number",
                            style: TextStyleClass.interRegular(
                              size: 16.0,
                              color: ColorConst.black09,
                            ),
                          ),
                          Row(
                            children: [
                              Text(
                                "+91 12345 67890",
                                style: TextStyleClass.interRegular(
                                  color: ColorConst.grey69,
                                ),
                              ),
                              const SizedBox(width: 8),
                              Icon(
                                Icons.arrow_forward_ios,
                                color: ColorConst.appColorFF,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  const Divider(),
                  Padding(
                    padding: const EdgeInsets.only(top: 7, left: 24, bottom: 15),
                    child: Text(
                      "Verify a Phone Number to help secure your account.",
                      style: TextStyleClass.interSemiBold(
                        size: 14.0,
                        color: ColorConst.grey69,
                      ),
                    ),
                  ),
                  // restul codului (slidere, switch-uri, logout, delete account)
                  // rămâne EXACT cum îl ai deja în proiect
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

///common first two container
firstTow() {
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
            Image(
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
