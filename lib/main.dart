import 'package:desktop_application/pages/Profile.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Desktop Application',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Profile(),
    );
  }
}
