import 'package:flutter/material.dart';
import 'package:shoesshop/data.dart';
import 'package:shoesshop/page/my_constant.dart';
import 'package:shoesshop/widget/my_card.dart';
import 'package:shoesshop/widget/my_hero.dart';
import 'package:shoesshop/widget/my_text.dart';
import 'dart:math' as math;

class BottomCards extends StatelessWidget {
  final DataShoes data;

  BottomCards({Key key, this.data}): super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      width: 180,
      child: MyCard(
        child: Stack(
          children: [
            /// HEADER
            Align(
              alignment: Alignment.topCenter,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    height: 80,
                    width: 30,
                    color: pink,
                    child: Center(
                      child: RotatedBox(
                          quarterTurns: 3,
                          child: MyText(data: data.brandName, fontWeight: FontWeight.w600,)
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Icon(Icons.favorite_border, size: 30, color: Colors.black,),
                  )
                ],
              ),
            ),
            /// IMAGE
            Align(
              alignment: Alignment(0.0, -0.7),
              child: Transform(
                alignment: Alignment.center,
                transform: Matrix4.rotationY(math.pi),
                child: MyHero(
                    url: data.mainImageURL
                ),
              ),
            ),
            /// DESCRIPTION
            Align(
              alignment: Alignment(0.0, 1.6),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 2.0),
                    child: MyText(data: data.modelName, fontSize: 14, fontWeight: FontWeight.bold,),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 2.0),
                    child: MyText(data: '\$${data.price}', fontSize: 14, fontWeight: FontWeight.bold,),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
