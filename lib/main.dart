import 'package:desktop_application/helpers/navigation.dart';
import 'package:desktop_application/src/auth/screens/login_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Reminder App',
      navigatorKey: Navigation.navigatorKey,
      debugShowCheckedModeBanner: false,
      home: const LoginScreen(),
    );
  }
}
