import 'package:meetx/constants/color.dart';
import 'package:meetx/constants/textstyle.dart';
import 'package:meetx/screens/auth/login_with_phone/my_brithday_screen.dart';
import 'package:meetx/utiles/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileDetailScreen extends StatelessWidget {
  const ProfileDetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConst.white,
      body: Column(
        children: [
          AppBarDesign(),
          Text(
            "Profile Details",
            style: TextStyleClass.interBold(
              size: 28.0,
            ),
          ),
          SizedBox(
            height: 33,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: TextFromFieldCommon(hintText: "First Name"),
          ),
          SizedBox(
            height: 22,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: TextFromFieldCommon(hintText: "Last Name"),
          ),
          SizedBox(
            height: 16,
          ),
          Text(
            '''This is how it will appear in  appname
and you will not be able to change it''',
            textAlign: TextAlign.center,
            style: TextStyleClass.interRegular(
              size: 16.0,
              color: ColorConst.grey69,
            ),
          ),
          SizedBox(
            height: 214,
          ),
          CommonButton(
            onTap: () {
              Get.to(() => MyBirthDAyScreen());
            },
            title: "Continue",
          ),
        ],
      ),
    );
  }
}
