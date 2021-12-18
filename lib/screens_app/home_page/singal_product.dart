import 'package:flutter/material.dart';
import 'package:market_online_app/config/colors.dart';
import 'package:market_online_app/widgets/count.dart';

class SingalProduct extends StatelessWidget {
  final String productImage;
  final String productName;
  final Function onTap;
  final int productPrice;
  final String productId;

  SingalProduct(
      {this.productId,
      this.productImage,
      this.productName,
      this.onTap,
      this.productPrice});
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          Container(
            margin: EdgeInsets.only(right: 10),
            height: 230,
            width: 180,
            decoration: BoxDecoration(
              color: Color(0xffd9dad9),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                GestureDetector(
                  onTap: onTap,
                  child: Container(
                    height: 150,
                    padding: EdgeInsets.all(5),
                    width: double.infinity,
                    child: Image.network(productImage),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          productName,
                          style: TextStyle(
                              color: Colors.black, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          '$productPrice VND/1kg',
                          style: TextStyle(
                              color: Colors.grey, fontWeight: FontWeight.bold),
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: InkWell(
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
                                  padding: EdgeInsets.only(left: 5),
                                  height: 30,
                                  width: 50,
                                  decoration: BoxDecoration(
                                    border: Border.all(color: Colors.green),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: Row(
                                    children: [
                                      Expanded(
                                          child: Text(
                                        '50 Gram',
                                        style: TextStyle(fontSize: 10),
                                      )),
                                      Center(
                                        child: Icon(Icons.arrow_drop_down,
                                            size: 20, color: Colors.green),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Count(
                              productId: productId,
                              productImage: productImage,
                              productName: productName,
                              productPrice: productPrice,
                            ),
                            // Expanded(
                            //   child: Container(
                            //     height: 30,
                            //     width: 50,
                            //     decoration: BoxDecoration(
                            //       border: Border.all(color: Colors.red),
                            //       borderRadius: BorderRadius.circular(8),
                            //     ),
                            //     child: Row(
                            //       mainAxisAlignment: MainAxisAlignment.center,
                            //       children: [
                            //         Icon(Icons.remove,
                            //             size: 15, color: Colors.red),
                            //         Text(
                            //           '1',
                            //           style: TextStyle(
                            //               color: Colors.red,
                            //               fontWeight: FontWeight.bold),
                            //         ),
                            //         Icon(Icons.add, size: 15, color: Colors.red)
                            //       ],
                            //     ),
                            //   ),
                            // )
                          ],
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
