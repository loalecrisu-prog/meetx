import 'package:meetx/constants/color.dart';
import 'package:meetx/constants/image.dart';
import 'package:meetx/constants/textstyle.dart';
import 'package:meetx/screens/auth/trouble_login/account_recovery_screen.dart';
import 'package:meetx/utiles/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LogInOptionScreen extends StatelessWidget {
   LogInOptionScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print("${Get.height}");
    print("${Get.width}");
    return Scaffold(
      backgroundColor: ColorConst.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: 100,
          ),
          Text(
            "Let,s you in",
            style: TextStyleClass.interBold(
              size: 28.0,
            ),
          ),
          SizedBox(
            height: 20,
          ),
          RichText(
            textAlign: TextAlign.center,
            text: TextSpan(
              children: [
                TextSpan(
                  text: "By Clicking Log in, you agree with our ",
                  style: TextStyleClass.interRegular(
                    size: 15.0,
                  ),
                ),
                TextSpan(
                  text: "Terms",
                  style: TextStyleClass.interUnderLine(),
                ),
                TextSpan(
                  text: ".\nLearn how we process your date in our ",
                  style: TextStyleClass.interRegular(
                    size: 15.0,
                  ),
                ),
                TextSpan(
                  text: "Privacy\nPolicy",
                  style: TextStyleClass.interUnderLine(),
                ),
                TextSpan(
                  text: " and ",
                  style: TextStyleClass.interRegular(
                    size: 15.0,
                  ),
                ),
                TextSpan(
                  text: "Cookies Policy",
                  style: TextStyleClass.interUnderLine(),
                ),
                TextSpan(
                  text: ".",
                  style: TextStyleClass.interRegular(
                    size: 15.0,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 52,
          ),
          LoginCommonButtons(
            onTap: () {},
            image: ImageConst.googleSvg,
            title: "Login With Google",
          ),
          SizedBox(
            height: 18,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: MaterialButton(
              onPressed: () {},
              height: 61,
              minWidth: Get.width,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(40.0),
                side: BorderSide(
                  color: ColorConst.greyDA,
                  width: 1,
                ),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: Get.width >= 411 ? 80 : 50),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Image.asset(ImageConst.facebookPng, height: 24),
                    /*    SizedBox(
                      width: 15,
                    ),*/
                    Text(
                      "Login With Facebook",
                      style: TextStyleClass.interSemiBold(
                        size: 16.0,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(
            height: 18,
          ),
          LoginCommonButtons(
            onTap: () {},
            image: ImageConst.phoneSvg,
            title: "Login With Phone",
          ),
          SizedBox(
            height: 28,
          ),
          Text(
            "Or",
            style: TextStyleClass.interBold(
              size: 15.0,
            ),
          ),
          SizedBox(
            height: 28,
          ),
          CommonButton(
            onTap: () {
              Get.to(() => AccountRecoveryScreen());
            },
            title: "Trouble Logging in?",
          ),
        ],
      ),
    );
  }
}
