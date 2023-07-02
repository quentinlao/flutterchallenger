import 'package:flutter/material.dart';
import 'package:shoesshop/data.dart';
import 'package:shoesshop/page/home.dart';
import 'package:shoesshop/page/my_constant.dart';
import 'package:shoesshop/services/size_config.dart';
import 'package:shoesshop/widget/my_card.dart';
import 'package:shoesshop/widget/my_text.dart';

class ShoesDetail extends StatelessWidget {
  final DataShoes data;
  final int index;

  const ShoesDetail({Key key,this.data, this.index}): super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            /// IMAGE
            Flexible(
              flex: 3,
              child: Stack(
                fit: StackFit.expand,
                overflow: Overflow.visible,
                children: [
                  /// ROUNDED BACKGROUD
                  Positioned(
                    top: -SizeConfig.screenWidth / 2,
                    right: -SizeConfig.screenWidth / 2,
                    width: SizeConfig.screenWidth * 1.6,
                    height: SizeConfig.screenWidth * 1.5,
                    child: Hero(
                      tag: '${data.mainImageURL}-${data.backgroundColor.toString()}',
                      child: Container(
                        decoration: BoxDecoration(
                          color: data.backgroundColor.withAlpha(70),
                          shape: BoxShape.circle,
                        ),
                      ),
                    ),
                  ),
                  /// HEADER
                  Align(
                    alignment: Alignment.topCenter,
                    child: SafeArea(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            /// ARROW
                            GestureDetector(
                              onTap: () => Navigator.of(context).push(PageRouteBuilder(
                                transitionDuration:
                                const Duration(milliseconds: 800),
                                pageBuilder: (_, animation, __) =>
                                    FadeTransition(
                                      opacity: animation,
                                      child: Home(),
                                    ),
                              )
                              ),
                              child: Padding(
                                padding: const EdgeInsets.only(bottom: 15),
                                child: Transform.scale(
                                    scale: 2.0,
                                    child: MyText(data: '←',
                                      fontWeight: FontWeight.w700, fontSize: 20,
                                      color: Colors.white,
                                    )
                                ),
                              ),
                            ),
                            /// BRAND'S NAME
                            Hero(
                              tag: '${data.brandName}$index',
                              child: MyText(data: data.brandName,
                                fontWeight: FontWeight.bold, fontSize: 25,
                                color: Colors.white,
                              ),
                            ),
                            /// HEART CARD
                            MyCard(
                              color: data.backgroundColor.withAlpha(50),
                              elevation: 1,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Icon(Icons.favorite_border, size: 30, color: Colors.white,),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  /// IMAGE
                  Align(
                    alignment: Alignment.center,
                    child: Hero(
                      tag: data.mainImageURL,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 20),
                        child: Transform.scale(
                          scale: 1.5,
                          child: Container(
                              width: SizeConfig.screenWidth - 100,
                              height: SizeConfig.screenHeight / 4,
                              child: Image.network(data.mainImageURL,)
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
            /// THUMBNAILS
            Flexible(
              flex: 1,
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 10.0),
                decoration: BoxDecoration(
                  color: Colors.transparent,
                  border: Border(
                    bottom: BorderSide(
                      width: 3.5,
                      color: grey3,
                    )
                  )
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: List.generate(data.thumbnails.length, (id){
                    return Image.network(data.thumbnails[id], width: 80, height: 70,);
                  }),
                ),
              ),
            ),
            /// DESCRIPTION & DETAILS
            Flexible(
              flex: 2,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      MyText(data: data.modelName, fontWeight: FontWeight.bold,),
                      MyText(data: '\$${data.price}', fontWeight: FontWeight.bold,)
                    ],
                  ),
                  SizedBox(
                    height: 60,
                    child: Text(
                      data.description,
                      style: TextStyle(fontSize: 13, ), maxLines: 4,
                      textAlign: TextAlign.left, overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  Text(
                    'MORE DETAILS',
                    style: TextStyle(decoration: TextDecoration.underline, fontSize: 15),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Flexible(
                          flex: 3,
                          child: Text(
                            'Size',
                            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                        ),
                        Flexible(
                          flex: 1,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'UK',
                                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                              ),
                              Text(
                                'USA',
                                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: grey4),
                              ),
                            ],
                          )
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Type',
                          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          '7.5',
                          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          'B',
                          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          '9.5',
                          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            Flexible(
              flex: 0,
              child: FlatButton(
                  onPressed: null,
                  child: Container(
                    height: 40,
                    width: SizeConfig.screenWidth,
                      child: Card(
                          color: pink,
                          elevation: 1,
                          child: Center(
                              child: Text('ADD TO BAG', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),)
                          )
                      )
                  )
              ),
            )
          ],
        ),
      )
    );
  }
}
