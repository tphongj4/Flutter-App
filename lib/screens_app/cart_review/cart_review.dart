import 'package:flutter/material.dart';
import 'package:market_online_app/config/colors.dart';
import 'package:market_online_app/widgets/single_item.dart';
import 'package:provider/provider.dart';
import 'package:market_online_app/models/review_cart_model.dart';
import 'package:market_online_app/providers/review_cart_provider.dart';

class ReviewCart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
  ReviewCartProvider reviewCartProvider = Provider.of(context);
  reviewCartProvider.getReviewCartData();
    return Scaffold(
      bottomNavigationBar: ListTile(
        title: Text("Tổng cộng"),
        subtitle: Text("50.000VND", style: TextStyle(color: Colors.red),),
        trailing: Container(
          width: 160,
          child: MaterialButton(
            child: Text("Gửi đơn hàng"),
            color: Colors.green,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30)
            ),

            onPressed: (){},
          ),
        ),
      ),
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text(
          "Xem lại giỏ hàng",
          style: TextStyle(color: Colors.white, fontSize: 18),
        ),
      ),
      body: reviewCartProvider.getReviewCartDataList.isEmpty?Center(
        child: Text("Không có nhu yếu phẩm nào trong giỏ hàng của bạn!"),
      ): ListView.builder(
          itemCount: reviewCartProvider.getReviewCartDataList.length,
          itemBuilder: (context, index){
            ReviewCartModel data = reviewCartProvider.getReviewCartDataList[index];
            return Column(
              children: [
                SizedBox(
                  height: 10,
                ),
                SingleItem(
                  isBool: true,
                  productImage: data.cartImage,
                  productName: data.cartName,
                  productPrice: data.cartPrice,
                  producId: data.cartId,
                  productQuantity: data.cartQuantity,
                ),
              ],
            );
          },
      ),
    );
  }
}