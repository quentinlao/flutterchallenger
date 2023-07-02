import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shoesshop/services/size_config.dart';
import 'package:shoesshop/widget/my_card.dart';
import 'package:shoesshop/widget/my_text.dart';

class Header extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return SafeArea(
      child: Container(
        width: SizeConfig.screenWidth,
        height: 50,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            /// TITLE
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5.0),
              child: Text('Discover',
                style: TextStyle(color: Colors.black, fontWeight: FontWeight.w800,
                    fontSize: 22, letterSpacing: 0.9),
              ),
            ),
            /// BUTTONS
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: _buildActionButtons(),
            )
          ],
        )
      ),
    );
  }

  List<Widget> _buildActionButtons(){
    List<Widget> actions = List();
    actions.add(
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: MyCard(
          color: Colors.grey[300],
          child: Icon(CupertinoIcons.search, color: Colors.black, size: 25,),
        ),
      )
    );

    actions.add(
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: MyCard(
            color: Colors.grey[300],
            child: Icon(CupertinoIcons.bell, color: Colors.black, size: 25,),
          ),
        )
    );

    return actions;
  }
}
