import 'package:flutter/material.dart';
import 'package:market_online_app/config/colors.dart';
import 'package:market_online_app/screens_app/home_page/drawer_side.dart';

class MyProfile extends StatelessWidget {
  @override

  Widget listTitle({IconData icon, String title}){
    return Column(
      children: [
        Divider(
          height: 1,
        ),
        ListTile(
          leading: Icon(icon),
          title: Text(title),
          trailing: Icon(Icons.arrow_forward_ios),
        )
      ],
    );
  }


  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green,
      appBar: AppBar(
        elevation: 0.0,
        title: Text(
          "Hồ sơ của bạn",
          style: TextStyle(fontSize: 18, color: Colors.white),
        ),
        backgroundColor: Colors.green,
      ),
      drawer: DrawerSide(),
      body: Stack(
        children: [
          Column(
            children: [
              Container(
                height: 90,
                color: Colors.green,
              ),
              Container(
                height: 530,
                width: double.infinity,
                padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10,),
                decoration: BoxDecoration(
                  color: scaffoldBackgroundColor,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30),
                      bottomLeft: Radius.circular(30.0),
                      bottomRight: Radius.circular(30.0),
                  ),
                ),
                child: ListView(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Container(
                          width: 250,
                          height: 80,
                          padding: EdgeInsets.only(left: 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Hien.HD",
                                    style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold,
                                        color: textColor),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Text("hienhdit@gmail.com")
                                ],
                              ),
                              CircleAvatar(
                                radius: 15,
                                backgroundColor: Colors.green,
                                child: CircleAvatar(
                                  radius: 12,
                                  child: Icon(
                                    Icons.edit,
                                    color: Colors.green,
                                  ),
                                  backgroundColor: scaffoldBackgroundColor,
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                    listTitle(
                      icon: Icons.shop_outlined,
                      title: "Đơn hàng"
                    ),
                    listTitle(
                        icon: Icons.location_on_outlined,
                        title: "Địa chỉ giao hàng"
                    ),
                    listTitle(
                        icon: Icons.person_outline,
                        title: "Giới thiệu bạn bè"
                    ),
                    listTitle(
                        icon: Icons.file_copy_outlined,
                        title: "Điều khoản & Điều kiện"
                    ),
                    listTitle(
                        icon: Icons.policy_outlined,
                        title: "Chính sách bảo mật"
                    ),
                    listTitle(
                        icon: Icons.add_chart,
                        title: "Thông tin"
                    ),
                    listTitle(
                        icon: Icons.exit_to_app_outlined,
                        title: "Đăng xuất"
                    )
                  ],
                ),
              )
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(top: 40, left: 30),
            child: CircleAvatar(
              radius: 50,
              backgroundColor: Colors.deepOrangeAccent,
              child: CircleAvatar(
                backgroundImage: NetworkImage(
                    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSy7nFdX1g_CVR4WyP5LgKOGytP0J8PE53_RQ&usqp=CAU"),
                radius: 45,
                backgroundColor: scaffoldBackgroundColor,
              ),
            ),
          )
        ],
      ),
    );
  }
}