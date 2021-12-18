import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:market_online_app/models/review_cart_model.dart';

class ReviewCartProvider with ChangeNotifier {
  void addReviewCartData({
    String cartId,
    String cartName,
    int cartPrice,
    String cartImage,
    int cartQuantity,
    var cartUnit,
  }) async {
    await FirebaseFirestore.instance
        .collection("ReviewCart")
        .doc(FirebaseAuth.instance.currentUser.uid)
        .collection("YourReviewCart")
        .doc(cartId)
        .set(
      {
        "cartId": cartId,
        "cartName": cartName,
        "cartImage": cartImage,
        "cartPrice": cartPrice,
        "cartQuantity": cartQuantity,
        "cartUnit": cartUnit,
        "isAdd": true,
      },
    );
  }



  void updateReviewCartData({
    String cartId,
    String cartName,
    int cartPrice,
    String cartImage,
    int cartQuantity,
  }) async {
    await FirebaseFirestore.instance
        .collection("ReviewCart")
        .doc(FirebaseAuth.instance.currentUser.uid)
        .collection("YourReviewCart")
        .doc(cartId)
        .update(
      {
        "cartId": cartId,
        "cartName": cartName,
        "cartImage": cartImage,
        "cartPrice": cartPrice,
        "cartQuantity": cartQuantity,
        "isAdd": true,
      },
    );
  }











  // =================================================== Thiện - GET REVIEW DATA
  List<ReviewCartModel> reviewCartDataList = [];
  void getReviewCartData() async {
    List<ReviewCartModel> newList = [];

    QuerySnapshot reviewCartValue = await FirebaseFirestore.instance
        .collection("ReviewCart")
        .doc(FirebaseAuth.instance.currentUser.uid)
        .collection("YourReviewCart")
        .get();
    reviewCartValue.docs.forEach((element) {
      ReviewCartModel reviewCartModel = ReviewCartModel(
        cartId: element.get("cartId"),
        cartImage: element.get("cartImage"),
        cartName: element.get("cartName"),
        cartPrice: element.get("cartPrice"),
        cartQuantity: element.get("cartQuantity"),
        cartUnit: element.get("cartUnit"),

      );
      newList.add(reviewCartModel);
    });
    reviewCartDataList = newList;
    notifyListeners();
  }

  List<ReviewCartModel> get getReviewCartDataList {
    return reviewCartDataList;
  }
// Hết phần thêm dữ liệu vào giỏ hàng của Thiện

// ================================================PHẦN CỦA HUẾu - DELETEREVIEWCAR

  reviewCartDataDelete(cartId) {
    FirebaseFirestore.instance
        .collection("ReviewCart")
        .doc(FirebaseAuth.instance.currentUser.uid)
        .collection("YourReviewCart")
        .doc(cartId)
        .delete();
    notifyListeners();
  }
}
