import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BottomBar extends StatelessWidget {
  final int index;

  BottomBar({Key key, this.index}): super(key: key);

  final Color red = Color(0xFFe6005c);

  @override
  Widget build(BuildContext context) {
    return Container(
      //height: 70,
      color: Colors.grey[200],
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: red.withAlpha(60),
                    blurRadius: 6.0,
                    spreadRadius: -8.0,
                    offset: Offset(
                      0.0,
                      3.0,
                    ),
                  ),
                ])
            ,
            child: IconButton(
              onPressed: null,
              icon: Icon(CupertinoIcons.home, color: index == 1 ? red : Colors.grey[800], size: 35,),
            ),
          ),
          IconButton(
            onPressed: null,
            icon: Icon(Icons.favorite_border, color: index == 2 ? red : Colors.grey[800], size: 35,),
          ),
          IconButton(
            onPressed: null,
            icon: Icon(Icons.bookmark_border, color: index == 3 ? red : Colors.grey[800], size: 35,),
          ),
          IconButton(
            onPressed: null,
            icon: Icon(Icons.shopping_cart, color: index == 4 ? red : Colors.grey[800], size: 35,),
          ),
          IconButton(
            onPressed: null,
            icon: Icon(Icons.person, color: index == 5 ? red : Colors.grey[800], size: 35,),
          )
        ],
      ),
    );
  }
}
