import 'package:flutter/material.dart';

class ChatScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Chat ❤️"),
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          "Conversațiile tale apar aici 💬",
          style: TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}
