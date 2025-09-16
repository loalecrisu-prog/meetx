import 'package:meetx/constants/color.dart';
import 'package:meetx/constants/image.dart';
import 'package:meetx/constants/textstyle.dart';
import 'package:meetx/screens/auth/login_with_phone/verify_otp_screen.dart';
import 'package:meetx/utiles/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyMobileScreen extends StatelessWidget {
 MyMobileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConst.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            AppBarDesign(),
            Text(
              "My Number Is",
              style: TextStyleClass.interBold(
                size: 28.0,
              ),
            ),
            SizedBox(
              height: 33,
            ),
            mobileTextFrom(),
            SizedBox(
              height: 16,
            ),
            Text(
              "When you tap continue, appname will send a text with\nverification code. Message and data rates may apply.\nThe verified phone number can be used to login.",
              textAlign: TextAlign.center,
              style: TextStyleClass.interRegular(
                size: 13.0,
                color: ColorConst.grey69,
              ),
            ),
            SizedBox(
              height: 16,
            ),
            Text(
              "Learn what happens when your number changes.",
              textAlign: TextAlign.center,
              style: TextStyleClass.interUnderLine(size: 13.0),
            ),
           SizedBox(
             height: 150,
           ),
            CommonButton(
              onTap: () {
                Get.to(() => VerifyOtpScreen());
              },
              title: "Continue",
            ),
            SizedBox(
              height: 185.0,
            ),
          ],
        ),
      ),
    );
  }

  Widget mobileTextFrom() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: TextFormField(
        decoration: InputDecoration(
          prefixIcon: SizedBox(
            width: 120,
            child: Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Row(
                children: [
                  Image(
                    image: AssetImage(
                      ImageConst.india,
                    ),
                  ),
                  Text(
                    " (+91)",
                    style: TextStyleClass.interRegular(
                      size: 16.0,
                    ),
                  ),
                  Icon(
                    Icons.keyboard_arrow_down,
                    color: ColorConst.greyAD,
                  ),
                  SizedBox(
                    height: 10,
                    width: 10,
                    child: VerticalDivider(
                      color: ColorConst.greyE8,
                    ),
                  ),
                ],
              ),
            ),
          ),
          contentPadding: EdgeInsets.only(top: 35, left: 20),
          hintText: "12345 67890",
          hintStyle: TextStyleClass.interSemiBold(
            size: 16.0,
            color: ColorConst.black03,
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(40),
            borderSide: BorderSide(
              color: ColorConst.greyEB,
              width: 1,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(40),
            borderSide: BorderSide(
              color: ColorConst.greyEB,
              width: 1,
            ),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(40),
            borderSide: BorderSide(
              color: ColorConst.appColor,
              width: 1,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(40),
            borderSide: BorderSide(
              color: ColorConst.appColor,
              width: 1,
            ),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(40),
            borderSide: BorderSide(
              color: ColorConst.appColor,
              width: 1,
            ),
          ),
          disabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(40),
            borderSide: BorderSide(
              color: ColorConst.greyEB,
              width: 1,
            ),
          ),
        ),
      ),
    );
  }
}
