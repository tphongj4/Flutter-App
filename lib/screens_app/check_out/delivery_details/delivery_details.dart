import 'package:flutter/material.dart';
import 'package:market_online_app/screens_app/check_out/add_delivery_address/add_delivery_address.dart';
import 'package:market_online_app/screens_app/check_out/delivery_details/single_delivery_item.dart';
import 'package:market_online_app/screens_app/check_out/payment/payment_summary.dart';


class DeliveryDetails extends StatelessWidget {
  List<Widget> address = [
    SingleDeliveryItem(
      address: "33 Xô Viết Nghệ Tĩnh, Phường Hoà Cường Nam, Hải Châu, Đà Nẵng",
      tittle: "Khách: Hoàng Thiện",
      number: "0339 195 193",
      addressType: "Home",
    ),
  ];
  @override
  Widget build(BuildContext context) {
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
          child: address .isEmpty
              ? Text(
                  "Thêm địa chỉ mới",
                  style: TextStyle(color: Colors.white),
                )
              : Text(
                  "Tiến hành thanh toán",
                  style: TextStyle(color: Colors.white),
                ),
          onPressed: () {
            address .isEmpty
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
          Column(
            children: [
              address.isEmpty
                  ? Container()
                  : SingleDeliveryItem(
                      address:
                          "33 Xô Viết Nghệ Tĩnh, Phường Hoà Cường Nam, Hải Châu, Đà Nẵng",
                      tittle: "Khách: Hoàng Thiện",
                      number: "0339 195 193",
                      addressType: "Home",
                    ),
            ],
          )
        ],
      ),
    );
  }
}