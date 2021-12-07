import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  Widget singalProducts() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10),
      height: 230,
      width: 160,
      decoration: BoxDecoration(
        color: Color(0xffd9dad9),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 2,
            child: Image.network(
                'https://khothietke.net/wp-content/uploads/2021/03/PNG00030-rau-cai-cai-thia-2-tai-png-mien-phi.png'),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Rau cải tươi xanh',
                    style: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    '50k/1kg',
                    style: TextStyle(
                        color: Colors.grey, fontWeight: FontWeight.bold),
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Container(
                          padding: EdgeInsets.only(left: 5),
                          height: 30,
                          width: 50,
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.green),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Row(
                            children: [
                              Expanded(
                                  child: Text(
                                '50 Gram',
                                style: TextStyle(fontSize: 10),
                              )),
                              Center(
                                child: Icon(Icons.arrow_drop_down,
                                    size: 20, color: Colors.green),
                              )
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Expanded(
                          child: Container(
                        height: 30,
                        width: 50,
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.red),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.remove, size: 15, color: Colors.red),
                            Text(
                              '1',
                              style: TextStyle(
                                  color: Colors.red,
                                  fontWeight: FontWeight.bold),
                            ),
                            Icon(Icons.add, size: 15, color: Colors.red)
                          ],
                        ),
                      ))
                    ],
                  ),
                ],
              ),
            ),
          )
        ],
      ),
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
      drawer: Drawer(
        child: Container(
          color: Colors.green,
          child: ListView(
            children: [
              DrawerHeader(
                child: Row(
                  children: [
                    CircleAvatar(
                      backgroundColor: Colors.white,
                      radius: 43,
                      child: CircleAvatar(
                        radius: 40,
                        backgroundColor: Colors.greenAccent,
                      ),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Welcome Customer"),
                        SizedBox(
                          height: 7,
                        ),
                        Container(
                          height: 30,
                          child: OutlineButton(
                            onPressed: () {},
                            child: Text("Login"),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15),
                                side: BorderSide(
                                  width: 2,
                                )),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
              listTittle(icon: Icons.home_outlined, tittle: "Home"),
              listTittle(icon: Icons.shop_outlined, tittle: "Review Cart"),
              listTittle(icon: Icons.person_outlined, tittle: "My Profile"),
              listTittle(
                  icon: Icons.notifications_outlined, tittle: "Notification"),
              listTittle(icon: Icons.star_outlined, tittle: "Rating & Review"),
              listTittle(icon: Icons.favorite_outlined, tittle: "Wishlist"),
              listTittle(
                  icon: Icons.copy_outlined, tittle: "Raise a Complaint"),
              listTittle(icon: Icons.format_quote_outlined, tittle: "FAQs"),
              Container(
                height: 350,
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Contact Support"),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Text("Phone number:"),
                        SizedBox(
                          width: 10,
                        ),
                        Text("0934717617")
                      ],
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          Text("Mail us:"),
                          SizedBox(
                            width: 10,
                          ),
                          Text("Team7@gmail.com")
                        ],
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
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
                  singalProducts(),
                  singalProducts(),
                  singalProducts(),
                  singalProducts(),
                  singalProducts(),
                ],
              ),
            ),
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
                  singalProducts(),
                  singalProducts(),
                  singalProducts(),
                  singalProducts(),
                  singalProducts(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
