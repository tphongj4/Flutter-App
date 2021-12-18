import 'package:flutter/material.dart';
import 'package:market_online_app/config/colors.dart';
import 'package:market_online_app/widgets/single_item.dart';
import 'package:provider/provider.dart';
import 'package:market_online_app/models/review_cart_model.dart';
import 'package:market_online_app/providers/review_cart_provider.dart';
import 'package:market_online_app/screens_app/check_out/delivery_details/delivery_details.dart';

class ReviewCart extends StatelessWidget {
  ReviewCartProvider reviewCartProvider;
// Alert hiển thị để xác nhận xoá
  showAlertDialog(BuildContext context, ReviewCartModel delete) {
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
        reviewCartProvider.reviewCartDataDelete(delete.cartId);
        Navigator.of(context).pop();
      },
    );

    // Tạo AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text("Xoá nhu yếu phẩm"),
      content: Text("Bạn chắc chắn xoá nhu yếu phẩm trên giỏ hàng không?"),
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

// HẾT PHẦN SHOW ALERT

  @override
  Widget build(BuildContext context) {
    reviewCartProvider = Provider.of<ReviewCartProvider>(context);
    reviewCartProvider.getReviewCartData();
    return Scaffold(
      bottomNavigationBar: ListTile(
        title: Text("Tổng cộng"),
        subtitle: Text(
          "${reviewCartProvider.getTotalPrice()}\ VND ",
          style: TextStyle(color: Colors.red),
        ),
        trailing: Container(
          width: 160,
          child: MaterialButton(
            child: Text("Gửi đơn hàng"),
            color: Colors.green,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => DeliveryDetails(),
                ),
              );
          },
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
      body: reviewCartProvider.getReviewCartDataList.isEmpty
          ? Center(
              child: Text("Không có nhu yếu phẩm nào trong giỏ hàng của bạn!"),
            )
          : ListView.builder(
              itemCount: reviewCartProvider.getReviewCartDataList.length,
              itemBuilder: (context, index) {
                ReviewCartModel data =
                    reviewCartProvider.getReviewCartDataList[index];
                return Column(
                  children: [
                    SizedBox(
                      height: 10,
                    ),
                    SingleItem(
                      isBool: true,
                      wishList: false,
                      productImage: data.cartImage,
                      productName: data.cartName,
                      productPrice: data.cartPrice,
                      productId: data.cartId,
                      productQuantity: data.cartQuantity,
                      productUnit: data.cartUnit,
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
