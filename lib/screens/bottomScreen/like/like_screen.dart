import 'package:flutter/material.dart';

class LikeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Likes ❤️"),
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          "Aici vezi cine ți-a dat Like 👍",
          style: TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}
