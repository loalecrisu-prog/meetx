import 'package:flutter/material.dart';

/// Color constants aligned to the new MeetX BLUE theme.
/// Added missing keys used in code: `black`, `grey69`.
class ColorConst {
  // Brand / primary
  static const Color appColorFF = Color(0xFF2563EB); // MeetX blue
  static const Color appColor   = Color(0xFF2563EB);

  // Backgrounds
  static const Color bg         = Color(0xFFF2F6FF); // soft blue-tinted white
  static const Color scaffoldBG = Color(0xFFF2F6FF);

  // Text
  static const Color black      = Color(0xFF000000); // <-- missing key restored
  static const Color black09    = Color(0xFF090909);
  static const Color whiteFF    = Color(0xFFFFFFFF);
  static const Color grey66     = Color(0xFF666666);
  static const Color grey69     = Color(0xFF696969); // <-- missing key restored
  static const Color grey99     = Color(0xFF999999);

  // Accents
  static const Color accentBlue = Color(0xFF2563EB);
  static const Color heartRed   = Color(0xFFE11D48);

  // Cards / strokes
  static const Color card       = Color(0xFFFFFFFF);
  static const Color stroke     = Color(0xFFE6EAF5);

  
  // Aliases for legacy code (to avoid build errors)
  static const Color white      = Color(0xFFFFFFFF); // alias
  static const Color greyE8     = Color(0xFFE8E8E8); // alias used in some screens
  static const Color appColorFD = Color(0xFF2563EB); // alias to primary blue

  // Gradients (for backgrounds/headers)
  static const Color gradStart  = Color(0xFF3B82F6); // blue-500
  static const Color gradEnd    = Color(0xFF1E40AF); // blue-900
}
