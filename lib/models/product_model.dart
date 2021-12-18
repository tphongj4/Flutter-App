import 'package:flutter/material.dart';

class ProductModel {
  String productName;
  String productImage;
  int productPrice;
  String productId;
  int productQuantity;
  List<dynamic> productUnit;

  ProductModel({
    this.productId,
    this.productName,
    this.productImage,
    this.productPrice,
    this.productQuantity,
    this.productUnit
  });
}
