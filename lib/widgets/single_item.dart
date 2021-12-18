import 'package:flutter/material.dart';
import 'package:market_online_app/config/colors.dart';
import 'package:market_online_app/widgets/count.dart';

class SingleItem extends StatelessWidget {
  bool isBool = false;
  String productImage;
  String productName;
  int productPrice;
  String productId;
  Function onDelete;
  int productQuantity;
  bool wishList = false;
  SingleItem(
      {this.productQuantity,
      this.productId,
      this.isBool,
      this.productName,
      this.productImage,
      this.productPrice,
      this.onDelete,
      this.wishList});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          child: Row(
            children: [
              Expanded(
                child: Container(
                  height: 100,
                  child: Center(
                    child: Image.network(productImage),
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  height: 100,
                  child: Column(
                    mainAxisAlignment: isBool == false
                        ? MainAxisAlignment.spaceAround
                        : MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        children: [
                          Text(
                            productName,
                            style: TextStyle(
                                color: textColor, fontWeight: FontWeight.bold),
                          ),
                          Text(
                            "$productPrice/VND 1kg",
                            style: TextStyle(
                                color: Colors.grey,
                                fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                      isBool == false
                          ? GestureDetector(
                              onTap: () {
                                showModalBottomSheet(
                                    context: context,
                                    builder: (context) {
                                      return Column(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          ListTile(
                                            leading: new Icon(Icons.photo),
                                            title: new Text('500 Gram'),
                                            onTap: () {
                                              Navigator.pop(context);
                                            },
                                          ),
                                          ListTile(
                                            leading: new Icon(Icons.photo),
                                            title: new Text('1kg'),
                                            onTap: () {
                                              Navigator.pop(context);
                                            },
                                          ),
                                          ListTile(
                                            leading: new Icon(Icons.photo),
                                            title: new Text('2kg'),
                                            onTap: () {
                                              Navigator.pop(context);
                                            },
                                          )
                                        ],
                                      );
                                    });
                              },
                              child: Container(
                                margin: EdgeInsets.only(right: 15),
                                padding: EdgeInsets.symmetric(horizontal: 10),
                                height: 35,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(30),
                                  border: Border.all(color: Colors.grey),
                                ),
                                child: Row(
                                  children: [
                                    Expanded(
                                      child: Text(
                                        "50k/1kg",
                                        style: TextStyle(
                                            color: Colors.grey, fontSize: 14),
                                      ),
                                    ),
                                    Center(
                                      child: Icon(
                                        Icons.arrow_drop_down,
                                        size: 20,
                                        color: Colors.green,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            )
                          : Text("1kg")
                    ],
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  height: 100,
                  padding: isBool == false
                      ? EdgeInsets.symmetric(horizontal: 15, vertical: 32)
                      : EdgeInsets.only(left: 15, right: 15),
                  child: isBool == false
                      ? Count(
                          productId: productId,
                          productImage: productImage,
                          productName: productName,
                          productPrice: productPrice,
                        )
                      : Padding(
                          padding: const EdgeInsets.only(top: 15),
                          child: Column(
                            children: [
                              InkWell(
                                  onTap: onDelete,
                                  child: Icon(
                                    Icons.delete,
                                    size: 30,
                                    color: Colors.black,
                                  )),
                              SizedBox(
                                height: 5,
                              ),
                              wishList == false
                                  ? Container(
                                      height: 25,
                                      width: 70,
                                      decoration: BoxDecoration(
                                          border:
                                              Border.all(color: Colors.grey),
                                          borderRadius:
                                              BorderRadius.circular(30)),
                                      child: Center(
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Icon(
                                              Icons.remove,
                                              color: Colors.green,
                                              size: 20,
                                            ),
                                            Text(
                                              "1",
                                              style: TextStyle(
                                                color: Colors.grey,
                                                fontSize: 14,
                                              ),
                                            ),
                                            Icon(
                                              Icons.add,
                                              color: Colors.green,
                                              size: 20,
                                            ),
                                          ],
                                        ),
                                      ),
                                    )
                                  : Container(),
                            ],
                          ),
                        ),
                ),
              ),
            ],
          ),
        ),
        isBool == false
            ? Container()
            : Divider(
                height: 2,
                color: Colors.green[900],
              )
      ],
    );
  }
}
