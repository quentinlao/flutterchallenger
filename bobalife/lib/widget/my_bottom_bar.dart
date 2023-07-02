import 'package:flutter/material.dart';

class MyBottomBar extends StatelessWidget {
  final int index;

  MyBottomBar({Key key, this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      //height: 70,
      color: Colors.white,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          IconButton(
            onPressed: null,
            icon: Image.asset(
              "assets/images/home.jpg",
            ),
          ),
          IconButton(
              onPressed: null,
              icon: Image.asset(
                "assets/images/locate.jpg",
              )),
          IconButton(
              onPressed: null,
              icon: Image.asset(
                "assets/images/shop.jpg",
              )),
          IconButton(
              onPressed: null,
              icon: Image.asset(
                "assets/images/profile.jpg",
              )),
        ],
      ),
    );
  }
}
