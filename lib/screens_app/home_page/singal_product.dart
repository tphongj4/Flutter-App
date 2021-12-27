import 'package:flutter/material.dart';
import 'package:market_online_app/config/colors.dart';
import 'package:market_online_app/config/colors.dart';
import 'package:market_online_app/models/product_model.dart';
import 'package:market_online_app/widgets/count.dart';
import 'package:market_online_app/widgets/product_unit.dart';

class SingalProduct extends StatefulWidget {
  final String productImage;
  final String productName;
  final Function onTap;
  final int productPrice;
  final String productId;
  final ProductModel productUnit;

  SingalProduct({
    this.productId,
    this.productImage,
    this.productName,
    this.onTap,
    this.productPrice,
    this.productUnit,
  });

  @override
  State<SingalProduct> createState() => _SingalProductState();
}

class _SingalProductState extends State<SingalProduct> {
  var unitData;
  var firstValue;
  @override
  Widget build(BuildContext context) {
    widget.productUnit.productUnit.firstWhere((element)  {
         setState(() {
           firstValue = element;
         });
         return true;
    });

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
                  onTap: widget.onTap,
                  child: Container(
                    height: 150,
                    padding: EdgeInsets.all(5),
                    width: double.infinity,
                    child: Image.network(widget.productImage),
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
                          widget.productName,
                          style: TextStyle(
                              color: Colors.black, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          '${widget.productPrice}\VND/${unitData == null?firstValue:unitData}',
                          style: TextStyle(
                              color: Colors.grey, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: ProductUnit(
                                onTap: () {
                                  showModalBottomSheet(
                                      context: context,
                                      builder: (context) {
                                        return Column(
                                          mainAxisSize: MainAxisSize.min,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: widget
                                              .productUnit.productUnit
                                              .map<Widget>((data) {
                                            return Column(
                                              children: [
                                                Padding(
                                                  padding: const EdgeInsets
                                                          .symmetric(
                                                      vertical: 10,
                                                      horizontal: 10),
                                                  child: InkWell(
                                                    onTap: () async {
                                                      setState(() {
                                                        unitData = data;
                                                      });
                                                      Navigator.of(context)
                                                          .pop();
                                                    },
                                                    child: Text(
                                                      data,
                                                      style: TextStyle(
                                                          color: Colors.green,
                                                          fontSize: 18),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            );
                                          }).toList(),
                                        );
                                      });
                                },
                                title: unitData == null ? firstValue: unitData,
                              ),
                            ),
                            SizedBox(width: 5),
                            Count(
                              productId: widget.productId,
                              productImage: widget.productImage,
                              productName: widget.productName,
                              productPrice: widget.productPrice,
                              productUnit: unitData == null ? firstValue: unitData,
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
