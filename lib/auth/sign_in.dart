import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_signin_button/button_view.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:google_sign_in/google_sign_in.dart';

// Tạo trang Login Page Market Online
// Coder: Hien.HD - 04-12-2021

class SignIn extends StatefulWidget {
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  // UserProvider userProvider;
  Future<void> _googleSignUp() async {
    try {
      final GoogleSignIn _googleSignIn = GoogleSignIn(
        scopes: ['email'],
      );
      final FirebaseAuth _auth = FirebaseAuth.instance;

      final GoogleSignInAccount googleUser = await _googleSignIn.signIn();
      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;

      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      final User user = (await _auth.signInWithCredential(credential)).user;
      print("signed in " + user.displayName);
      // userProvider.addUserData(
      //   currentUser: user,
      //   userEmail: user.email,
      //   userImage: user.photoURL,
      //   userName: user.displayName,
      // );
      return user;
    } catch (e) {
      print(e.message);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage('images/background.png'),
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 400,
              width: double.infinity,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text("Sign in to continue"),
                  Text(
                    "Market Online App",
                    style: TextStyle(
                        fontSize: 40,
                        color: Colors.white,
                        shadows: [
                          BoxShadow(
                              blurRadius: 5,
                              color: Colors.green.shade900,
                              offset: Offset(3, 3))
                        ]),
                  ),
                  Column(
                    children: [
                      SignInButton(
                        Buttons.Apple,
                        text: "Sign up with Apple",
                        onPressed: () {},
                      ),
                      SignInButton(
                        Buttons.Google,
                        text: "Sign up with Google",
                        onPressed: () {},
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Text(
                        "By signing in you are agreeing to you",
                        style: TextStyle(color: Colors.grey[800]),
                      ),
                      Text(
                        "Terms and Privacy Policy",
                        style: TextStyle(color: Colors.grey[800]),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
