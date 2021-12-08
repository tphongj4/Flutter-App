import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:market_online_app/screens_app/home_page/drawer_side.dart';
import 'package:market_online_app/config/colors.dart';
import 'package:market_online_app/screens_app/home_page/singal_product.dart';
import 'package:market_online_app/screens_app/product_overview/product_overview.dart';

class HomeScreen extends StatelessWidget {
  // Widget singalProducts() {
  //   return Container(
  //     margin: EdgeInsets.symmetric(horizontal: 10),
  //     height: 230,
  //     width: 160,
  //     decoration: BoxDecoration(
  //       color: Color(0xffd9dad9),
  //       borderRadius: BorderRadius.circular(10),
  //     ),
  //     child: Column(
  //       crossAxisAlignment: CrossAxisAlignment.start,
  //       children: [
  //         Expanded(
  //           flex: 2,
  //           child: Image.network(
  //               'https://khothietke.net/wp-content/uploads/2021/03/PNG00030-rau-cai-cai-thia-2-tai-png-mien-phi.png'),
  //         ),
  //         Expanded(
  //           child: Padding(
  //             padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
  //             child: Column(
  //               crossAxisAlignment: CrossAxisAlignment.start,
  //               children: [
  //                 Text(
  //                   'Rau cải tươi xanh',
  //                   style: TextStyle(
  //                       color: Colors.black, fontWeight: FontWeight.bold),
  //                 ),
  //                 Text(
  //                   '50k/1kg',
  //                   style: TextStyle(
  //                       color: Colors.grey, fontWeight: FontWeight.bold),
  //                 ),
  //                 Row(
  //                   children: [
  //                     Expanded(
  //                       child: Container(
  //                         padding: EdgeInsets.only(left: 5),
  //                         height: 30,
  //                         width: 50,
  //                         decoration: BoxDecoration(
  //                           border: Border.all(color: Colors.green),
  //                           borderRadius: BorderRadius.circular(8),
  //                         ),
  //                         child: Row(
  //                           children: [
  //                             Expanded(
  //                                 child: Text(
  //                               '50 Gram',
  //                               style: TextStyle(fontSize: 10),
  //                             )),
  //                             Center(
  //                               child: Icon(Icons.arrow_drop_down,
  //                                   size: 20, color: Colors.green),
  //                             )
  //                           ],
  //                         ),
  //                       ),
  //                     ),
  //                     SizedBox(
  //                       width: 5,
  //                     ),
  //                     Expanded(
  //                         child: Container(
  //                       height: 30,
  //                       width: 50,
  //                       decoration: BoxDecoration(
  //                         border: Border.all(color: Colors.red),
  //                         borderRadius: BorderRadius.circular(8),
  //                       ),
  //                       child: Row(
  //                         mainAxisAlignment: MainAxisAlignment.center,
  //                         children: [
  //                           Icon(Icons.remove, size: 15, color: Colors.red),
  //                           Text(
  //                             '1',
  //                             style: TextStyle(
  //                                 color: Colors.red,
  //                                 fontWeight: FontWeight.bold),
  //                           ),
  //                           Icon(Icons.add, size: 15, color: Colors.red)
  //                         ],
  //                       ),
  //                     ))
  //                   ],
  //                 ),
  //               ],
  //             ),
  //           ),
  //         )
  //       ],
  //     ),
  //   );
  // }

