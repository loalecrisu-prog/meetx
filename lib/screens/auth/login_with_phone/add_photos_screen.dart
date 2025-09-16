import 'package:meetx/constants/color.dart';
import 'package:meetx/constants/image.dart';
import 'package:meetx/constants/textstyle.dart';
import 'package:meetx/screens/auth/login_with_phone/controller/add_photos_controller.dart';
import 'package:meetx/screens/auth/login_with_phone/enable_location_screen.dart';
import 'package:meetx/utiles/widgets/widgets.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddPhotosScreen extends StatelessWidget {
  final AddPhotosController addPhotosController =
      Get.put(AddPhotosController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConst.white,
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Column(
            children: [
              AppBarDesign(),
              Text(
                "Add Photos",
                style: TextStyleClass.interBold(
                  size: 28.0,
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                "Add at least 2 photos to continue",
                textAlign: TextAlign.center,
                style: TextStyleClass.interRegular(
                  size: 16.0,
                  color: ColorConst.grey69,
                ),
              ),
              SizedBox(
                height: 47,
              ),
              selectionPictures(),
            ],
          ),
          Container(
            height: 111,
            width: Get.width,
            padding: EdgeInsets.only(top: 16, bottom: 40, left: 24, right: 24),
            decoration: BoxDecoration(
              color: ColorConst.white,
              border: Border.all(
                color: ColorConst.greyEB,
                width: 1,
              ),
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(24),
                topLeft: Radius.circular(24),
              ),
            ),
            child: Obx(
              () => addPhotosController.selected.isFalse
                  ? CommonButton(
                      onTap: () {},
                      colors: [
                        ColorConst.appColor.withOpacity(0.6),
                        ColorConst.appColorFD.withOpacity(0.6),
                      ],
                      title: "Continue",
                    )
                  : CommonButton(
                      onTap: () {
                        Get.to(() => EnableLocationScreen());
                      },
                      title: "Continue",
                    ),
            ),
          ),
        ],
      ),
    );
  }

  Widget selectionPictures() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: GridView.builder(
        padding: EdgeInsets.zero,
        shrinkWrap: true,
        itemCount: 6,
        physics: NeverScrollableScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            childAspectRatio: 2 / 2.5,
            crossAxisSpacing: 11,
            mainAxisSpacing: 9),
        itemBuilder: (context, index) {
          /* Obx(
                () =>
                    : Container(),
              ),*/
          return Obx(
            () => (addPhotosController.selected.isTrue &&
                    (index == 0 || index == 1))
                ? Container(
                    height: 142,
                    width: Get.width,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12.0),
                      image: DecorationImage(
                        image: AssetImage(
                          index == 0 ? ImageConst.men1 : ImageConst.men2,
                        ),
                        fit: BoxFit.fill,
                      ),
                    ),
                    child: Align(
                      alignment: Alignment.topRight,
                      child: Container(
                        height: 25,
                        width: 25,
                        margin: EdgeInsets.only(right: 5, top: 5),
                        decoration: BoxDecoration(
                          color: Colors.black45,
                          shape: BoxShape.circle,
                        ),
                        child: Icon(
                          Icons.cancel_outlined,
                          color: ColorConst.appColorFF,
                        ),
                      ),
                    ),
                  )
                : DottedBorder(
                    padding: EdgeInsets.zero,
                    borderType: BorderType.RRect,
                    color: ColorConst.appColorFF,
                    radius: Radius.circular(12),
                    child: ClipRRect(
                      borderRadius: BorderRadius.all(
                        Radius.circular(12),
                      ),
                      child: Container(
                        height: 142,
                        width: Get.width,
                        color: ColorConst.appColorFD.withOpacity(0.2),
                        child: Padding(
                          padding: const EdgeInsets.all(34),
                          child: FloatingActionButton(
                            heroTag: "text${index}",
                            backgroundColor: ColorConst.appColorFD,
                            elevation: 0.0,
                            onPressed: () {
                              addPhotosController.selected.value =
                                  !addPhotosController.selected.value;
                            },
                            child: Icon(
                              Icons.add,
                              color: ColorConst.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
          );
        },
      ),
    );
  }
}
