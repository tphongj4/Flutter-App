import 'package:flutter/material.dart';
import 'package:market_online_app/screens_app/check_out/payment/my_google_pay.dart';
import 'package:market_online_app/screens_app/check_out/payment/order_item.dart';
import 'package:market_online_app/models/delivery_address_model.dart';
import 'package:market_online_app/providers/review_cart_provider.dart';
import 'package:market_online_app/screens_app/check_out/delivery_details/single_delivery_item.dart';
import 'package:provider/provider.dart';

class PaymentSummary extends StatefulWidget {
  final DeliveryAddressModel deliverAddressList;
  PaymentSummary({this.deliverAddressList});

  @override
  _PaymentSummaryState createState() => _PaymentSummaryState();
}

enum AddressType {
  Home,
  OnlinePayment,
}

class _PaymentSummaryState extends State<PaymentSummary> {
  var myType = AddressType.Home;
  @override
  Widget build(BuildContext context) {
    //biểu thức thanh toán
    ReviewCartProvider reviewCartProvider = Provider.of(context);
    reviewCartProvider.getReviewCartData();

    double discount = 30;
    double discountValue;
    double total;
    double shippingChange = 3.7;
    double totalPrice = reviewCartProvider.getTotalPrice();
    if (totalPrice > 300) {
      discountValue = (totalPrice * discount) / 100;
      total = totalPrice - discountValue;
    }
    // print(discountValue);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Trang thanh toán",
          style: TextStyle(fontSize: 18),
        ),
        backgroundColor: Colors.green,
      ),
      bottomNavigationBar: ListTile(
        title: Text("Tổng cộng"),
        subtitle: Text(
          "${total ?? totalPrice}\ VND",
          style: TextStyle(
              color: Colors.green[800],
              fontWeight: FontWeight.bold,
              fontSize: 15),
        ),
        trailing: Container(
          width: 160,
          child: MaterialButton(
            onPressed: () {
              myType == AddressType.OnlinePayment
                  ? Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => MyGooglePay(
                          total: total,
                        ),
                      ),
                    )
                  : Container();
            },
            child: Text(
              "Đặt hàng",
              style: TextStyle(color: Colors.white),
            ),
            color: Colors.green,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            ),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 10),
        child: ListView.builder(
          itemCount: 1,
          itemBuilder: (context, index) {
            return Column(
              children: [
                SingleDeliveryItem(
                  address:
                      "Địa chỉ: ${widget.deliverAddressList.diaChigiao}, Xã ${widget.deliverAddressList.xa}, Quận ${widget.deliverAddressList.quan}, Huyện ${widget.deliverAddressList.huyen}, Thành Phố ${widget.deliverAddressList.thanhPho} ",
                  tittle:
                      "${widget.deliverAddressList.ten} ${widget.deliverAddressList.hoDem}",
                  number: widget.deliverAddressList.soDienthoai,
                  addressType: widget.deliverAddressList.loaidiahchi ==
                          "AddressType.Khac"
                      ? "Khác"
                      : widget.deliverAddressList.loaidiahchi ==
                              "AddressType.Home"
                          ? "Nhà"
                          : "Công ty",
                ),
                Divider(),
                ExpansionTile(
                  children: reviewCartProvider.getReviewCartDataList.map((e) {
                    return OrderItem(
                      e: e,
                    );
                  }).toList(),
                  title: Text(
                      "Đã đặt ${reviewCartProvider.getReviewCartDataList.length} nhu yếu phẩm"),
                ),
                Divider(),
                ListTile(
                  minVerticalPadding: 5,
                  leading: Text(
                    "Tổng phụ",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  trailing: Text(
                    "${totalPrice}\VND",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                ListTile(
                  minVerticalPadding: 5,
                  leading: Text(
                    "Tặng Voucher trên 300k",
                    style: TextStyle(
                      color: Colors.grey[600],
                    ),
                  ),
                  trailing: Text(
                    "$discountValue",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                ListTile(
                  minVerticalPadding: 5,
                  leading: Text(
                    "Giảm giá vì dịch",
                    style: TextStyle(
                      color: Colors.grey[600],
                    ),
                  ),
                  trailing: Text(
                    "30%",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Divider(),
                ListTile(
                  leading: Text("Lựa chọn phương thức thanh toán"),
                ),
                RadioListTile(
                  activeColor: Colors.green,
                  value: AddressType.Home,
                  groupValue: myType,
                  title: Text("Thanh toán tại nhà"),
                  onChanged: (AddressType value) {
                    setState(() {
                      myType = value;
                    });
                  },
                  secondary: Icon(Icons.home, color: Colors.green),
                ),
                RadioListTile(
                  activeColor: Colors.green,
                  value: AddressType.OnlinePayment,
                  groupValue: myType,
                  title: Text("Thanh toán Online"),
                  onChanged: (AddressType value) {
                    setState(() {
                      myType = value;
                    });
                  },
                  secondary: Icon(Icons.payment, color: Colors.green),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
