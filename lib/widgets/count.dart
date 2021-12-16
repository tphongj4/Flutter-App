import 'package:flutter/material.dart';

class Count extends StatefulWidget {
  @override
  _CountState createState() => _CountState();
}

class _CountState extends State<Count> {
  int count = 1;
  bool isTrue = false;

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 30,
        width: 50,
        decoration: BoxDecoration(
          border: Border.all(color: Colors.red),
          borderRadius: BorderRadius.circular(8),
        ),
        child: isTrue == true
            ? Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  InkWell(
                    onTap: () {
                      if(count > 1){
                        setState(() {
                          count --;
                        });
                      }
                      if(count == 1){
                        setState(() {
                          isTrue = false;
                        });
                      }
                    },
                    child: Icon(
                      Icons.remove,
                      size: 15,
                      color: Colors.red,
                    ),
                  ),
                  // Icon(Icons.remove, size: 15, color: Colors.red),
                  Text(
                    "$count",
                    style: TextStyle(
                        color: Colors.red, fontWeight: FontWeight.bold),
                  ),
                  InkWell(
                    onTap: () {
                      setState(() {
                        count ++;
                      });
                    },
                    child: Icon(Icons.add, size: 15, color: Colors.red),
                  ),
                ],
              )
            : Center(
                child: InkWell(
                  onTap: () {
                    setState(() {
                      isTrue = true;
                    });
                  },
                  child: Text(
                    "Thêm",
                    style: TextStyle(color: Colors.red),
                  ),
                ),
              ));
  }
}
