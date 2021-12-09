import 'package:flutter/material.dart';
import 'package:market_online_app/config/colors.dart';
import 'package:market_online_app/widgets/single_item.dart';

class ReviewCart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
      body: ListView(
        children: [
          SizedBox(
            height: 10,
          ),
          SingleItem(isBool: true,),
          SingleItem(isBool: true,),
          SingleItem(isBool: true,),
          SingleItem(isBool: true,),
          SizedBox(
            height: 10,
          )
        ],
      ),
    );
  }
}
