import 'package:flutter/material.dart';

class OrderItem extends StatelessWidget {
  bool isTrue;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Image.network(
        "https://lhu.edu.vn/Data/News/494/images/Pho_bien_kien_thuc/20141127_095250_dua_5_520x347.jpg",
        width: 60,
      ),
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "Tên nhu yếu phẩm",
            style: TextStyle(
              color: Colors.grey[600],
            ),
          ),
          Text(
            "500 Gram",
            style: TextStyle(
              color: Colors.grey[600],
            ),
          ),
          Text(
            "50.00VND",
          ),
        ],
      ),
      subtitle: Text("5"),
    );
  }
}