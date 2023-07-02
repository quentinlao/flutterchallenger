import 'package:bobalife/services/my_constant.dart';
import 'package:bobalife/services/size_config.dart';
import 'package:bobalife/widget/my_text.dart';
import 'package:flutter/material.dart';

class Detail extends StatelessWidget {
  final int index;
  const Detail({Key key, this.index}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.transparent,
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.launch,
              color: primary,
            ),
            onPressed: null,
          ),
        ],
        leading: IconButton(
          icon: Icon(
            Icons.chevron_left,
            color: primary,
          ),
          onPressed: () => Navigator.pop(context, false),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Stack(
            children: <Widget>[
              Hero(
                tag: index,
                child: Container(
                  height: SizeConfig.screenHeight,
                ),
              ),
              Positioned(
                top: 0,
                child: Container(
                  height: SizeConfig.screenHeight / 2.8,
                  width: SizeConfig.screenWidth,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("assets/images/detail1.JPG"),
                      fit: BoxFit.cover,
                      alignment: Alignment(0.0, -1.0),
                    ),
                  ),
                ),
              ),
              Positioned(
                top: 280,
                child: Container(
                  height: SizeConfig.screenHeight,
                  width: SizeConfig.screenWidth,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10)),
                ),
              ),
              Positioned(
                top: 300,
                left: 20,
                child: MyText(
                  data: 'Ice Latte Float',
                  fontSize: 20,
                  fontFamily: "lato",
                  fontWeight: FontWeight.bold,
                ),
              ),
              Positioned(
                top: 335,
                left: 20,
                child: Row(
                  children: <Widget>[
                    MyText(
                      data: '\$ 11',
                      fontSize: 18,
                      color: Colors.red,
                      fontFamily: "lato",
                      fontWeight: FontWeight.bold,
                    ),
                    MyText(
                      data: '/Cup',
                      fontSize: 14,
                      color: grey,
                      fontFamily: "lato",
                    ),
                  ],
                ),
              ),
              Positioned(
                top: 320,
                right: 20,
                child: Row(
                  children: <Widget>[
                    IconButton(
                      icon: Icon(
                        Icons.remove_circle_outline,
                        color: primary,
                      ),
                      onPressed: null,
                    ),
                    MyText(
                      data: '\$ 11/Cup',
                      fontSize: 14,
                      fontFamily: "lato",
                      fontWeight: FontWeight.bold,
                    ),
                    IconButton(
                      icon: Icon(
                        Icons.add_circle,
                        color: primary,
                      ),
                      onPressed: null,
                    ),
                  ],
                ),
              ),
              Positioned(
                top: 360,
                left: 20,
                child: Row(
                  children: <Widget>[
                    IconButton(
                      icon: Icon(
                        Icons.sentiment_satisfied,
                        color: grey,
                      ),
                      onPressed: null,
                    ),
                    MyText(
                      data: '12',
                      fontSize: 14,
                      color: grey,
                      fontFamily: "lato",
                      fontWeight: FontWeight.bold,
                    ),
                    IconButton(
                      icon: Icon(
                        Icons.favorite_border,
                        color: grey,
                      ),
                      onPressed: null,
                    ),
                    MyText(
                      data: '23',
                      fontSize: 14,
                      fontFamily: "lato",
                      color: grey,
                      fontWeight: FontWeight.bold,
                    ),
                    IconButton(
                      icon: Icon(
                        Icons.star_border,
                        color: grey,
                      ),
                      onPressed: null,
                    ),
                    MyText(
                      data: '34',
                      fontSize: 14,
                      color: grey,
                      fontFamily: "lato",
                      fontWeight: FontWeight.bold,
                    ),
                  ],
                ),
              ),
              Positioned(
                top: 420,
                left: 20,
                child: MyText(
                  data: 'About Ice latte Float',
                  fontSize: 20,
                  fontFamily: "lato",
                  fontWeight: FontWeight.bold,
                ),
              ),
              Positioned(
                top: 460,
                left: 20,
                child: Container(
                  width: SizeConfig.screenWidth - 50,
                  child: MyText(
                    alignment: TextAlign.justify,
                    color: grey,
                    data:
                        'About Ice latte Float About Ice latte Float About Ice latte Float'
                        'About Ice latte Float About Ice latte Float About Ice latte Float',
                    fontSize: 16,
                  ),
                ),
              ),
              Positioned(
                top: 550,
                left: 20,
                child: Row(
                  children: <Widget>[
                    MyText(
                      data: 'Size',
                      fontSize: 20,
                      fontFamily: "lato",
                      fontWeight: FontWeight.bold,
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Column(
                      children: <Widget>[
                        Image.asset("assets/images/s.jpg"),
                        MyText(
                          data: 'S',
                          color: grey,
                          fontSize: 14,
                        ),
                      ],
                    ),
                    Column(
                      children: <Widget>[
                        Image.asset("assets/images/m.jpg"),
                        MyText(
                          data: 'M',
                          color: grey,
                          fontSize: 14,
                        ),
                      ],
                    ),
                    Column(
                      children: <Widget>[
                        Image.asset("assets/images/l.jpg"),
                        MyText(
                          data: 'L',
                          color: grey,
                          fontSize: 14,
                        ),
                      ],
                    )
                  ],
                ),
              ),
              Positioned(
                top: 660,
                left: 20,
                child: MyText(
                  data: 'Address',
                  fontSize: 20,
                  fontFamily: "lato",
                  fontWeight: FontWeight.bold,
                ),
              ),
              Positioned(
                top: 690,
                left: 110,
                child: Row(
                  children: <Widget>[
                    IconButton(
                      icon: Icon(
                        Icons.add_circle_outline,
                        size: 18,
                        color: grey,
                      ),
                      onPressed: null,
                    ),
                    MyText(
                      data: 'Add Delivry Address',
                      fontSize: 14,
                      color: grey,
                    ),
                  ],
                ),
              ),
              Positioned(
                top: 720,
                left: 20,
                child: Row(
                  children: <Widget>[
                    Image.asset("assets/images/shopActive.jpg"),
                    Container(
                      height: 40.0,
                      child: RaisedButton(
                        onPressed: () {},
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(80.0)),
                        padding: EdgeInsets.all(0.0),
                        child: Ink(
                          decoration: BoxDecoration(
                              color: itemColor1,
                              borderRadius: BorderRadius.circular(30.0)),
                          child: Container(
                            constraints: BoxConstraints(
                                maxWidth: 300.0, minHeight: 50.0),
                            alignment: Alignment.center,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Icon(
                                  Icons.add,
                                  color: primary,
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                MyText(
                                  data: 'Add to Chart',
                                  fontFamily: 'lato',
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
