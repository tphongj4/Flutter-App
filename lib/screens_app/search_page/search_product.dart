import 'package:flutter/material.dart';
import 'package:market_online_app/widgets/single_item.dart';

class Search extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text("Tìm kiếm nhu yếu phẩm"),
         actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Icon(Icons.menu_rounded),
          )
        ],
      ),
      body: ListView(
        children: [
          ListTile(
            title: Text("Tất cả các nhu yếu phẩm"),
          ),
          Container(
            height: 52,
            margin: EdgeInsets.symmetric(horizontal: 20),
            child: TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: BorderSide.none,
                ),
                fillColor: Color(0xffc2c2c2),
                filled: true,
                hintText: "Tìm kiếm nhu yếu phẩm trên chợ",
                suffixIcon: Icon(Icons.search),
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          SingleItem(isBool: false,),
          SingleItem(isBool: false,),
          SingleItem(isBool: false,),
          SingleItem(isBool: false,),
          SingleItem(isBool: false,),
        ],
      ),
    );
  }
}
