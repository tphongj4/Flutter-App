import 'package:flutter/material.dart';
import 'package:market_online_app/screens_app/check_out/payment/order_item.dart';

class PaymentSummary extends StatefulWidget {
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
          "500.000VND",
          style: TextStyle(
              color: Colors.green[800],
              fontWeight: FontWeight.bold,
              fontSize: 15),
        ),
        trailing: Container(
          width: 160,
          child: MaterialButton(
            onPressed: () {},
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
                ListTile(
                  title: Text("Họ và tên"),
                  subtitle: Text(
                      "33 Xô Viết Nghệ Tĩnh, Phường Hoà Cường Nam, Hải Châu, Đà Nẵng"),
                ),
                Divider(),
                ExpansionTile(
                  children: [
                    OrderItem(),
                    OrderItem(),
                    OrderItem(),
                    OrderItem(),
                    OrderItem(),
                    OrderItem(),
                  ],
                  title: Text("Đặt 6 mặt hàng cá"),
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
                    "50.00VND",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                ListTile(
                  minVerticalPadding: 5,
                  leading: Text(
                    "Phí Shipper",
                    style: TextStyle(
                      color: Colors.grey[600],
                    ),
                  ),
                  trailing: Text(
                    "0.VND",
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
                    "10.000VND",
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