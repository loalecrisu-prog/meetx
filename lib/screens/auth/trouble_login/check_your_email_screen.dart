import 'package:meetx/constants/color.dart';
import 'package:meetx/constants/textstyle.dart';
import 'package:meetx/screens/auth/login_with_phone/my_mobile_screen.dart';
import 'package:meetx/screens/auth/trouble_login/account_recovery_screen.dart';
import 'package:meetx/screens/auth/trouble_login/login_by_email_screen.dart';
import 'package:meetx/utiles/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CheckYourEmailScreen extends StatelessWidget {
  const CheckYourEmailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConst.white,
      body: Column(
        children: [
          AppBarDesign(),
          Text(
            "Check your email!",
            style: TextStyleClass.interBold(
              size: 28.0,
            ),
          ),
          SizedBox(
            height: 22.0,
          ),
          RichText(
            textAlign: TextAlign.center,
            text: TextSpan(
              children: [
                TextSpan(
                  text: "if we found an account with\n",
                  style: TextStyleClass.interRegular(
                    color: ColorConst.grey69,
                    size: 18.0,
                  ),
                ),
                TextSpan(
                  text: "Johndoe123@gmail.com\n",
                  style: TextStyleClass.interSemiBold(
                    color: ColorConst.grey69,
                    size: 18.0,
                  ),
                ),
                TextSpan(
                  text:
                      "an email has been sent. Please\ncheck your email in a moment.",
                  style: TextStyleClass.interRegular(
                    color: ColorConst.grey69,
                    size: 18.0,
                  ),
                ),
              ],
            ),
          ),
          Spacer(),
          Text(
            "Didn't receive a link?",
            style: TextStyleClass.interBold(
              color: ColorConst.grey69,
              size: 22.0,
            ),
          ),
          SizedBox(
            height: 28.0,
          ),
          CommonButton(
            onTap: () {
              Get.to(() => LoginByEmailScreen());
            },
            title: "Use A Different Email",
          ),
          SizedBox(
            height: 22.0,
          ),
          CommonButton(
            onTap: () {
              Get.to(() => MyMobileScreen());
            },
            title: "Use Your Phone Number",
          ),
          SizedBox(
            height: 122.0,
          ),
        ],
      ),
    );
  }
}
