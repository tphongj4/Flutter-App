import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:market_online_app/screens_app/home_page/drawer_side.dart';
import 'package:market_online_app/config/colors.dart';
import 'package:market_online_app/screens_app/home_page/singal_product.dart';
import 'package:market_online_app/screens_app/product_overview/product_overview.dart';
import 'package:market_online_app/screens_app/search_page/search_product.dart';

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
                      builder: (context) => ProductOverview(
                            productName: "Rau cải tươi xanh",
                            productImage:
                                "https://khothietke.net/wp-content/uploads/2021/03/PNG00030-rau-cai-cai-thia-2-tai-png-mien-phi.png",
                          )));
                },
                productImage:
                    'https://khothietke.net/wp-content/uploads/2021/03/PNG00030-rau-cai-cai-thia-2-tai-png-mien-phi.png',
                productName: "Rau cải tươi xanh",
              ),
              SingalProduct(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => ProductOverview(
                            productName: "Củ cà rốt",
                            productImage:
                                "https://amthucbonmua.vn/wp-content/uploads/2020/10/cu-ca-rot-1.jpg",
                          )));
                },
                productImage:
                    'https://amthucbonmua.vn/wp-content/uploads/2020/10/cu-ca-rot-1.jpg',
                productName: "Củ cà rốt",
              ),
              SingalProduct(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => ProductOverview(
                            productName: "Cải ngọt bó tươi xanh",
                            productImage:
                                "https://cdn.tgdd.vn/Products/Images/8820/226914/bhx/cai-ngot-tui-500g-202009292342137825.jpg",
                          )));
                },
                productImage:
                    'https://cdn.tgdd.vn/Products/Images/8820/226914/bhx/cai-ngot-tui-500g-202009292342137825.jpg',
                productName: "Cải ngọt bó tươi xanh",
              ),
              SingalProduct(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => ProductOverview(
                            productName: "Dưa chuột",
                            productImage:
                                "https://lhu.edu.vn/Data/News/494/images/Pho_bien_kien_thuc/20141127_095250_dua_5_520x347.jpg",
                          )));
                },
                productImage:
                    'https://lhu.edu.vn/Data/News/494/images/Pho_bien_kien_thuc/20141127_095250_dua_5_520x347.jpg',
                productName: "Dưa chuột",
              ),
              SingalProduct(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => ProductOverview(
                            productName: "Rau muống",
                            productImage:
                                "https://tracnghiemcuocsong.com/wp-content/uploads/2019/11/445532104-8-1024x683.jpg",
                          )));
                },
                productImage:
                    'https://tracnghiemcuocsong.com/wp-content/uploads/2019/11/445532104-8-1024x683.jpg',
                productName: "Rau muống",
              )
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildFruitsProduct(context) {
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
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => ProductOverview(
                            productName: "Bơ sáp Đà Nẵng",
                            productImage:
                                "https://znews-photo.zadn.vn/w660/Uploaded/sgorvz/2016_09_29/chon_trai_cay_2.jpg",
                          )));
                },
                productImage:
                    'https://znews-photo.zadn.vn/w660/Uploaded/sgorvz/2016_09_29/chon_trai_cay_2.jpg',
                productName: "Bơ sáp Đà Nẵng",
              ),
              SingalProduct(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => ProductOverview(
                            productName: "Cam ngọt Đồng Tháp",
                            productImage:
                                "https://dacsancamvinh.net/wp-content/uploads/2015/06/cong-dung-qua-cam.jpg",
                          )));
                },
                productImage:
                    'https://dacsancamvinh.net/wp-content/uploads/2015/06/cong-dung-qua-cam.jpg',
                productName: "Cam ngọt Đồng Tháp",
              ),
              SingalProduct(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => ProductOverview(
                            productName: "Dưa hấu đỏ",
                            productImage:
                                "https://cdn.tgdd.vn/Products/Images/8788/245525/bhx/dua-hau-khong-hat-tui-2kg-202107101526322905.jpg",
                          )));
                },
                productImage:
                    'https://cdn.tgdd.vn/Products/Images/8788/245525/bhx/dua-hau-khong-hat-tui-2kg-202107101526322905.jpg',
                productName: "Dưa hấu đỏ",
              ),
              SingalProduct(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => ProductOverview(
                            productName: "Bưởi miền Tây ngon",
                            productImage:
                                "https://nucuoimekong.com/wp-content/uploads/trai-cay-mien-tay-buoi-da-xanh.jpg",
                          )));
                },
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

  Widget _buildMeatProduct(context) {
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
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => ProductOverview(
                            productName: "Thịt heo sạch",
                            productImage:
                                "https://cafefcdn.com/thumb_w/650/203337114487263232/2021/9/28/photo1632798710845-1632798710943181451693.png",
                          )));
                },
                productImage:
                    'https://cafefcdn.com/thumb_w/650/203337114487263232/2021/9/28/photo1632798710845-1632798710943181451693.png',
                productName: "Thịt heo sạch",
              ),
              SingalProduct(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => ProductOverview(
                            productName: "Thịt bò lai tươi",
                            productImage:
                                "https://giadinhnestle.com.vn/sites/default/files/2020-08/integration/sites/default/files/articles/images/images/12-2017/cach-bao-quan-thit-bo-chuan-vi-cho-bua-com-ngon.jpg",
                          )));
                },
                productImage:
                    'https://giadinhnestle.com.vn/sites/default/files/2020-08/integration/sites/default/files/articles/images/images/12-2017/cach-bao-quan-thit-bo-chuan-vi-cho-bua-com-ngon.jpg',
                productName: "Thịt bò lai tươi",
              ),
              SingalProduct(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => ProductOverview(
                            productName: "Thịt gà Kiến giống",
                            productImage:
                                "https://cdn.statically.io/img/gachaybo.com/f=auto/wp-content/uploads/2019/06/mua-thit-ga-sach-2.jpg",
                          )));
                },
                productImage:
                    'https://cdn.statically.io/img/gachaybo.com/f=auto/wp-content/uploads/2019/06/mua-thit-ga-sach-2.jpg',
                productName: "Thịt gà Kiến giống",
              ),
              SingalProduct(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => ProductOverview(
                            productName: "Thịt Vịt Lai om",
                            productImage:
                                "https://vit29.com/media/news/0308_vit-om-kieu-tau1.jpg",
                          )));
                },
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

  Widget _buildFishProduct(context) {
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
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => ProductOverview(
                            productName: "Cá nục tươi",
                            productImage:
                                "https://haisantrungnam.vn/wp-content/uploads/2020/03/ca-nuc-1-600x400.jpg",
                          )));
                },
                productImage:
                    'https://haisantrungnam.vn/wp-content/uploads/2020/03/ca-nuc-1-600x400.jpg',
                productName: "Cá nục tươi",
              ),
              SingalProduct(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => ProductOverview(
                            productName: "Cá chép giòn",
                            productImage:
                                "https://bhfood.vn/wp-content/uploads/2020/05/ca-chep-gion-bhfood-1.jpg",
                          )));
                },
                productImage:
                    'https://bhfood.vn/wp-content/uploads/2020/05/ca-chep-gion-bhfood-1.jpg',
                productName: "Cá chép giòn",
              ),
              SingalProduct(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => ProductOverview(
                            productName: "Cá chẽm nước lợ",
                            productImage:
                                "https://cdn.tgdd.vn/Files/2020/10/02/1295353/ca-chem-la-ca-gi-co-bao-nhieu-loai-ca-chem-202010021135030391.jpg",
                          )));
                },
                productImage:
                    'https://cdn.tgdd.vn/Files/2020/10/02/1295353/ca-chem-la-ca-gi-co-bao-nhieu-loai-ca-chem-202010021135030391.jpg',
                productName: "Cá chẽm nước lợ",
              ),
              SingalProduct(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => ProductOverview(
                            productName: "Cá hồi biển",
                            productImage:
                                "https://icdn.dantri.com.vn/thumb_w/640/2016/photo-1-1483059624194.jpg",
                          )));
                },
                productImage:
                    'https://icdn.dantri.com.vn/thumb_w/640/2016/photo-1-1483059624194.jpg',
                productName: "Cá hồi",
              ),
              SingalProduct(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => ProductOverview(
                            productName: "Cá trê",
                            productImage:
                                "https://baokhuyennong.com/wp-content/uploads/2020/03/hinh-anh-ca-tre.jpg",
                          )));
                },
                productImage:
                    'https://baokhuyennong.com/wp-content/uploads/2020/03/hinh-anh-ca-tre.jpg',
                productName: "Cá trê",
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
          iconTheme: IconThemeData(color: Colors.white),
          title: Text(
            'Home Page',
            style: TextStyle(color: Colors.white),
          ),
          actions: [
            CircleAvatar(
              radius: 15,
              backgroundColor: Colors.white,
              child: IconButton(
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => Search(),
                    ),
                  );
                },
                icon: Icon(Icons.search, size: 15, color: Colors.green),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5),
              child: CircleAvatar(
                radius: 15,
                backgroundColor: Colors.white,
                child: Icon(Icons.shop, size: 15, color: Colors.green),
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
            _buildFishProduct(context),
            _buildMeatProduct(context),
            _buildFruitsProduct(context),
          ],
        ),
      ),
    );
  }
}
