import 'package:meetx/constants/color.dart';
import 'package:meetx/constants/textstyle.dart';
import 'package:meetx/screens/auth/login_with_phone/controller/my_orientation_controller.dart';
import 'package:meetx/screens/auth/login_with_phone/show_me_screen.dart';
import 'package:meetx/screens/auth/login_with_phone/utiles/orientation_utiles.dart';
import 'package:meetx/utiles/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyOrientationScreen extends StatefulWidget {
  @override
  State<MyOrientationScreen> createState() => _MyOrientationScreenState();
}

class _MyOrientationScreenState extends State<MyOrientationScreen> {
  final MyOrientationController myOrientationController =
      Get.put(MyOrientationController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConst.white,
      body: Column(
        children: [
          AppBarDesign(
            action: [
              TextButton(
                onPressed: () {
                  Get.to(() => ShowMeScreen());
                },
                child: Text(
                  "Skip",
                  style: TextStyleClass.interBold(
                    size: 16.0,
                    color: ColorConst.appColor,
                  ),
                ),
              ),
            ],
          ),
          Text(
            "My Sexual orientation is",
            style: TextStyleClass.interBold(
              size: 28.0,
            ),
          ),
          SizedBox(
            height: 11,
          ),
          Text(
            "Select up t o 3",
            textAlign: TextAlign.center,
            style: TextStyleClass.interRegular(
              size: 16.0,
              color: ColorConst.grey69,
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: MultiSelectChip(
              myOrientationController.reportList,
            ),
          ),
          Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Obx(
                () => Checkbox(
                  value: myOrientationController.monVal.value,
                  onChanged: (val) {
                    myOrientationController.monVal.value = val!;
                  },
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(4.0),
                  ),
                  activeColor: ColorConst.appColorFF,
                ),
              ),
              Text(
                "Show my orientation on my profile",
                style: TextStyleClass.interRegular(
                  color: ColorConst.grey69,
                ),
              ),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          CommonButton(
            onTap: () {
              Get.to(() => ShowMeScreen());
            },
            title: "Continue",
          ),
          SizedBox(
            height: 49,
          ),
        ],
      ),
    );
  }
}
