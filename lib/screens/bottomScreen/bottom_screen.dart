import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meetx/constants/color.dart';
import 'package:meetx/screens/bottomScreen/discover/discover_screen.dart';
import 'package:meetx/screens/bottomScreen/meet/meet_screen.dart';
import 'package:meetx/screens/bottomScreen/like/like_screen.dart';
import 'package:meetx/screens/bottomScreen/chat/chat_screen.dart';
import 'package:meetx/screens/bottomScreen/profile/profile_screen.dart';

// Controller simplu pentru plată
class BottomNavController extends GetxController {
  var paidFeature = "".obs; // "" = nimic, "direct" = Direct Match, "boost" = Boost
  var selectedIndex = 0.obs;

  void setPaidFeature(String feature) {
    paidFeature.value = feature;
    selectedIndex.value = 0; // resetăm pe primul tab (cel plătit)
  }
}

class BottomScreen extends StatelessWidget {
  final BottomNavController controller = Get.put(BottomNavController());

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      // 🔹 construim lista de taburi dinamic în funcție de paidFeature
      List<Widget> screens;
      List<BottomNavigationBarItem> items;

      if (controller.paidFeature.value == "direct") {
        screens = [
          MeetScreen(),
          DiscoverScreen(),
          LikeScreen(),
          ChatScreen(),
          ProfileScreen(),
        ];
        items = [
          BottomNavigationBarItem(icon: Icon(Icons.flash_on), label: "Direct Match"),
          BottomNavigationBarItem(icon: Icon(Icons.explore), label: "Descoperiri"),
          BottomNavigationBarItem(icon: Icon(Icons.favorite), label: "Likes"),
          BottomNavigationBarItem(icon: Icon(Icons.chat), label: "Chat"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profil"),
        ];
      } else if (controller.paidFeature.value == "boost") {
        screens = [
          DiscoverScreen(), // Boost aplicat pe descoperiri
          MeetScreen(),
          LikeScreen(),
          ChatScreen(),
          ProfileScreen(),
        ];
        items = [
          BottomNavigationBarItem(icon: Icon(Icons.rocket_launch), label: "Boost"),
          BottomNavigationBarItem(icon: Icon(Icons.flash_on), label: "Întâlniri"),
          BottomNavigationBarItem(icon: Icon(Icons.favorite), label: "Likes"),
          BottomNavigationBarItem(icon: Icon(Icons.chat), label: "Chat"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profil"),
        ];
      } else {
        // Normal: Descoperiri e primul
        screens = [
          DiscoverScreen(),
          MeetScreen(),
          LikeScreen(),
          ChatScreen(),
          ProfileScreen(),
        ];
        items = [
          BottomNavigationBarItem(icon: Icon(Icons.explore), label: "Descoperiri"),
          BottomNavigationBarItem(icon: Icon(Icons.flash_on), label: "Întâlniri"),
          BottomNavigationBarItem(icon: Icon(Icons.favorite), label: "Likes"),
          BottomNavigationBarItem(icon: Icon(Icons.chat), label: "Chat"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profil"),
        ];
      }

      return Scaffold(
        body: screens[controller.selectedIndex.value],
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: controller.selectedIndex.value,
          onTap: (index) => controller.selectedIndex.value = index,
          selectedItemColor: ColorConst.appColorFF,
          unselectedItemColor: Colors.grey,
          items: items,
          type: BottomNavigationBarType.fixed,
        ),
      );
    });
  }
}
