import 'package:flutter/material.dart';
import 'package:meetx/screens/bottomScreen/home/bottomNavigation/bottom_navigation_screen.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Login Page 🚀")),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              decoration: InputDecoration(labelText: "Email"),
            ),
            SizedBox(height: 12),
            TextField(
              obscureText: true,
              decoration: InputDecoration(labelText: "Password"),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (_) => BottomNavigationScreen()),
                );
              },
              child: Text("Login"),
            ),
            SizedBox(height: 12),
            TextButton(
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (_) => BottomNavigationScreen()),
                );
              },
              child: Text("Skip for now"),
            ),
          ],
        ),
      ),
    );
  }
}

