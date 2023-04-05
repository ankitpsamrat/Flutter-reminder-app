import 'package:desktop_application/pages/profile.dart';
import 'package:desktop_application/utils/service/navigation.dart';
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
      navigatorKey: NavigationService.navigatorKey,
      debugShowCheckedModeBanner: false,
      home: UserProfile(),
    );
  }
}
