import 'package:flutter/material.dart';
import 'package:market_online_app/models/product_model.dart';
import 'package:market_online_app/widgets/single_item.dart';

class Search extends StatefulWidget {
  final List<ProductModel> search;
  Search({this.search});

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  //Update Tìm kiếm nhu yếu phẩm
  searchItem(String query) {
    List<ProductModel> searchVegetable = widget.search.where((element) {
      return element.productName.toLowerCase().contains(query);
    }).toList();
    return searchVegetable;
  }

  String query = "";

  // End element tìm kiếm

  @override
  Widget build(BuildContext context) {
    List<ProductModel> _searchItem = searchItem(query); //Tìm kiếm nhu yếu phẩm
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text("Tìm kiếm nhu yếu phẩm"),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: IconButton(
              onPressed: () {},
              icon: Icon(Icons.sort),
            ),
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
              // Tìm kiếm nhu yếu phẩm
              onChanged: (value) {
                // In ra console thử key đã hiện chưa
                // print(value);
                setState(() {
                  query = value;
                });
              },
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
          Column(
            children: _searchItem.map((data) {
              return SingleItem(
                isBool: false,
                productName: data.productName,
                productImage: data.productImage,
                productPrice: data.productPrice,
              );
            }).toList(),
          )
          // SingleItem(isBool: false,),
          // SingleItem(isBool: false,),
          // SingleItem(isBool: false,),
          // SingleItem(isBool: false,),
          // SingleItem(isBool: false,),
        ],
      ),
    );
  }
}
