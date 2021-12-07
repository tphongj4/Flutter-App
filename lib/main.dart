import 'package:flutter/material.dart';
import 'package:market_online_app/auth/sign_in.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:market_online_app/screens_app/home_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SignIn(),
    );
  }
}
