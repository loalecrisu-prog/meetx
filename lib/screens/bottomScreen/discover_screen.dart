import 'package:flutter/material.dart';

class DiscoverScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Descoperiri ❤️"),
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          "Aici descoperi persoane din zona ta 🌍",
          style: TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}
