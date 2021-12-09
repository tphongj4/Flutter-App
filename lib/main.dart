import 'package:flutter/material.dart';
import 'package:market_online_app/auth/sign_in.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:market_online_app/config/colors.dart';
import 'package:market_online_app/providers/product_provider.dart';
import 'package:market_online_app/screens_app/home_page/home_screen.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<ProductProvider>(
      create: (context)=> ProductProvider(),
      child: MaterialApp(
        theme: ThemeData(
          scaffoldBackgroundColor: scaffoldBackgroundColor
        ),
        debugShowCheckedModeBanner: false,
        home: HomeScreen(),
      ),
    );
  }
}
