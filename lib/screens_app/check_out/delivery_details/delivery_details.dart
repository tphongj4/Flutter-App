import 'package:flutter/material.dart';
import 'package:market_online_app/providers/check_out_provider.dart';
import 'package:market_online_app/screens_app/check_out/add_delivery_address/add_delivery_address.dart';
import 'package:market_online_app/screens_app/check_out/delivery_details/single_delivery_item.dart';
import 'package:market_online_app/screens_app/check_out/payment/payment_summary.dart';
import 'package:provider/provider.dart';

class DeliveryDetails extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    CheckoutProvider deliveryAddressProvider = Provider.of(context);
    deliveryAddressProvider.getDeliveryAddressData();
    return Scaffold(
      appBar: AppBar(
        title: Text("Chi tiết giao nhu yếu phẩm"),
        backgroundColor: Colors.green,
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.green,
        child: Icon(Icons.add),
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => AddDeliveryAdress(),
            ),
          );
        },
      ),
      bottomNavigationBar: Container(
        // width: 160,
        height: 48,
        margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        child: MaterialButton(
          child: deliveryAddressProvider.getDeliveryAddressList.isEmpty
              ? Text(
                  "Thêm địa chỉ mới",
                  style: TextStyle(color: Colors.white),
                )
              : Text(
                  "Tiến hành thanh toán",
                  style: TextStyle(color: Colors.white),
                ),
          onPressed: () {
            deliveryAddressProvider.getDeliveryAddressList.isEmpty
                ? Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => AddDeliveryAdress(),
                    ),
                  )
                : Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => PaymentSummary(),
                    ),
                  );
          },
          color: Colors.green,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(
            30,
          )),
        ),
      ),
      body: ListView(
        children: [
          ListTile(
            title: Text("Giao tới"),
            leading: Image.asset(
              "images/location.png",
              height: 30,
            ),
          ),
          Divider(
            height: 5,
            color: Colors.green,
          ),
          deliveryAddressProvider.getDeliveryAddressList.isEmpty
              ? Container(
                  child: Center(
                    child: Text("Không có địa chỉ nào"),
                  ),
                )
              : Column(
                  children:
                      deliveryAddressProvider.getDeliveryAddressList.map((e) {
                    return SingleDeliveryItem(
                      address:
                          "Địa chỉ: ${e.diaChigiao}, Xã ${e.xa}, Quận ${e.quan}, Huyện ${e.huyen}, Thành Phố ${e.thanhPho} ",
                      tittle: "${e.ten} ${e.hoDem}",
                      number: e.soDienthoai,
                      addressType: e.loaidiahchi == "AddressType.Khac"
                          ? "Khác"
                          : e.loaidiahchi == "AddressType.Home"
                              ? "Nhà"
                              : "Công ty",
                    );
                  }).toList(),
                )
        ],
      ),
    );
  }
}
