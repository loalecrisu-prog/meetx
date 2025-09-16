import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meetx/constants/color.dart';
import 'package:meetx/constants/image.dart';
import 'package:meetx/constants/textstyle.dart';
import 'package:meetx/screens/bottomScreen/payment/pay_card_screen.dart';
import 'package:meetx/screens/bottomScreen/payment/utiles/payment_utiles.dart';
import 'package:meetx/utiles/widgets/widgets.dart';

class PayVaiGooglePayScreen extends StatelessWidget {
   PayVaiGooglePayScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorConst.white,
        elevation: 0,
        leading: IconButton(
          onPressed: () => Get.back(),
          icon: Icon(Icons.arrow_back, color: ColorConst.appColorFF),
        ),
        centerTitle: true,
        title: Text(
          "Payment Method",
          style: TextStyleClass.interSemiBold(
            size: 20.0,
            color: ColorConst.black09,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 60),
            Image.asset(
              ImageConst.banner,
              height: 150,
            ),
            const SizedBox(height: 40),
            DotWidget(
              dashColor: Colors.black.withOpacity(0.16),
              totalWidth: Get.width,
              dashHeight: 1,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 12),
              child: commonRow(
                title: "Tinder Gold 6 months:",
                subTitle: "\$5",
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 12),
              child: commonRow(
                title: "Total:",
                subTitle: "\$5",
                color: ColorConst.appColorFF,
              ),
            ),
            DotWidget(
              dashColor: Colors.black.withOpacity(0.16),
              totalWidth: Get.width,
              dashHeight: 1,
            ),
            const SizedBox(height: 20),
            Divider(),
            Padding(
              padding: const EdgeInsets.all(12),
              child: Text(
                "By tapping buy now you agree to our Terms.",
                textAlign: TextAlign.center,
                style: TextStyleClass.interRegular(
                  size: 12.0,
                  color: ColorConst.grey69,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: CommonButton(
                title: "Buy Now",
                width: Get.width,
                onTap: () {
                  Get.defaultDialog(
                    title: "",
                    content: Column(
                      children: [
                        Align(
                          alignment: Alignment.centerRight,
                          child: IconButton(
                            onPressed: () => Get.back(),
                            icon: const Icon(Icons.close),
                          ),
                        ),
                        Image.asset(ImageConst.success, height: 120),
                        Text(
                          "Success",
                          style: TextStyleClass.interBold(
                            size: 28.0,
                            color: ColorConst.black09,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          "Your Plan Activated Successfully",
                          style: TextStyleClass.interRegular(
                            size: 16.0,
                            color: ColorConst.black09,
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 12),
            InkWell(
              onTap: () => Get.to(() => PaymentVaiCardScreen()),
              child: Padding(
                padding: const EdgeInsets.only(bottom: 30, top: 12),
                child: Text(
                  "Buy with Credit or Debit Card instead",
                  textAlign: TextAlign.center,
                  style: TextStyleClass.interSemiBold(
                    size: 16.0,
                    color: ColorConst.appColorFF,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
