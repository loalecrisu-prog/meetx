import 'package:flutter/material.dart';
import 'package:meetx/screens/main_bottom_nav.dart';

/// Compatibility wrapper:
/// Old code may navigate to BottomNavigationScreen().
/// We forward to the new MainBottomNav() to keep existing references working.
class BottomNavigationScreen extends StatelessWidget {
  const BottomNavigationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MainBottomNav();
  }
}
