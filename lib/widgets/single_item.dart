import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:market_online_app/config/colors.dart';
import 'package:market_online_app/providers/review_cart_provider.dart';
import 'package:market_online_app/widgets/count.dart';
import 'package:provider/provider.dart';

class SingleItem extends StatefulWidget {
  bool isBool = false;
  String productImage;
  String productName;
  int productPrice;
  String productId;
  Function onDelete;
  int productQuantity;
  bool wishList = false;
  var productUnit;

  SingleItem(
      {this.productQuantity,
      this.productId,
      this.isBool,
      this.productName,
      this.productImage,
      this.productPrice,
      this.onDelete,
      this.wishList,
      this.productUnit,
      });

  @override
  _SingleItemState createState() => _SingleItemState();
}

class _SingleItemState extends State<SingleItem> {
  ReviewCartProvider reviewCartProvider;

  int count;
  getCount() {
    setState(() {
      count = widget.productQuantity;
    });
  }

  @override
  Widget build(BuildContext context) {
    getCount();
    // print("----------------------------------------$count");
    // print("Kiểm tra số lượng giỏ hàng --------------${widget.productQuantity}");
    reviewCartProvider = Provider.of<ReviewCartProvider>(context);
    reviewCartProvider.getReviewCartData();
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
                    child: Image.network(widget.productImage),
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  height: 100,
                  child: Column(
                    mainAxisAlignment: widget.isBool == false
                        ? MainAxisAlignment.spaceAround
                        : MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              widget.productName,
                              style: TextStyle(
                                  color: textColor, fontWeight: FontWeight.bold),
                            ),
                            Text(
                              "${widget.productPrice}/VND",
                              style: TextStyle(
                                  color: Colors.grey,
                                  fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                      ),
                      widget.isBool == false
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
                                  border: Border.all(color: Colors.green),
                                ),
                                child: Row(
                                  children: [
                                    Expanded(
                                      child: Text(
                                        "500 Gram",
                                        style: TextStyle(
                                            color: Colors.green, fontSize: 14),
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
                          : Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(widget.productUnit),
                          )
                    ],
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  height: 100,
                  padding: widget.isBool == false
                      ? EdgeInsets.symmetric(horizontal: 15, vertical: 32)
                      : EdgeInsets.only(left: 15, right: 15),
                  child: widget.isBool == false
                      ? Count(
                          productId: widget.productId,
                          productImage: widget.productImage,
                          productName: widget.productName,
                          productPrice: widget.productPrice,
                        )
                      : Padding(
                          padding: const EdgeInsets.only(top: 15),
                          child: Column(
                            children: [
                              InkWell(
                                  onTap: widget.onDelete,
                                  child: Icon(
                                    Icons.delete,
                                    size: 30,
                                    color: Colors.black,
                                  )),
                              SizedBox(
                                height: 5,
                              ),
                              widget.wishList == false
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
                                            InkWell(
                                              onTap: () {
                                                if (count == 1) {
                                                  Fluttertoast.showToast(
                                                      msg:
                                                          "Đã đạt đến giới hạn tối thiểu");
                                                } else {
                                                  setState(() {
                                                    count--;
                                                  });
                                                  reviewCartProvider
                                                      .updateReviewCartData(
                                                          cartImage: widget
                                                              .productImage,
                                                          cartQuantity: count,
                                                          cartPrice: widget
                                                              .productPrice,
                                                          cartName: widget
                                                              .productName,
                                                          cartId:
                                                              widget.productId);
                                                }
                                              },
                                              child: Icon(
                                                Icons.remove,
                                                color: Colors.green,
                                                size: 20,
                                              ),
                                            ),
                                            Text(
                                              "$count",
                                              style: TextStyle(
                                                color: Colors.grey,
                                                fontSize: 14,
                                              ),
                                            ),
                                            InkWell(
                                              onTap: () {
                                                if (count < 10) {
                                                  setState(() {
                                                    count++;
                                                  });
                                                  reviewCartProvider
                                                      .updateReviewCartData(
                                                          cartImage: widget
                                                              .productImage,
                                                          cartQuantity: count,
                                                          cartPrice: widget
                                                              .productPrice,
                                                          cartName: widget
                                                              .productName,
                                                          cartId:
                                                              widget.productId,

                                                  );
                                                }
                                              },
                                              child: Icon(
                                                Icons.add,
                                                color: Colors.green,
                                                size: 20,
                                              ),
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
        widget.isBool == false
            ? Container()
            : Divider(
                height: 2,
                color: Colors.green[900],
              )
      ],
    );
  }
}
