import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meetx/constants/color.dart';
import 'package:meetx/constants/image.dart';
import 'package:meetx/constants/textstyle.dart';
import 'package:meetx/screens/bottomScreen/payment/controller/payment_controller.dart';
import 'package:meetx/screens/bottomScreen/payment/pay_google_screen.dart';
import 'package:meetx/screens/bottomScreen/payment/utiles/payment_utiles.dart';
import 'package:meetx/utiles/widgets/widgets.dart';

class PaymentVaiCardScreen extends StatelessWidget {
  PaymentVaiCardScreen({super.key});

  final PaymentController paymentController = Get.put(PaymentController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorConst.white,
        elevation: 0,
        title: Text(
          "Payment Method",
          style: TextStyleClass.interSemiBold(
            size: 20.0,
            color: ColorConst.black09,
          ),
        ),
        leading: IconButton(
          onPressed: () => Get.back(),
          icon: Icon(Icons.arrow_back, color: ColorConst.appColorFF),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextFromFieldCommon(hintText: "Card Number"),
            const SizedBox(height: 12),
            TextFromFieldCommon(hintText: "Cardholder Name"),
            const SizedBox(height: 12),
            Row(
              children: [
                Expanded(child: TextFromFieldCommon(hintText: "MM/YY")),
                const SizedBox(width: 12),
                Expanded(child: TextFromFieldCommon(hintText: "CVC")),
              ],
            ),
            const SizedBox(height: 12),
            TextFromFieldCommon(hintText: "ZIP Code"),
            const SizedBox(height: 12),
            TextFromFieldCommon(hintText: "Email Address"),
            Row(
              children: [
                Obx(
                  () => Checkbox(
                    value: paymentController.monVal.value,
                    onChanged: (val) =>
                        paymentController.monVal.value = val ?? false,
                    activeColor: ColorConst.appColorFF,
                  ),
                ),
                Expanded(
                  child: Text(
                    "Save this card for future purchases",
                    style: TextStyleClass.interRegular(color: ColorConst.grey69),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            CommonButton(
              onTap: () {
                Get.defaultDialog(
                  title: "",
                  titleStyle: const TextStyle(fontSize: 0),
                  content: Column(
                    children: [
                      Align(
                        alignment: Alignment.topRight,
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
                      Text(
                        "Your Plan Activated Successfully",
                        style: TextStyleClass.interRegular(
                          size: 16.0,
                          color: ColorConst.black09,
                        ),
                      ),
                    ],
                  ),
                  radius: 12,
                );
              },
              title: "Buy Now",
              width: Get.width,
            ),
            const SizedBox(height: 12),
            InkWell(
              onTap: () => Get.to(() =>  PayVaiGooglePayScreen()),
              child: Text(
                "Buy with Google Play instead",
                style: TextStyleClass.interSemiBold(
                  size: 16.0,
                  color: ColorConst.appColorFF,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
