import 'package:meetx/constants/color.dart';
import 'package:meetx/constants/image.dart';
import 'package:meetx/constants/textstyle.dart';
import 'package:meetx/screens/auth/login_with_phone/controller/i_am_screen_controller.dart';
import 'package:meetx/screens/auth/login_with_phone/my_orientation_screen.dart';
import 'package:meetx/utiles/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class IAmScreen extends StatelessWidget {
  final IAmController iAmController = Get.put(IAmController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConst.white,
      body: Column(
        children: [
          AppBarDesign(),
          Text(
            "I am a",
            style: TextStyleClass.interBold(
              size: 28.0,
            ),
          ),
          SizedBox(
            height: 33,
          ),
          options(),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Obx(
                () => Checkbox(
                  value: iAmController.monVal.value,
                  onChanged: (val) {
                    iAmController.monVal.value = val!;
                  },
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(4.0),
                  ),
                  activeColor: ColorConst.appColorFF,
                  // fillColor: ColorConst.appColorFF,
                ),
              ),
              Text(
                "Show my gender on my profile",
                style: TextStyleClass.interRegular(
                  color: ColorConst.grey69,
                ),
              ),
            ],
          ),
          SizedBox(
            height: 164,
          ),
          CommonButton(
            onTap: () {
              Get.to(() => MyOrientationScreen());
            },
            title: "Continue",
          ),
        ],
      ),
    );
  }


}
Widget options() {
  return GetBuilder<IAmController>(
    init: IAmController(),
    builder: (controller) => ListView.builder(
      itemCount: 3,
      padding: EdgeInsets.zero,
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) => InkWell(
        onTap: () {
          controller.selectedItem(index);
        },
        child: Container(
          height: 50,
          width: Get.width,
          padding: EdgeInsets.only(
            right: 20,
            left: 20,
          ),
          margin: EdgeInsets.only(left: 24, right: 24, bottom: 22),
          decoration: BoxDecoration(
            color: controller.selectedIndex == index
                ? ColorConst.appColorFF
                : ColorConst.white,
            borderRadius: BorderRadius.circular(40.0),
            border: Border.all(
              width: 1,
              color: ColorConst.greyEB,
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                controller.title[index],
                style: TextStyleClass.interRegular(
                  color: controller.selectedIndex == index
                      ? ColorConst.white
                      : ColorConst.black09,
                  size: 16.0,
                ),
              ),
              SvgPicture.asset(
                ImageConst.checkIcon,
                color: controller.selectedIndex == index
                    ? ColorConst.white
                    : ColorConst.greyAD,
              ),
            ],
          ),
        ),
      ),
    ),
  );
}