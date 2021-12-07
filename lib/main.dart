import 'package:flutter/material.dart';
import 'package:market_online_app/auth/sign_in.dart';
import 'package:market_online_app/screens_app/home_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}

