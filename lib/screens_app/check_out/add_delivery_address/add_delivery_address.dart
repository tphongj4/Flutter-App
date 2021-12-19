import 'package:flutter/material.dart';
import 'package:market_online_app/widgets/custom_text_field.dart';

class AddDeliveryAdress extends StatefulWidget {
  @override
  _AddDeliveryAdressState createState() => _AddDeliveryAdressState();
}

enum AddressType {
  Home,
  Work,
  Other,
}

class _AddDeliveryAdressState extends State<AddDeliveryAdress> {
  var myType = AddressType.Home;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Thêm địa chỉ giao hàng",
          style: TextStyle(fontSize: 18),
        ),
        backgroundColor: Colors.green,
      ),
      bottomNavigationBar: Container(
        margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        height: 48,
        child: MaterialButton(
          onPressed: () {},
          child: Text(
            "Thêm địa chỉ",
            style: TextStyle(color: Colors.white),
          ),
          color: Colors.green,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(
            30,
          )),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: ListView(
          children: [
            CustomTextField(
              labText: "Tên",
            ),
            CustomTextField(
              labText: "Họ đệm",
            ),
            CustomTextField(
              labText: "Số điện thoại",
            ),
            CustomTextField(
              labText: "Số khác",
            ),
            CustomTextField(
              labText: "Địa chỉ gao",
            ),
            CustomTextField(
              labText: "Xã",
            ),
            CustomTextField(
              labText: "Đường",
            ),
            CustomTextField(
              labText: "Quận",
            ),
            CustomTextField(
              labText: "Huyện",
            ),
            CustomTextField(
              labText: "Thành Phố",
            ),
            InkWell(
              onTap: () {},
              child: Container(
                height: 47,
                width: double.infinity,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [Text("Thêm địa điểm")],
                ),
              ),
            ),
            Divider(
              color: Colors.black,
            ),
            ListTile(
              title: Text("Loại địa chỉ *"),
            ),
            RadioListTile(
              activeColor: Colors.green,
              value: AddressType.Home,
              groupValue: myType,
              title: Text("Nhà"),
              onChanged: (AddressType value) {
                setState(() {
                  myType = value;
                });
              },
              secondary: Icon(Icons.home, color: Colors.green),
            ),
            RadioListTile(
              activeColor: Colors.green,
              value: AddressType.Work,
              groupValue: myType,
              title: Text("Công ty"),
              onChanged: (AddressType value) {
                setState(() {
                  myType = value;
                });
              },
              secondary: Icon(Icons.work, color: Colors.green),
            ),
            RadioListTile(
              activeColor: Colors.green,
              value: AddressType.Other,
              groupValue: myType,
              title: Text("Khác"),
              onChanged: (AddressType value) {
                setState(() {
                  myType = value;
                });
              },
              secondary: Icon(Icons.devices_other, color: Colors.green),
            )
          ],
        ),
      ),
    );
  }
}