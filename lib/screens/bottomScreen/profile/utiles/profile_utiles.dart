import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meetx/constants/color.dart';
import 'package:meetx/constants/image.dart';
import 'package:meetx/constants/textstyle.dart';

/// partea de sus a profilului
class ProfilePart1 extends StatelessWidget {
  ProfilePart1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          height: Get.height / 2,
          width: Get.width,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(ImageConst.edit_bg),
              fit: BoxFit.fill,
            ),
          ),
          child: Column(
            children: [
              AppBar(
                elevation: 0,
                backgroundColor: Colors.transparent,
                leading: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Image.asset(ImageConst.appLogo),
                ),
                centerTitle: true,
                title: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.favorite, color: Colors.red, size: 26),
                    SizedBox(width: 6),
                    Text(
                      "MeetX",
                      style: TextStyleClass.arizoniaRegular(size: 27.0),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 28),
              Stack(
                alignment: Alignment.bottomRight,
                children: [
                  Container(
                    height: 152,
                    width: 152,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        image: AssetImage(ImageConst.men1),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Container(
                    width: 44,
                    height: 44,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topRight,
                        end: Alignment.bottomLeft,
                        colors: [
                          ColorConst.appColor,
                          ColorConst.appColorFD,
                        ],
                      ),
                      shape: BoxShape.circle,
                    ),
                    child: Icon(Icons.camera_alt_rounded, color: ColorConst.white),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.only(top: 4),
                child: Text(
                  "John Doe",
                  style: TextStyleClass.interBold(size: 30.0),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
