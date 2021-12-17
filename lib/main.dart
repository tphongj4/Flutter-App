import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:market_online_app/auth/sign_in.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:market_online_app/config/colors.dart';
import 'package:market_online_app/providers/product_provider.dart';
import 'package:market_online_app/providers/user_provider.dart';
import 'package:market_online_app/screens_app/home_page/home_screen.dart';
import 'package:provider/provider.dart';
import 'package:market_online_app/providers/review_cart_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<ProductProvider>(
          create: (context) => ProductProvider(),
        ),
        ChangeNotifierProvider<UserProvider>(
          create: (context) => UserProvider(),
        ),
        ChangeNotifierProvider<ReviewCartProvider>(
          create: (context) => ReviewCartProvider(),
        ),

      ],
      child: MaterialApp(
        theme: ThemeData(scaffoldBackgroundColor: scaffoldBackgroundColor),
        debugShowCheckedModeBanner: false,
        home: StreamBuilder(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, snapShot) {
            if (snapShot.hasData) {
              return HomeScreen();
            }
            return SignIn();
          },
        ),
      ),
    );
  }
}