  Widget _buildVegetableProduct(context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 5),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Rau củ - Gia vị'),
              Text(
                "View All",
                style: TextStyle(color: Colors.grey),
              )
            ],
          ),
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              SingalProduct(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => ProductOverview()));
                },
                productImage:
                    'https://khothietke.net/wp-content/uploads/2021/03/PNG00030-rau-cai-cai-thia-2-tai-png-mien-phi.png',
                productName: "Rau cải tươi xanh",
              ),
              SingalProduct(
                productImage:
                    'https://lh3.googleusercontent.com/proxy/oy_mjhi3UQSpHiiHH9wIAaAF2sannI3enZ2i8FhfUbjG_nXz4AWXJ5fKhp23CeBRchy3Gf_hhlwIckdyLc7Vo-3fwtjFzGDhdPjlP5LHQBDgoR5zioaEPw',
                productName: "Cải dún tươi xanh",
              ),
              SingalProduct(
                productImage:
                    'https://cdn.tgdd.vn/Products/Images/8820/226914/bhx/cai-ngot-tui-500g-202009292342137825.jpg',
                productName: "Cải ngọt bó tươi xanh",
              ),
              SingalProduct(
                productImage:
                    'https://lh3.googleusercontent.com/proxy/_ijIrH609rxb93CkaWmy3jeQZ0zG7DC-Wq5b6kn16BndUbysknowP3g7CgtQkV7HrDtS1OzBlLypm4PZ1QXDEg1EFHRP5OM06_RnlmRUZLzgdGO4-7aE7A5bzrb3',
                productName: "Dưa chuột",
              )
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildFruitsProduct() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 5),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Trái cây tươi'),
              Text(
                "View All",
                style: TextStyle(color: Colors.grey),
              )
            ],
          ),
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              SingalProduct(
                // onTap: (){
                //   Navigator.of(context).push(MaterialPageRoute(builder: (context)=> ProductOverview()));
                // },
                productImage:
                    'https://znews-photo.zadn.vn/w660/Uploaded/sgorvz/2016_09_29/chon_trai_cay_2.jpg',
                productName: "Bơ sáp Đà Nẵng",
              ),
              SingalProduct(
                productImage:
                    'https://dacsancamvinh.net/wp-content/uploads/2015/06/cong-dung-qua-cam.jpg',
                productName: "Cam ngọt Đồng Tháp",
              ),
              SingalProduct(
                productImage:
                    'https://cdn.tgdd.vn/Products/Images/8788/245525/bhx/dua-hau-khong-hat-tui-2kg-202107101526322905.jpg',
                productName: "Dưa hấu đỏ",
              ),
              SingalProduct(
                productImage:
                    'https://nucuoimekong.com/wp-content/uploads/trai-cay-mien-tay-buoi-da-xanh.jpg',
                productName: "Bưởi miền Tây ngon",
              )
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildMeatProduct() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 5),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Thịt tươi sống'),
              Text(
                "View All",
                style: TextStyle(color: Colors.grey),
              )
            ],
          ),
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              SingalProduct(
                // onTap: (){
                //   Navigator.of(context).push(MaterialPageRoute(builder: (context)=> ProductOverview()));
                // },
                productImage:
                    'https://cafefcdn.com/thumb_w/650/203337114487263232/2021/9/28/photo1632798710845-1632798710943181451693.png',
                productName: "Thịt heo sạch",
              ),
              SingalProduct(
                productImage:
                    'https://giadinhnestle.com.vn/sites/default/files/2020-08/integration/sites/default/files/articles/images/images/12-2017/cach-bao-quan-thit-bo-chuan-vi-cho-bua-com-ngon.jpg',
                productName: "Thịt bò lai tươi",
              ),
              SingalProduct(
                productImage:
                    'https://cdn.statically.io/img/gachaybo.com/f=auto/wp-content/uploads/2019/06/mua-thit-ga-sach-2.jpg',
                productName: "Thịt gà Kiến giống",
              ),
              SingalProduct(
                productImage:
                    'https://vit29.com/media/news/0308_vit-om-kieu-tau1.jpg',
                productName: "Thịt Vịt Lai om",
              )
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildFishProduct() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 5),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Cá tươi sống'),
              Text(
                "View All",
                style: TextStyle(color: Colors.grey),
              )
            ],
          ),
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              SingalProduct(
                // onTap: (){
                //   Navigator.of(context).push(MaterialPageRoute(builder: (context)=> ProductOverview()));
                // },
                productImage:
                    'https://haisantrungnam.vn/wp-content/uploads/2020/03/ca-nuc-1-600x400.jpg',
                productName: "Cá nục tươi",
              ),
              SingalProduct(
                productImage:
                    'https://bhfood.vn/wp-content/uploads/2020/05/ca-chep-gion-bhfood-1.jpg',
                productName: "Thịt chép giòn",
              ),
              SingalProduct(
                productImage:
                    'https://sanvatphuongnam.vn/image/cache/catalog/products/thuy-hai-san/ca-dia-bong-1-800x800.jpg',
                productName: "Cá dìa nước lợ",
              ),
              SingalProduct(
                productImage:
                    'https://icdn.dantri.com.vn/thumb_w/640/2016/photo-1-1483059624194.jpg',
                productName: "Cá hồi",
              )
            ],
          ),
        ),
      ],
    );
  }

  Widget listTittle({IconData icon, String tittle}) {
    return ListTile(
      leading: Icon(
        icon,
        size: 32,
      ),
      title: Text(
        tittle,
        style: TextStyle(color: Colors.black45),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffcdcdcd),
      drawer: DrawerSide(),
      appBar: AppBar(
          iconTheme: IconThemeData(color: Colors.black),
          title: Text(
            'Home Page',
            style: TextStyle(color: Colors.black),
          ),
          actions: [
            CircleAvatar(
              radius: 12,
              backgroundColor: Color(0xffd4d181),
              child: Icon(Icons.search, size: 15, color: Colors.black),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5),
              child: CircleAvatar(
                radius: 12,
                backgroundColor: Color(0xffd4d181),
                child: Icon(Icons.shop, size: 15, color: Colors.black),
              ),
            ),
          ],
          // backgroundColor: Color(0xffd6b738),
          backgroundColor: Colors.green),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        child: ListView(
          children: [
            Container(
              height: 150,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage(
                          'https://t4.ftcdn.net/jpg/03/20/39/81/360_F_320398182_1X1ebszxgKyeS6j291ywWYIw1dfRLETC.jpg')),
                  color: Colors.red,
                  borderRadius: BorderRadius.circular(10)),
              child: Row(
                children: [
                  Expanded(
                    flex: 2,
                    child: Container(
                      child: Column(
                        children: [
                          Padding(
                            padding:
                                const EdgeInsets.only(right: 140, bottom: 10),
                            child: Container(
                              height: 50,
                              width: 100,
                              decoration: BoxDecoration(
                                color: Colors.green,
                                borderRadius: BorderRadius.only(
                                  bottomRight: Radius.circular(50),
                                  bottomLeft: Radius.circular(50),
                                ),
                              ),
                              child: Center(
                                child: Text(
                                  'Market',
                                  style: TextStyle(
                                      fontSize: 15,
                                      color: Colors.white,
                                      shadows: [
                                        BoxShadow(
                                            color: Colors.green,
                                            blurRadius: 10,
                                            offset: Offset(3, 3))
                                      ]),
                                ),
                              ),
                            ),
                          ),
                          Text(
                            '50% Off',
                            style: TextStyle(
                                fontSize: 40,
                                color: Colors.green[100],
                                fontWeight: FontWeight.bold),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 20),
                            child: Text(
                              'On all vegetable products',
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(),
                  ),
                ],
              ),
            ),
            _buildVegetableProduct(context),
            _buildFishProduct(),
            _buildMeatProduct(),
            _buildFruitsProduct(),
          ],
        ),
      ),
    );
  }
}
