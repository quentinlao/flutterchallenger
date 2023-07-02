import 'package:bobalife/page/detail/detail.dart';
import 'package:bobalife/page/home/header.dart';
import 'package:bobalife/services/my_constant.dart';
import 'package:bobalife/services/size_config.dart';
import 'package:bobalife/widget/my_app_bar.dart';
import 'package:bobalife/widget/my_bottom_bar.dart';
import 'package:bobalife/widget/my_text.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
  }

  Color chooseColor(int i) {
    Color color;
    switch (i) {
      case 0:
        color = itemColor1;
        break;
      case 1:
        color = itemColor2;
        break;
      case 2:
        color = itemColor3;
        break;
      case 3:
        color = itemColor4;
        break;
    }
    return color;
  }

  void onTap(context, index) {
    Navigator.of(context).push(PageRouteBuilder(
      transitionDuration: const Duration(milliseconds: 1000),
      pageBuilder: (_, animation, __) => FadeTransition(
        opacity: animation,
        child: Detail(index: index),
      ),
    ));
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return Scaffold(
        backgroundColor: yellow,
        key: scaffoldKey,
        bottomNavigationBar: MyBottomBar(
          index: 1,
        ),
        extendBodyBehindAppBar: true,
        appBar: MyAppBar(),
        drawer: Drawer(),
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Header(),
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.0),
                    color: Colors.white),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(
                          top: 20.0, left: 20, bottom: 10.0),
                      child: MyText(
                        data: 'Menu',
                        fontSize: 20,
                        fontFamily: "lato",
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Container(
                        height: SizeConfig.blockSizeVertical * 10,
                        width: SizeConfig.screenWidth,
                        child: ListView.builder(
                            itemCount: 5,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) {
                              return Padding(
                                padding: const EdgeInsets.only(
                                    left: 20.0, right: 10.0),
                                child: Column(
                                  children: <Widget>[
                                    Image.asset(
                                      "assets/images/menu${index + 1}.jpg",
                                      scale: 1.3,
                                    ),
                                    MyText(
                                      data: 'item${index + 1}',
                                      color: grey,
                                    )
                                  ],
                                ),
                              );
                            })),
                    Padding(
                      padding: const EdgeInsets.only(
                          top: 10.0, left: 20, bottom: 20.0),
                      child: MyText(
                        data: 'Best Seller Category',
                        fontSize: 20,
                        fontFamily: "lato",
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Container(
                        height: SizeConfig.blockSizeVertical * 22,
                        width: SizeConfig.screenWidth,
                        child: ListView.builder(
                            itemCount: 4,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) {
                              return Padding(
                                  padding: const EdgeInsets.only(left: 20.0),
                                  child: GestureDetector(
                                    onTap: () => onTap(context, index),
                                    child: Hero(
                                      tag: index,
                                      transitionOnUserGestures: true,
                                      child: Container(
                                        margin: EdgeInsets.only(bottom: 10),
                                        height: 60,
                                        width: 120,
                                        decoration: BoxDecoration(
                                          color: chooseColor(index),
                                          borderRadius:
                                              BorderRadius.circular(15.0),
                                          boxShadow: [
                                            BoxShadow(
                                              color: chooseColor(index)
                                                  .withOpacity(0.8),
                                              spreadRadius: 1,
                                              blurRadius: 5,
                                              offset: Offset(0,
                                                  3), // changes position of shadow
                                            ),
                                          ],
                                        ),
                                        child: Stack(
                                          children: <Widget>[
                                            Positioned(
                                              top: 20,
                                              left: 20,
                                              child: Image.asset(
                                                  "assets/images/item${index + 1}.jpg"),
                                            ),
                                            Positioned(
                                              bottom: 8,
                                              right: 15,
                                              child: MyText(
                                                data: "\$1${index + 1}",
                                                fontSize: 18,
                                                color: Colors.white,
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  ));
                            })),
                    Padding(
                      padding: const EdgeInsets.only(
                          top: 20.0, left: 20, bottom: 20.0),
                      child: MyText(
                        data: 'New Menu',
                        fontSize: 20,
                        fontFamily: "lato",
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 20.0),
                      child: Container(
                        height: SizeConfig.blockSizeVertical * 20,
                        width: SizeConfig.blockSizeHorizontal * 90,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage("assets/images/home3.jpg"),
                              fit: BoxFit.cover,
                              alignment: Alignment(0, -0.2)),
                          color: Colors.white,
                          borderRadius: BorderRadius.all(
                            const Radius.circular(10.0),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
                    Padding(
                      padding: const EdgeInsets.only(left: 5.0, right: 5.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Container(
                            height: SizeConfig.blockSizeVertical * 18,
                            width: SizeConfig.blockSizeHorizontal * 44,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage("assets/images/home1.jpg"),
                                  fit: BoxFit.cover,
                                  alignment: Alignment(0, 0)),
                              color: Colors.white,
                              borderRadius: BorderRadius.all(
                                const Radius.circular(10.0),
                              ),
                            ),
                          ),
                          Container(
                            height: SizeConfig.blockSizeVertical * 18,
                            width: SizeConfig.blockSizeHorizontal * 44,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage("assets/images/home2.jpg"),
                                  fit: BoxFit.cover,
                                  alignment: Alignment(0, 0)),
                              color: Colors.white,
                              borderRadius: BorderRadius.all(
                                const Radius.circular(10.0),
                              ),
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}
