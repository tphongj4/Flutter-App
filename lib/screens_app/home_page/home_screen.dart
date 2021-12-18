import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:market_online_app/providers/product_provider.dart';
import 'package:market_online_app/providers/user_provider.dart';
import 'package:market_online_app/screens_app/cart_review/cart_review.dart';
import 'package:market_online_app/screens_app/home_page/drawer_side.dart';
import 'package:market_online_app/config/colors.dart';
import 'package:market_online_app/screens_app/home_page/singal_product.dart';
import 'package:market_online_app/screens_app/product_overview/product_overview.dart';
import 'package:market_online_app/screens_app/search_page/search_product.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
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

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  ProductProvider productProvider;

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
              // Phần của Tin
              GestureDetector(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => Search(
                        search: productProvider.getVegetableProductDataList,
                      ),
                    ),
                  );
                },
                child: Text(
                  "Xem tất cả",
                  style: TextStyle(color: Colors.grey),
                ),
              )
            ],
          ),
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: productProvider.getVegetableProductDataList.map(
              (vegetableProductData) {
                return SingalProduct(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => ProductOverview(
                              productId: vegetableProductData.productId,
                              productName: vegetableProductData.productName,
                              productImage: vegetableProductData.productImage,
                              productPrice: vegetableProductData.productPrice,
                            )));
                  },
                  productId: vegetableProductData.productId,
                  productImage: vegetableProductData.productImage,
                  productName: vegetableProductData.productName,
                  productPrice: vegetableProductData.productPrice,
                );
              },
            ).toList(),
            // children: [
            //   SingalProduct(
            //     onTap: () {
            //       Navigator.of(context).push(MaterialPageRoute(
            //           builder: (context) => ProductOverview(
            //                 productName: "Rau cải tươi xanh",
            //                 productImage:
            //                     "https://khothietke.net/wp-content/uploads/2021/03/PNG00030-rau-cai-cai-thia-2-tai-png-mien-phi.png",
            //               )));
            //     },
            //     productImage:
            //         'https://khothietke.net/wp-content/uploads/2021/03/PNG00030-rau-cai-cai-thia-2-tai-png-mien-phi.png',
            //     productName: "Rau cải tươi xanh",
            //   ),

            // SingalProduct(
            //   onTap: () {
            //     Navigator.of(context).push(MaterialPageRoute(
            //         builder: (context) => ProductOverview(
            //               productName: "Củ cà rốt",
            //               productImage:
            //                   "https://amthucbonmua.vn/wp-content/uploads/2020/10/cu-ca-rot-1.jpg",
            //             )));
            //   },
            //   productImage:
            //       'https://amthucbonmua.vn/wp-content/uploads/2020/10/cu-ca-rot-1.jpg',
            //   productName: "Củ cà rốt",
            // ),
            // SingalProduct(
            //   onTap: () {
            //     Navigator.of(context).push(MaterialPageRoute(
            //         builder: (context) => ProductOverview(
            //               productName: "Cải ngọt bó tươi xanh",
            //               productImage:
            //                   "https://cdn.tgdd.vn/Products/Images/8820/226914/bhx/cai-ngot-tui-500g-202009292342137825.jpg",
            //             )));
            //   },
            //   productImage:
            //       'https://cdn.tgdd.vn/Products/Images/8820/226914/bhx/cai-ngot-tui-500g-202009292342137825.jpg',
            //   productName: "Cải ngọt bó tươi xanh",
            // ),
            // SingalProduct(
            //   onTap: () {
            //     Navigator.of(context).push(MaterialPageRoute(
            //         builder: (context) => ProductOverview(
            //               productName: "Dưa chuột",
            //               productImage:
            //                   "https://lhu.edu.vn/Data/News/494/images/Pho_bien_kien_thuc/20141127_095250_dua_5_520x347.jpg",
            //             )));
            //   },
            //   productImage:
            //       'https://lhu.edu.vn/Data/News/494/images/Pho_bien_kien_thuc/20141127_095250_dua_5_520x347.jpg',
            //   productName: "Dưa chuột",
            // ),
            // SingalProduct(
            //   onTap: () {
            //     Navigator.of(context).push(MaterialPageRoute(
            //         builder: (context) => ProductOverview(
            //               productName: "Rau muống",
            //               productImage:
            //                   "https://tracnghiemcuocsong.com/wp-content/uploads/2019/11/445532104-8-1024x683.jpg",
            //             )));
            //   },
            //   productImage:
            //       'https://tracnghiemcuocsong.com/wp-content/uploads/2019/11/445532104-8-1024x683.jpg',
            //   productName: "Rau muống",
            // )
            // ],
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
              GestureDetector(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => Search(
                        search: productProvider.getFruitsProductDataList,
                      ),
                    ),
                  );
                },
                child: Text(
                  "Xem tất cả",
                  style: TextStyle(color: Colors.grey),
                ),
              )
            ],
          ),
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: productProvider.getFruitsProductDataList.map(
              (fruitsProductData) {
                return SingalProduct(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => ProductOverview(
                              productId: fruitsProductData.productId,
                              productName: fruitsProductData.productName,
                              productImage: fruitsProductData.productImage,
                              productPrice: fruitsProductData.productPrice,
                            )));
                  },
                  productId: fruitsProductData.productId,
                  productImage: fruitsProductData.productImage,
                  productName: fruitsProductData.productName,
                  productPrice: fruitsProductData.productPrice,
                );
              },
            ).toList(),

            // children: [
            //   SingalProduct(
            //     onTap: () {
            //       Navigator.of(context).push(MaterialPageRoute(
            //           builder: (context) => ProductOverview(
            //                 productName: "Bơ sáp Đà Nẵng",
            //                 productImage:
            //                     "https://znews-photo.zadn.vn/w660/Uploaded/sgorvz/2016_09_29/chon_trai_cay_2.jpg",
            //               )));
            //     },
            //     productImage:
            //         'https://znews-photo.zadn.vn/w660/Uploaded/sgorvz/2016_09_29/chon_trai_cay_2.jpg',
            //     productName: "Bơ sáp Đà Nẵng",
            //   ),
            // SingalProduct(
            //   onTap: () {
            //     Navigator.of(context).push(MaterialPageRoute(
            //         builder: (context) => ProductOverview(
            //               productName: "Cam ngọt Đồng Tháp",
            //               productImage:
            //                   "https://dacsancamvinh.net/wp-content/uploads/2015/06/cong-dung-qua-cam.jpg",
            //             )));
            //   },
            //   productImage:
            //       'https://dacsancamvinh.net/wp-content/uploads/2015/06/cong-dung-qua-cam.jpg',
            //   productName: "Cam ngọt Đồng Tháp",
            // ),
            // SingalProduct(
            //   onTap: () {
            //     Navigator.of(context).push(MaterialPageRoute(
            //         builder: (context) => ProductOverview(
            //               productName: "Dưa hấu đỏ",
            //               productImage:
            //                   "https://cdn.tgdd.vn/Products/Images/8788/245525/bhx/dua-hau-khong-hat-tui-2kg-202107101526322905.jpg",
            //             )));
            //   },
            //   productImage:
            //       'https://cdn.tgdd.vn/Products/Images/8788/245525/bhx/dua-hau-khong-hat-tui-2kg-202107101526322905.jpg',
            //   productName: "Dưa hấu đỏ",
            // ),
            // SingalProduct(
            //   onTap: () {
            //     Navigator.of(context).push(MaterialPageRoute(
            //         builder: (context) => ProductOverview(
            //               productName: "Bưởi miền Tây ngon",
            //               productImage:
            //                   "https://nucuoimekong.com/wp-content/uploads/trai-cay-mien-tay-buoi-da-xanh.jpg",
            //             )));
            //   },
            //   productImage:
            //       'https://nucuoimekong.com/wp-content/uploads/trai-cay-mien-tay-buoi-da-xanh.jpg',
            //   productName: "Bưởi miền Tây ngon",
            // )
            // ],
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
              GestureDetector(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => Search(
                        search: productProvider.getMeatProductDataList,
                      ),
                    ),
                  );
                },
                child: Text(
                  "Xem tất cả",
                  style: TextStyle(color: Colors.grey),
                ),
              )
            ],
          ),
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: productProvider.getMeatProductDataList.map(
              (meatProductData) {
                return SingalProduct(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => ProductOverview(
                              productId: meatProductData.productId,
                              productName: meatProductData.productName,
                              productImage: meatProductData.productImage,
                              productPrice: meatProductData.productPrice,
                            )));
                  },
                  productId: meatProductData.productId,
                  productImage: meatProductData.productImage,
                  productName: meatProductData.productName,
                  productPrice: meatProductData.productPrice,
                );
              },
            ).toList(),
            // children: [
            //   SingalProduct(
            //     onTap: () {
            //       Navigator.of(context).push(MaterialPageRoute(
            //           builder: (context) => ProductOverview(
            //                 productName: "Thịt heo sạch",
            //                 productImage:
            //                     "https://cafefcdn.com/thumb_w/650/203337114487263232/2021/9/28/photo1632798710845-1632798710943181451693.png",
            //               )));
            //     },
            //     productImage:
            //         'https://cafefcdn.com/thumb_w/650/203337114487263232/2021/9/28/photo1632798710845-1632798710943181451693.png',
            //     productName: "Thịt heo sạch",
            //   ),
            //   SingalProduct(
            //     onTap: () {
            //       Navigator.of(context).push(MaterialPageRoute(
            //           builder: (context) => ProductOverview(
            //                 productName: "Thịt bò lai tươi",
            //                 productImage:
            //                     "https://giadinhnestle.com.vn/sites/default/files/2020-08/integration/sites/default/files/articles/images/images/12-2017/cach-bao-quan-thit-bo-chuan-vi-cho-bua-com-ngon.jpg",
            //               )));
            //     },
            //     productImage:
            //         'https://giadinhnestle.com.vn/sites/default/files/2020-08/integration/sites/default/files/articles/images/images/12-2017/cach-bao-quan-thit-bo-chuan-vi-cho-bua-com-ngon.jpg',
            //     productName: "Thịt bò lai tươi",
            //   ),
            //   SingalProduct(
            //     onTap: () {
            //       Navigator.of(context).push(MaterialPageRoute(
            //           builder: (context) => ProductOverview(
            //                 productName: "Thịt gà Kiến giống",
            //                 productImage:
            //                     "https://cdn.statically.io/img/gachaybo.com/f=auto/wp-content/uploads/2019/06/mua-thit-ga-sach-2.jpg",
            //               )));
            //     },
            //     productImage:
            //         'https://cdn.statically.io/img/gachaybo.com/f=auto/wp-content/uploads/2019/06/mua-thit-ga-sach-2.jpg',
            //     productName: "Thịt gà Kiến giống",
            //   ),
            //   SingalProduct(
            //     onTap: () {
            //       Navigator.of(context).push(MaterialPageRoute(
            //           builder: (context) => ProductOverview(
            //                 productName: "Thịt Vịt Lai om",
            //                 productImage:
            //                     "https://vit29.com/media/news/0308_vit-om-kieu-tau1.jpg",
            //               )));
            //     },
            //     productImage:
            //         'https://vit29.com/media/news/0308_vit-om-kieu-tau1.jpg',
            //     productName: "Thịt Vịt Lai om",
            //   )
            // ],
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
              GestureDetector(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => Search(
                        search: productProvider.getFishProductDataList,
                      ),
                    ),
                  );
                },
                child: Text(
                  "Xem tất cả",
                  style: TextStyle(color: Colors.grey),
                ),
              )
            ],
          ),
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: productProvider.getFishProductDataList.map(
              (fishProductData) {
                return SingalProduct(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => ProductOverview(
                              productId: fishProductData.productId,
                              productName: fishProductData.productName,
                              productImage: fishProductData.productImage,
                              productPrice: fishProductData.productPrice,
                            )));
                  },
                  productId: fishProductData.productId,
                  productImage: fishProductData.productImage,
                  productName: fishProductData.productName,
                  productPrice: fishProductData.productPrice,
                );
              },
            ).toList(),
            // children: [
            //   SingalProduct(
            //     onTap: () {
            //       Navigator.of(context).push(MaterialPageRoute(
            //           builder: (context) => ProductOverview(
            //                 productName: "Cá nục tươi",
            //                 productImage:
            //                     "https://haisantrungnam.vn/wp-content/uploads/2020/03/ca-nuc-1-600x400.jpg",
            //               )));
            //     },
            //     productImage:
            //         'https://haisantrungnam.vn/wp-content/uploads/2020/03/ca-nuc-1-600x400.jpg',
            //     productName: "Cá nục tươi",
            //   ),
            // SingalProduct(
            //   onTap: () {
            //     Navigator.of(context).push(MaterialPageRoute(
            //         builder: (context) => ProductOverview(
            //               productName: "Cá chép giòn",
            //               productImage:
            //                   "https://bhfood.vn/wp-content/uploads/2020/05/ca-chep-gion-bhfood-1.jpg",
            //             )));
            //   },
            //   productImage:
            //       'https://bhfood.vn/wp-content/uploads/2020/05/ca-chep-gion-bhfood-1.jpg',
            //   productName: "Cá chép giòn",
            // ),
            // SingalProduct(
            //   onTap: () {
            //     Navigator.of(context).push(MaterialPageRoute(
            //         builder: (context) => ProductOverview(
            //               productName: "Cá chẽm nước lợ",
            //               productImage:
            //                   "https://cdn.tgdd.vn/Files/2020/10/02/1295353/ca-chem-la-ca-gi-co-bao-nhieu-loai-ca-chem-202010021135030391.jpg",
            //             )));
            //   },
            //   productImage:
            //       'https://cdn.tgdd.vn/Files/2020/10/02/1295353/ca-chem-la-ca-gi-co-bao-nhieu-loai-ca-chem-202010021135030391.jpg',
            //   productName: "Cá chẽm nước lợ",
            // ),
            // SingalProduct(
            //   onTap: () {
            //     Navigator.of(context).push(MaterialPageRoute(
            //         builder: (context) => ProductOverview(
            //               productName: "Cá hồi biển",
            //               productImage:
            //                   "https://icdn.dantri.com.vn/thumb_w/640/2016/photo-1-1483059624194.jpg",
            //             )));
            //   },
            //   productImage:
            //       'https://icdn.dantri.com.vn/thumb_w/640/2016/photo-1-1483059624194.jpg',
            //   productName: "Cá hồi",
            // ),
            // SingalProduct(
            //   onTap: () {
            //     Navigator.of(context).push(MaterialPageRoute(
            //         builder: (context) => ProductOverview(
            //               productName: "Cá trê",
            //               productImage:
            //                   "https://baokhuyennong.com/wp-content/uploads/2020/03/hinh-anh-ca-tre.jpg",
            //             )));
            //   },
            //   productImage:
            //       'https://baokhuyennong.com/wp-content/uploads/2020/03/hinh-anh-ca-tre.jpg',
            //   productName: "Cá trê",
            // )
            // ],
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
  void initState() {
    ProductProvider productProvider = Provider.of(context, listen: false);
    productProvider.vegetableProductData();
    productProvider.fruitsProductData();
    productProvider.fishProductData();
    productProvider.meatProductData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    productProvider = Provider.of(context);
    UserProvider userProvider = Provider.of(context);
    userProvider.getUserData();
    return Scaffold(
      backgroundColor: Color(0xffcdcdcd),
      drawer: DrawerSide(
        userProvider: userProvider,
      ),
      appBar: AppBar(
          iconTheme: IconThemeData(color: Colors.white),
          title: Text(
            'MARKET ONLINE',
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
                      builder: (context) => Search(
                        search: productProvider.getAllProductSearch,
                      ),
                    ),
                  );
                },
                icon: Icon(Icons.search, size: 15, color: Colors.green),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5),
              child: GestureDetector(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => ReviewCart(),
                    ),
                  );
                },
                child: CircleAvatar(
                  radius: 15,
                  backgroundColor: Colors.white,
                  child: Icon(
                    Icons.shopping_cart,
                    size: 15,
                    color: Colors.green,
                  ),
                ),
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
                            'Giảm 50% vì dịch',
                            style: TextStyle(
                                fontSize: 30,
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 20),
                            child: Text(
                              'Trên tất cả các nhu yếu phẩm!',
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
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
