import 'package:meetx/constants/color.dart';
import 'package:meetx/constants/textstyle.dart';
import 'package:meetx/screens/auth/login_with_phone/controller/your_interests_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class GridItem extends StatefulWidget {
  final InterestsInfo? item;
  final ValueChanged<bool>? isSelected;
  final int? selectedLength;

  GridItem({
    this.item,
    this.isSelected,
    this.selectedLength,
  });

  @override
  _GridItemState createState() => _GridItemState();
}

class _GridItemState extends State<GridItem> {
  bool isSelected = false;
  final YourInterestsController yourInterestsController = Get.find();

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        setState(() {
          isSelected = !isSelected;
          widget.isSelected!(isSelected);
        });
        /*if (yourInterestsController.selectedList.length == 5) {
          log("LOG LOG LOG ");
          setState(() {
            // isSelected = !isSelected;
            // widget.isSelected!(isSelected);
          });
        } else {

        }*/
      },
      child: Container(
        width: Get.width / 2,
        padding: EdgeInsets.only(left: 16),
        decoration: BoxDecoration(
          color: isSelected ? ColorConst.appColorFF : ColorConst.white,
          borderRadius: BorderRadius.circular(40.0),
          border: Border.all(
            color: isSelected ? ColorConst.appColorFF : ColorConst.greyEB,
          ),
        ),
        child: Row(
          children: [
            SvgPicture.asset(
              widget.item!.image.toString(),
              color: isSelected ? ColorConst.white : ColorConst.appColorFF,
            ),
            SizedBox(
              width: 9,
            ),
            Text(
              widget.item!.title.toString(),
              style: TextStyleClass.interSemiBold(
                color: isSelected ? ColorConst.white : ColorConst.black09,
                size: 14.0,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
