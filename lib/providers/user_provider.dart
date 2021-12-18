import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:market_online_app/models/user_model.dart';

class UserProvider with ChangeNotifier {
  void addUserData(
      {User currentUser,
      String userName,
      String userEmail,
      String userImage}) async {
    await FirebaseFirestore.instance
        .collection("userDataLogin")
        .doc(currentUser.uid)
        .set(
      {
        "userName": userName,
        "userEmail": userEmail,
        "userImage": userImage,
        "userUid": currentUser.uid,
      },
    );
  }

  // ========================================== LẤY USER ĐĂNG NHẬP VỀ DRAWER - THÁI PHONG
  UserModel currentData;
  void getUserData() async {
    UserModel userModel;
    var value = await FirebaseFirestore.instance
        .collection("userDataLogin")
        .doc(FirebaseAuth.instance.currentUser.uid)
        .get();
    if (value.exists) {
      userModel = UserModel(
        userName: value.get("userName"),
        userImage: value.get("userImage"),
        userEmail: value.get("userEmail"),
        userUid: value.get("userUid"),
      );
      currentData = userModel;
      notifyListeners();
    }
  }

  UserModel get currentUserData {
    return currentData;
  }
}
