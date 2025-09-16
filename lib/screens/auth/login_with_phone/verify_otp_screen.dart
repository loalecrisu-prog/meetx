import 'package:meetx/constants/color.dart';
import 'package:meetx/constants/textstyle.dart';
import 'package:meetx/screens/auth/login_with_phone/my_mobile_screen.dart';
import 'package:meetx/screens/auth/login_with_phone/whats_your_email_screen.dart';
import 'package:meetx/utiles/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pinput/pinput.dart';

class VerifyOtpScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConst.white,
      body: Column(
        children: [
          AppBarDesign(),
          Text(
            "Verify it’s you",
            style: TextStyleClass.interBold(
              size: 28.0,
            ),
          ),
          SizedBox(
            height: 11,
          ),
          RichText(
            textAlign: TextAlign.center,
            text: TextSpan(
              children: [
                TextSpan(
                  text: "We send a code to ",
                  style: TextStyleClass.interRegular(
                    size: 18.0,
                  ),
                ),
                TextSpan(
                  text: "(+91 12345 67890).\n",
                  style: TextStyleClass.interRegular(
                    size: 18.0,
                    color: ColorConst.appColor,
                  ),
                ),
                TextSpan(
                  text: "Enter it here to verify your identity.",
                  style: TextStyleClass.interRegular(
                    size: 18.0,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 42,
          ),
          Pinput(
            defaultPinTheme: defaultPinTheme,
            focusedPinTheme: focusedPinTheme,
            submittedPinTheme: submittedPinTheme,
            onCompleted: (val) {
              Get.to(() => WhatsYourEmailScreen());
            },
          ),
          SizedBox(
            height: 42,
          ),
          TextButton(
            onPressed: () {},
            child: Text(
              "Send again",
              style: TextStyleClass.interBold(
                size: 18.0,
                color: ColorConst.appColorFF,
              ),
            ),
          ),
        ],
      ),
    );
  }

  final defaultPinTheme = PinTheme(
    width: 66,
    height: 67,
    textStyle: TextStyle(
      fontSize: 20,
      color: Color.fromRGBO(30, 60, 87, 1),
      fontWeight: FontWeight.w600,
    ),
    decoration: BoxDecoration(
      border: Border.all(
        color: ColorConst.greyE8,
      ),
      borderRadius: BorderRadius.circular(15),
    ),
  );
  final focusedPinTheme = PinTheme(
    width: 66,
    height: 67,
    /*textStyle: TextStyle(
      fontSize: 20,
      color: Color.fromRGBO(30, 60, 87, 1),
      fontWeight: FontWeight.w600,
    ),*/
    decoration: BoxDecoration(
      border: Border.all(
        color: ColorConst.appColor,
      ),
      borderRadius: BorderRadius.circular(15),
    ),
  );
  final submittedPinTheme = PinTheme(
    width: 66,
    height: 67,
    textStyle: TextStyleClass.interSemiBold(
      size: 34.0,
      color: ColorConst.white,
    ),
    decoration: BoxDecoration(
      color: ColorConst.appColorFF,
      border: Border.all(
        color: ColorConst.appColorFF,
      ),
      borderRadius: BorderRadius.circular(15),
    ),
  );
}
