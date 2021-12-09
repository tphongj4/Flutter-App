import 'package:flutter/material.dart';
import 'package:market_online_app/config/colors.dart';
import 'package:market_online_app/screens_app/cart_review/cart_review.dart';
import 'package:market_online_app/screens_app/home_page/home_screen.dart';
import 'package:market_online_app/screens_app/main_profile/my_profile.dart';

class DrawerSide extends StatelessWidget {
  Widget listTile({String title, IconData iconData, Function onTap}) {
    return ListTile(
      onTap: onTap,
      leading: Icon(
        iconData,
        size: 32,
      ),
      title: Text(
        title,
        style: TextStyle(color: textColor),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        width: 100,
        color: scaffoldBackgroundColor,
        child: ListView(
          children: [
            DrawerHeader(
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    CircleAvatar(
                      radius: 43,
                      backgroundColor: Colors.green,
                      child: CircleAvatar(
                        backgroundColor: Colors.white,
                        backgroundImage: NetworkImage(
                          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSy7nFdX1g_CVR4WyP5LgKOGytP0J8PE53_RQ&usqp=CAU",
                        ),
                        radius: 40,
                      ),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Welcome Admin", style: TextStyle(color: Colors.red),),
                        Text(
                          "admin@gmail.com",style: TextStyle(color: Colors.green)
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
            listTile(
              iconData: Icons.home_outlined,
              title: "Trang chủ",
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => HomeScreen(),
                    ),
                  );
                }
            ),
            listTile(
              iconData: Icons.shop_outlined,
              title: "Xem lại giỏ hàng",
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => ReviewCart(),
                    ),
                  );
                }
            ),
            listTile(
              iconData: Icons.person_outlined,
              title: "Hồ sơ của bạn",
              onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => MyProfile(),
                    ),
                  );
                }),
            listTile(
                iconData: Icons.notifications_outlined, title: "Thông báo"),
            listTile(iconData: Icons.star_outline, title: "Xếp hạng và đánh giá"),
            listTile(
                iconData: Icons.favorite_outline,
                title: "Sản phẩm yêu thích",
            ),
            listTile(iconData: Icons.copy_outlined, title: "Phản hồi chất lượng"),
            listTile(iconData: Icons.format_quote_outlined, title: "Hỏi đáp"),
            Container(
              height: 350,
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Liên hệ hỗ trợ"),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Text("Gọi: "),
                      SizedBox(
                        width: 10,
                      ),
                      Text("0934717617"),
                    ],
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        Text("Gửi mail: "),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          "Team7@gmail.com",
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
