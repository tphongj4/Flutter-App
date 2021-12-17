import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:market_online_app/config/colors.dart';
import 'package:market_online_app/providers/wish_list_provider.dart';
import 'package:provider/provider.dart';

enum SigninCharacter { fill, outline }

class ProductOverview extends StatefulWidget {
  final String productName;
  final String productImage;
  final int productPrice;
  final String productId;

  ProductOverview(
      {this.productImage, this.productName, this.productPrice, this.productId});

  @override
  _ProductOverviewState createState() => _ProductOverviewState();
}

class _ProductOverviewState extends State<ProductOverview> {
  SigninCharacter _character = SigninCharacter.fill;

  Widget buttonNavigatorBar({
    Color iconColor,
    Color backgroundColor,
    Color color,
    String tittle,
    IconData iconData,
    Function onTap,
  }) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          padding: EdgeInsets.all(20),
          color: backgroundColor,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                iconData,
                size: 20,
                color: iconColor,
              ),
              SizedBox(
                width: 5,
              ),
              Text(
                tittle,
                style: TextStyle(color: color),
              )
            ],
          ),
        ),
      ),
    );
  }

  bool wishListBool = false;

  getWishLishBool() {
    FirebaseFirestore.instance
        .collection("WishList")
        .doc(FirebaseAuth.instance.currentUser.uid)
        .collection("YourWishList")
        .doc(widget.productId)
        .get()
        .then((value) => {
              if (this.mounted)
                {
                  setState(
                    () {
                      wishListBool = value.get("wishList");
                    },
                  ),
                }
            });
  }

  @override
  Widget build(BuildContext context) {
    WishListProvider wishListProvider = Provider.of(context);
    getWishLishBool();
    return Scaffold(
      bottomNavigationBar: Row(
        children: [
          buttonNavigatorBar(
              backgroundColor: Colors.red,
              color: Colors.white70,
              iconColor: Colors.grey,
              tittle: "Sản phẩm yêu thích",
              iconData: wishListBool == false
                  ? Icons.favorite_outline
                  : Icons.favorite,
              onTap: () {
                setState(() {
                  wishListBool = !wishListBool;
                });
                if (wishListBool == true) {
                  wishListProvider.addWishListCartData(
                      wishListId: widget.productId,
                      wishListImage: widget.productImage,
                      wishListName: widget.productName,
                      wishListPrice: widget.productPrice,
                      wishListQuantity: 2
                  );
                }else{
                  wishListProvider.deleteWishList(widget.productId);
                }
              }),
          buttonNavigatorBar(
            backgroundColor: Colors.green,
            color: Colors.white70,
            iconColor: Colors.white70,
            tittle: "Thêm giỏ hàng",
            iconData: Icons.shopping_cart_outlined,
          ),
        ],
      ),
      appBar: AppBar(
        backgroundColor: Colors.green,
        iconTheme: IconThemeData(color: Colors.white),
        title: Text(
          "Chi tiết nhu yếu phẩm",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            flex: 2,
            child: Container(
              width: double.infinity,
              child: Column(
                children: [
                  ListTile(
                    title: Text(widget.productName),
                    subtitle: Text("${widget.productPrice} VND/1kg"),
                  ),
                  Container(
                    height: 250,
                    padding: EdgeInsets.all(40),
                    child: Image.network(
                      widget.productImage ?? "",
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    width: double.infinity,
                    child: Text(
                      "Tuỳ chọn",
                      textAlign: TextAlign.start,
                      style: TextStyle(
                          color: textColor, fontWeight: FontWeight.w600),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 10,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            CircleAvatar(
                              radius: 3,
                              backgroundColor: Colors.green[700],
                            ),
                            Radio(
                              value: SigninCharacter.fill,
                              groupValue: _character,
                              activeColor: Colors.green[700],
                              onChanged: (value) {
                                setState(() {
                                  _character = value;
                                });
                              },
                            )
                          ],
                        ),
                        Text("${widget.productPrice} VND/1kg"),
                        Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: 30, vertical: 10),
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey),
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.add,
                                size: 17,
                                color: Colors.green,
                              ),
                              Text(
                                "Thêm",
                                style: TextStyle(color: Colors.green),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
          Expanded(
              child: Container(
            padding: EdgeInsets.all(20),
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Về nhu yếu phẩm",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "Cải ngọt có nguồn gốc từ Ấn Độ, Trung Quốc. Cây thảo, cao tới 50 - 100 cm, thân tròn, không lông, lá có phiến xoan ngược tròn dài, đầu tròn hay tù, gốc từ từ hẹp, mép nguyên không nhăn, mập, trắng trắng, gân bên 5 - 6 đôi, cuống dài, tròn.",
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
              ],
            ),
          ))
        ],
      ),
    );
  }
}
