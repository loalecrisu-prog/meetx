import 'package:flutter/material.dart';

class PhoneEditScreen extends StatelessWidget {
  const PhoneEditScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Edit Phone Number")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const TextField(
              decoration: InputDecoration(
                labelText: "Phone Number",
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.phone,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context); // închide ecranul
              },
              child: const Text("Save"),
            ),
          ],
        ),
      ),
    );
  }
}
