import 'package:flutter/material.dart';
import 'package:market_online_app/config/colors.dart';
import 'package:market_online_app/models/product_model.dart';
import 'package:market_online_app/providers/wish_list_provider.dart';
import 'package:market_online_app/widgets/single_item.dart';
import 'package:provider/provider.dart';
import 'package:market_online_app/models/review_cart_model.dart';
import 'package:market_online_app/providers/review_cart_provider.dart';

class WishList extends StatefulWidget {
  @override
  State<WishList> createState() => _WishListState();
}

class _WishListState extends State<WishList> {
  WishListProvider wishListProvider;
  // Alert hiển thị để xác nhận xoá
  showAlertDialog(BuildContext context, ProductModel delete) {
    // Tạo các button
    Widget cancelButton = TextButton(
      child: Text("Thoát"),
      onPressed: () {
        Navigator.of(context).pop();
      },
    );
    Widget continueButton = TextButton(
      child: Text("Tiếp tục xoá"),
      onPressed: () {
        wishListProvider.deleteWishList(delete.productId);
        Navigator.of(context).pop();
      },
    );

    // Tạo AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text("Xoá nhu yếu phẩm yêu thích"),
      content: Text("Bạn chắc chắn xoá nhu yếu phẩm yêu thích không?"),
      actions: [
        cancelButton,
        continueButton,
      ],
    );

    // Hiển thị Dialog lên
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
  @override
  Widget build(BuildContext context) {
    wishListProvider = Provider.of(context);
    wishListProvider.getWishListData();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text(
          "Nhu yếu phẩm yêu thích của bạn",
          style: TextStyle(color: Colors.white, fontSize: 18),
        ),
      ),
      body: ListView.builder(
        itemCount: wishListProvider.getWishList.length,
        itemBuilder: (context, index) {
          ProductModel data =
          wishListProvider.getWishList[index];
          return Column(
            children: [
              SizedBox(
                height: 10,
              ),
              SingleItem(
                isBool: true,
                productImage: data.productImage,
                productName: data.productName,
                productPrice: data.productPrice,
                productId: data.productId,
                productQuantity: data.productQuantity,
                productUnit: "500 Gram",
                onDelete: () {
                  showAlertDialog(context, data);
                },
              ),
            ],
          );
        },
      ),
    );
  }
}
