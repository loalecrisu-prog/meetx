import 'package:meetx/constants/color.dart';
import 'package:meetx/constants/image.dart';
import 'package:meetx/constants/textstyle.dart';
import 'package:meetx/screens/auth/login_with_phone/i_am_screen.dart';
import 'package:meetx/utiles/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class MyBirthDAyScreen extends StatelessWidget {
   MyBirthDAyScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConst.white,
      body: Column(
        children: [
          AppBarDesign(),
          Text(
            "My Birthday Is",
            style: TextStyleClass.interBold(
              size: 28.0,
            ),
          ),
          SizedBox(
            height: 33,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: TextFromFieldCommon(
              hintText: "MM/DD/YYYY",
              suffixIcon: Padding(
                padding: const EdgeInsets.all(15.0),
                child: SvgPicture.asset(
                  ImageConst.calander,
                ),
              ),
            ),
          ),
          SizedBox(
            height: 16,
          ),
          Text(
            "Your age will be public",
            textAlign: TextAlign.center,
            style: TextStyleClass.interRegular(
              size: 16.0,
              color: ColorConst.grey69,
            ),
          ),
          SizedBox(
            height: 310,
          ),
          CommonButton(
            onTap: () {
              Get.to(() => IAmScreen());
            },
            title: "Continue",
          ),
        ],
      ),
    );
  }
}
