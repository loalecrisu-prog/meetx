import 'package:flutter/material.dart';
import 'package:meetx/screens/main_bottom_nav.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MeetXApp());
}

class MeetXApp extends StatelessWidget {
  const MeetXApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'MeetX',
      theme: ThemeData(useMaterial3: true),
      home: MainBottomNav(),
    );
  }
}
