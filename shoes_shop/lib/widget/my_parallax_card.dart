import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shoesshop/data.dart';
import 'package:shoesshop/page/shoes_detail/shoes_detail_page.dart';
import 'package:shoesshop/services/size_config.dart';
import 'dart:math' as math;
import 'package:shoesshop/widget/my_hero.dart';
import 'my_text.dart';


class MyParallaxCard extends StatelessWidget{
  final DataShoes data;
  final double offset;
  final int index;

  const MyParallaxCard({Key key,this.data, this.offset, this.index}): super(key: key);

  void onTap(context){
    Navigator.of(context).push(PageRouteBuilder(
      transitionDuration:
      const Duration(milliseconds: 1000),
      pageBuilder: (_, animation, __) =>
          FadeTransition(
            opacity: animation,
            child: ShoesDetail(
              data: data,
            ),
          ),
      )
    );
  }

  @override
  build(BuildContext context) {
    SizeConfig().init(context);
    double gauss = math.exp(-(math.pow((offset.abs() - 0.5), 2) / 0.08));
    final translationX = lerpDouble(0, -10, offset);

    final transform = Matrix4.identity();
    transform.setEntry(3, 2, 0.001);
    transform.translate(translationX);
    transform.rotateX(0.31 * offset.abs());
    transform.rotateY(-0.31 * -offset.abs());

    final transformImage = Matrix4.identity();
    transformImage.translate(translationX);
    transformImage.scale(1.4);



    return GestureDetector(
      onTap: () => onTap(context),
      child: Container(
        margin: const EdgeInsets.only(right: 50),
        child: Transform(
          transform: transform,
          child: Stack(
            overflow: Overflow.visible,
            children: [
              Align(
                alignment: Alignment.center,
                child: Hero(
                  tag: '${data.mainImageURL}-${data.backgroundColor.toString()}',
                  transitionOnUserGestures: true,
                  child: Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0)),
                    clipBehavior: Clip.antiAlias,
                    elevation: 0,
                    color: data.backgroundColor.withAlpha(70),
                    /// HEADER
                    child: CardHeader(data: data, offset: gauss,)
                  ),
                ),
              ),
              Align(
                  alignment: Alignment(1.0, 0.0),
                  child: Transform.rotate(
                      angle:  0.45 + -offset.abs() / 1.5,
                      child: Transform(
                        alignment: Alignment.center,
                        transform: transformImage,
                        child: MyHero(
                            url: data.mainImageURL,
                        ),
                      )
                  )
              ),
              Align(
                alignment: Alignment.bottomRight,
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Icon(CupertinoIcons.tags, color: Colors.white, size: 30,),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}


class CardHeader extends StatelessWidget {
  final double offset;
  final DataShoes data;

  const CardHeader({Key key, this.data, this.offset}): super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5.0, vertical: 10.0),
      child: Stack(
        children: [
          Align(
            alignment: Alignment.topCenter,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                /// INFORMATIONS
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Transform.translate(
                        offset: Offset(60 * offset, 0),
                        child: MyText(data: data.brandName, color: Colors.white,
                          fontSize: 16, textOverflow: TextOverflow.fade,),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Transform.translate(
                        offset: Offset(48 * offset, 0),
                        child: MyText(data: data.modelName, color: Colors.white,
                            fontSize: 18, textOverflow: TextOverflow.fade,
                            fontWeight: FontWeight.w800),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Transform.translate(
                        offset: Offset(60 * offset, 0),
                        child: MyText(data: '\$${data.price}', color: Colors.white,
                          fontSize: 16, textOverflow: TextOverflow.fade,),
                      ),
                    ),
                  ],
                ),
                /// LIKE BUTTON
                Icon(Icons.favorite_border, color: Colors.white, size: 30,)
              ],
            ),
          ),
        ],
      ),
    );
  }
}


