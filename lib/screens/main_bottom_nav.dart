import 'package:flutter/material.dart';
import 'package:meetx/screens/bottomScreen/home/home_screen.dart';        // Discover
import 'package:meetx/screens/bottomScreen/swipe/swipe_screen.dart';       // Encounters
import 'package:meetx/screens/bottomScreen/like/like_screen.dart';         // Matches
import 'package:meetx/screens/bottomScreen/chat/chat_screen.dart';         // Chat
import 'package:meetx/screens/bottomScreen/profile/profile_screen.dart';   // Profile
import 'package:meetx/constants/color.dart';

class MainBottomNav extends StatefulWidget {
  MainBottomNav({super.key});

  @override
  _MainBottomNavState createState() => _MainBottomNavState();
}

class _MainBottomNavState extends State<MainBottomNav> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    HomeScreen(),        // Discover
    const SwipeScreen(), // Encounters
    LikeScreen(),        // Matches
    ChatScreen(),        // Chat
    ProfileScreen(),     // Profile
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _selectedIndex,
        selectedItemColor: ColorConst.appColorFF,
        unselectedItemColor: ColorConst.grey69,
        onTap: _onItemTapped,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.explore_outlined),
            label: 'Discover',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.flash_on_outlined),
            label: 'Encounters',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite_outline),
            label: 'Matches',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.chat_bubble_outline),
            label: 'Chat',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}
