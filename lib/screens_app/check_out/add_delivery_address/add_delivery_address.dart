import 'package:flutter/material.dart';
import 'package:market_online_app/widgets/custom_text_field.dart';
import 'package:provider/provider.dart';
import 'package:market_online_app/providers/check_out_provider.dart';

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
    CheckoutProvider checkoutProvider = Provider.of(context);
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
        child: checkoutProvider.isLoading == false ? MaterialButton(
          onPressed: () {
            checkoutProvider.validator(context, myType);
          },
          child: Text(
            "Thêm địa chỉ",
            style: TextStyle(color: Colors.white),
          ),
          color: Colors.green,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(
            30,
          )),
        ):Center(
          child: CircularProgressIndicator(),
        )
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: ListView(
          children: [
            CustomTextField(
              labText: "Tên",
              controller: checkoutProvider.ten,
            ),
            CustomTextField(
              labText: "Họ đệm",
              controller: checkoutProvider.hodem,

            ),
            CustomTextField(
              labText: "Số điện thoại",
              controller: checkoutProvider.sodienthoai,

            ),
            CustomTextField(
              labText: "Số khác",
              controller: checkoutProvider.sokhac,

            ),
            CustomTextField(
              labText: "Địa chỉ gao",
              controller: checkoutProvider.diachigiao,

            ),
            CustomTextField(
              labText: "Xã",
              controller: checkoutProvider.xa,

            ),
            CustomTextField(
              labText: "Đường",
              controller: checkoutProvider.duong,

            ),
            CustomTextField(
              labText: "Quận",
              controller: checkoutProvider.quan,

            ),
            CustomTextField(
              labText: "Huyện",
              controller: checkoutProvider.huyen,

            ),
            CustomTextField(
              labText: "Thành Phố",
              controller: checkoutProvider.thanhpho,

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