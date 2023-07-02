import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:renthouse/widget/card_image.dart';
import 'package:renthouse/widget/card_rent_details.dart';
import 'package:renthouse/widget/neu_circular_icon_button.dart';
import 'package:renthouse/widget/neu_separator.dart';

import '../data.dart';
import 'dart:math' as math;

class RentDetailPage extends StatelessWidget {

  final Rent rent;

  RentDetailPage({Key key, this.rent}): super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: baseColor,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //SafeArea(child: Container(width: 0.0, height: 0.0,),),
          /// BACK BUTTON
          InkWell(
            onTap: () {
              print('toto');
              Navigator.pop(context);
            },
            child: Padding(
              padding: const EdgeInsets.only(top: 35.0, left: 15.0, right: 15.0, bottom: 10.0),
              child: NeuCircularIconButton(
                baseColor: baseColor,
                icon: Icons.arrow_back,
                iconColor: Colors.grey[400],
                height: 40,
                width: 40,
              ),
            ),
          ),
          /// IMAGE
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            child: CardImage(url: rent.image, height: 180,),
          ),
          /// DESCRIPTION
          Flexible(
            flex: 1,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0,),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 5),
                    child: Text(rent.location,
                      style: TextStyle(color: Colors.grey[400], fontStyle: FontStyle.italic, fontSize: 16),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 5),
                    child: Text(rent.shortDescription,
                      style: TextStyle(color: Colors.grey[600], fontWeight: FontWeight.bold, fontSize: 22),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
            ),
          ),
          /// PEOPLE LIKES AND REVIEWS
          Flexible(
            flex: 0,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 10.0),
              child: Column(
                children: [
                  /// PEOPLE LIKED
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        /// IMAGES
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            CardImage(
                              url: 'https://randomuser.me/api/portraits/women/18.jpg',
                              height: 50,
                              width: 50,
                            ),
                            CardImage(
                              url: 'https://randomuser.me/api/portraits/men/18.jpg',
                              height: 50,
                              width: 50,
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text('+121 liked this', style: TextStyle(fontSize: 14, color: Colors.grey[500]),),
                            )
                          ],
                        ),
                        /// LIKE
                        NeuCircularIconButton(
                          baseColor: baseColor,
                          icon: Icons.favorite,
                          iconColor: blue,
                          height: 40,
                          width: 40,
                          size: 20,
                        )
                      ],
                    ),
                  ),
                  /// PRICE & REVIEW
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        /// PRICE
                        Text('€ ${rent.price}',
                          style: TextStyle(fontSize: 25, color: Colors.black54, fontWeight: FontWeight.bold),
                        ),
                        Row(
                          children: [
                            /// REVIEW
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 15.0),
                              child: Text('Reviews',
                                style: TextStyle(fontSize: 18, color: Colors.grey[500],),
                              ),
                            ),
                            NeuCircularIconButton(
                              baseColor: baseColor,
                              icon: Icons.arrow_forward,
                              iconColor: Colors.grey[400],
                              height: 40,
                              width: 40,
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          /// SEPARATOR
          NeuSeparator(height: 2.0, baseColor: baseColor,),
          /// GEO LOCALISATION
          Flexible(
            flex: 1,
            child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(rent.cityLocation,
                    style: TextStyle(color: Colors.grey[600], fontWeight: FontWeight.bold, fontSize: 22),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  /// location button
                  Transform.rotate(
                    angle: -math.pi / 6,
                    child: NeuCircularIconButton(
                      baseColor: baseColor,
                      surfaceColor: blue,
                      icon: Icons.send,
                      iconColor: baseColor,
                      height: 40,
                      width: 40,
                      size: 20,
                    ),
                  )
                ],
              ),
            ),
          ),
          /// SEPARATOR
          NeuSeparator(height: 2.0, baseColor: baseColor,),
          /// DETAILS LIST
          Flexible(
            flex: 2,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                physics: BouncingScrollPhysics(),
                itemCount: rent.details.length,
                itemBuilder: (BuildContext ctx, int index){
                  return CardRentDetails(details: rents[index].details, icon: icons[index], index: index,);
                }
            ),
          )
        ],
      ),
    );
  }
}
