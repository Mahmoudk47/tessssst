import 'package:flutter/material.dart';
import 'auth/auth_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Task Reward App',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const AuthScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
