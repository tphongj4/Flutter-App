// import 'package:flutter/material.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:market_online_app/models/product_model.dart';

class ProductProvider with ChangeNotifier {
  ProductModel productModel;



  productModels(QueryDocumentSnapshot element){
    productModel = ProductModel(
      productName: element.get("productName"),
      productImage: element.get("productImage"),
      productPrice: element.get("productPrice"),
    );
  }


  // Phần Provider lấy dữ liệu từ Firebase của Vegetable
  List<ProductModel> vegetableProductList = [];

  vegetableProductData() async {
    List<ProductModel> newList = [];
    QuerySnapshot value =
        await FirebaseFirestore.instance.collection("VegetableProduct").get();

    value.docs.forEach(
      (element) {
        // print(element.data());
        // productModel = ProductModel(
        //   productName: element.get("productName"),
        //   productImage: element.get("productImage"),
        //   productPrice: element.get("productPrice"),
        // );
        productModels(element);
        newList.add(productModel);
      },
    );
    vegetableProductList = newList;
    notifyListeners();
  }

  List<ProductModel>get getVegetableProductDataList{
    return vegetableProductList;
  }
//Hết Phần Provider lấy dữ liệu từ Firebase của Vegetable


// --------------------------------------------------------------------------------------------
  // Phần Provider lấy dữ liệu từ Firebase của Fruits - Trái cây

  List<ProductModel> fruitsProductList = [];

  fruitsProductData() async {
    List<ProductModel> newList = [];
    QuerySnapshot value =
    await FirebaseFirestore.instance.collection("FruitsProduct").get();

    value.docs.forEach(
          (element) {
        // print(element.data());
        // productModel = ProductModel(
        //   productName: element.get("productName"),
        //   productImage: element.get("productImage"),
        //   productPrice: element.get("productPrice"),
        // );
            productModels(element);
        newList.add(productModel);
      },
    );
    fruitsProductList = newList;
    notifyListeners();
  }

  List<ProductModel>get getFruitsProductDataList{
    return fruitsProductList;
  }

// Hết phần Provider lấy dữ liệu từ Firebase của Fruits - Trái cây

// -------------------------------------------------------------------------------------------

// Phần Provider lấy dữ liệu từ Firebase của Fish - Cá

  List<ProductModel> fishProductList = [];

  fishProductData() async {
    List<ProductModel> newList = [];
    QuerySnapshot value =
    await FirebaseFirestore.instance.collection("FishProduct").get();

    value.docs.forEach(
          (element) {
        // print(element.data());
        // productModel = ProductModel(
        //   productName: element.get("productName"),
        //   productImage: element.get("productImage"),
        //   productPrice: element.get("productPrice"),
        // );
            productModels(element);
        newList.add(productModel);
      },
    );
    fishProductList = newList;
    notifyListeners();
  }

  List<ProductModel>get getFishProductDataList{
    return fishProductList;
  }

  // Hết phần Provider lấy dữ liệu từ Firebase của Fish - Cá


// ---------------------------------------------------------------------------------------------


  // Phần Provider lấy dữ liệu từ Firebase của Meat - Thịt


  List<ProductModel> meatProductList = [];

  meatProductData() async {
    List<ProductModel> newList = [];
    QuerySnapshot value =
    await FirebaseFirestore.instance.collection("MeatProduct").get();

    value.docs.forEach(
          (element) {
        // print(element.data());
        // productModel = ProductModel(
        //   productName: element.get("productName"),
        //   productImage: element.get("productImage"),
        //   productPrice: element.get("productPrice"),
        // );

            productModels(element);
        newList.add(productModel);
      },
    );
    meatProductList = newList;
    notifyListeners();
  }

  List<ProductModel>get getMeatProductDataList{
    return meatProductList;
  }
 // Hết Phần Provider lấy dữ liệu từ Firebase của Meat - Thịt
// --------------------------------------------------------------------------------
}
