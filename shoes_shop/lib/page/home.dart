import 'package:flutter/material.dart';
import 'package:shoesshop/data.dart';
import 'package:shoesshop/page/page1/bottom_cards.dart';
import 'package:shoesshop/page/page1/card_views.dart';
import 'package:shoesshop/page/page1/left_side_bar.dart';
import 'package:shoesshop/page/page1/tab_bar_items.dart';
import 'package:shoesshop/services/size_config.dart';
import 'package:shoesshop/widget/bottom_bar.dart';
import 'package:shoesshop/widget/my_text.dart';

import 'page1/header.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState(){
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return Scaffold(
      key: scaffoldKey,
      bottomNavigationBar: BottomBar(index: 1,),
      body: Column(
        children: [
          /// HEADER
          Header(),
          TabBarItems(),
          Stack(
            children: [
              /// LEFT SIDE BAR
              Align(alignment: Alignment.centerLeft,child: LeftSideBar()),
              /// MIDDLE CARD VIEW
              Align(
                alignment: Alignment.center,
                child: CardViews(),
              ),
            ],
          ),
          /// MORE BAR
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 15),
                  child: MyText(data: 'More', fontWeight: FontWeight.w700, fontSize: 20,),
                ),
                Transform.scale(
                    scale: 2.5,
                    child: MyText(data: '→', fontWeight: FontWeight.w700, fontSize: 20,)
                )
              ],
            ),
          ),
          /// BOTTOM LIST
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(top: 5.0),
              child: ListView.builder(
                physics: BouncingScrollPhysics(),
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: subShoesList.length,
                  itemBuilder: (ctx, index){
                    return BottomCards(
                      data: subShoesList[index]
                    );
                  }
              ),
            ),
          )
        ],
      ),
    );
  }

  @override
  void dispose(){
    super.dispose();
  }
}
