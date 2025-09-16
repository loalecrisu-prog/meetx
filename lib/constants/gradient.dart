import 'package:flutter/material.dart';
import 'color.dart';

class AppGradients {
  /// App-wide background gradient (blue)
  static const LinearGradient appBackground = LinearGradient(
    colors: [ColorConst.gradStart, ColorConst.gradEnd],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  /// Subtle header fade
  static const LinearGradient headerFade = LinearGradient(
    colors: [Color(0x00000000), Color(0x22000000)],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  );
}
