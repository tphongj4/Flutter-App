import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:market_online_app/models/product_model.dart';

class WishListProvider with ChangeNotifier {
  void addWishListCartData({
    String wishListId,
    String wishListName,
    String wishListImage,
    int wishListPrice,
    int wishListQuantity,
  }) async {
    await FirebaseFirestore.instance
        .collection("WishList")
        .doc(FirebaseAuth.instance.currentUser.uid)
        .collection("YourWishList")
        .doc(wishListId)
        .set(
      {
        "wishListId": wishListId,
        "wishListName": wishListName,
        "wishListImage": wishListImage,
        "wishListPrice": wishListPrice,
        "wishListQuantity": wishListQuantity,
        "wishList": true,
      },
    );
  }

  // ==================================== Lấy dữ liệu danh sách nhu yếu phẩm yêu thích
  List<ProductModel> wishList = [];

  getWishListData() async {
    List<ProductModel> newList = [];
    QuerySnapshot value = await FirebaseFirestore.instance
        .collection("WishList")
        .doc(FirebaseAuth.instance.currentUser.uid)
        .collection("YourWishList")
        .get();
    value.docs.forEach(
      (element) {
        ProductModel productModel = ProductModel(
          productId: element.get("wishListId"),
          productName: element.get("wishListName"),
          productImage: element.get("wishListImage"),
          productPrice: element.get("wishListPrice"),
          productQuantity: element.get("wishListQuantity"),
        );
        newList.add(productModel);
      },
    );
    wishList = newList;
    notifyListeners();
  }

  List<ProductModel> get getWishList {
    return wishList;
  }

  // ========================= XOÁ DANH SÁCH NHU YẾU PHẨM YÊU THÍCH

  deleteWishList(wishListId) {
    FirebaseFirestore.instance
        .collection("WishList")
        .doc(FirebaseAuth.instance.currentUser.uid)
        .collection("YourWishList")
        .doc(wishListId)
        .delete();
  }
}
