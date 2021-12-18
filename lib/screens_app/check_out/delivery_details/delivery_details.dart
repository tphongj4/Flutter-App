import 'package:flutter/material.dart';
import 'package:market_online_app/screens_app/check_out/delivery_details/single_delivery_item.dart';

class DeliveryDetails extends StatelessWidget {
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
        onPressed: () {},
      ),
      bottomNavigationBar: Container(
        // width: 160,
        height: 48,
        margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        child: MaterialButton(
          child: Text(
            "Thêm địa chỉ mới",
            style: TextStyle(color: Colors.white),
          ),
          onPressed: () {},
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
              SingleDeliveryItem(
                address: "33 Xô Viết Nghệ Tĩnh, Phường Hoà Cường Nam, Hải Châu, Đà Nẵng",
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