// PATCH: navigate to the unified bottom navigation
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meetx/screens/bottomScreen/home/bottomNavigation/bottom_navigation_screen.dart';

class EnableLocationScreen extends StatelessWidget {
  const EnableLocationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Enable location')),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            // Go to main tabs after enabling location
            Get.to(() => const BottomNavigationScreen());
          },
          child: const Text('Continue'),
        ),
      ),
    );
  }
}
