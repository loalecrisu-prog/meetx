import 'package:get/get.dart';
import 'package:flutter/material.dart';

class SettingController extends GetxController {
  /// Pentru slider-ul "Maximum Distance"
  var currentSliderValue = 50.0.obs;

  /// Pentru range-ul de vârstă
  var currentRangeValues = const RangeValues(18, 32).obs;

  /// Switch-uri pentru diferite setări
  var on1 = false.obs;
  var on2 = false.obs;
  var on3 = false.obs;
  var on4 = false.obs;
}
