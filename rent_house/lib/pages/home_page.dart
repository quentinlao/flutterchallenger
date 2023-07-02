import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:clay_containers/clay_containers.dart';
import 'package:renthouse/pages/rent_detail_page.dart';
import 'package:renthouse/widget/card_image.dart';
import 'package:renthouse/widget/indicator.dart';

import '../data.dart';
import '../widget/neu_circular_icon_button.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  PageController pageController;
  double pageOffset = 0;

  @override
  void initState() {
    super.initState();
    pageController = PageController(viewportFraction: 0.7,);
    pageController.addListener(() {
      setState(() => pageOffset = pageController.page);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: baseColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// HEADER
          Flexible(
            flex: 2,
            child: SafeArea(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: NeuCircularIconButton(
                      baseColor: baseColor,
                      icon: Icons.dehaze,
                      iconColor: Colors.grey[400],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: NeuCircularIconButton(
                      baseColor: baseColor,
                      icon: CupertinoIcons.search,
                      iconColor: Colors.grey[400],
                    ),
                  ),
                ],
              ),
            ),
          ),
          /// DESCRIPTION
          Flexible(
            flex: 0,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        'Discover your',
                        style: TextStyle(fontStyle: FontStyle.italic,
                            color: grey, fontSize: 35, letterSpacing: 1.2),
                        textAlign: TextAlign.left,

                      ),
                      Text(
                        'new home',
                        style: TextStyle(fontWeight: FontWeight.bold,
                            color: blue, fontSize: 35),
                        textAlign: TextAlign.left,
                      ),
                    ],
                  ),
                  Text('Find your dream home', style: TextStyle(fontSize: 22,
                      color: Colors.grey, fontWeight: FontWeight.w500,
                      fontStyle: FontStyle.italic),
                  )
                ],
              ),
            ),
          ),
          /// SLIDER
          Flexible(
            flex: 3,
            child: PageView.builder(
              scrollDirection: Axis.horizontal,
                physics: BouncingScrollPhysics(),
                controller: pageController,
                itemCount: rents.length,
                itemBuilder: (ctx, int index){
                  return RentCard(index: index, rent: rents[index],);
                }
            ),
          ),
          /// INDICATOR
          Flexible(
            flex: 0,
            child: Indicator(
              controller: pageController,
              itemCount: rents.length,
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose(){
    pageController.dispose();
    super.dispose();
  }
}


class RentCard extends StatelessWidget {
  final Rent rent;
  final int index;

  RentCard({Key key, this.index, this.rent}): super(key: key);

  final Color baseColor = Color(0xFFf0f0f5);
  final Color parentColor = Color(0xFFf2f2f2);

  void onTap(context){
    Navigator.of(context).push(PageRouteBuilder(
      transitionDuration:
      const Duration(milliseconds: 500),
      pageBuilder: (ctx, animation, animation2) =>
          FadeTransition(
            opacity: animation,
            child: RentDetailPage(rent: rent,),
          ),
      )
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
      child: GestureDetector(
        onTap: () => onTap(context),
        child: ClayContainer(
          color: baseColor,
          parentColor: parentColor,
          curveType: CurveType.none,
          depth: 40,
          borderRadius: 50,
          spread: 5,
          customBorderRadius: BorderRadius.only(
              topRight: Radius.circular(10),
              bottomLeft: Radius.circular(20),
            topLeft: Radius.circular(10),
            bottomRight: Radius.circular(20),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// IMAGE
              Flexible(
                flex: 2,
                child: CardImage(url: rent.image,),
              ),
              /// DESCRIPTION
              Flexible(
                flex: 0,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 5),
                        child: Text(rent.location, style: TextStyle(color: Colors.grey[400], fontStyle: FontStyle.italic),),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 5),
                        child: Text(rent.shortDescription, style: TextStyle(color: Colors.grey[600], fontWeight: FontWeight.bold, fontSize: 18),),
                      ),
                    ],
                  ),
                ),
              ),
              /// PRICE
              Flexible(
                flex: 1,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('€${rent.price}', style: TextStyle(color: Colors.black87, fontWeight: FontWeight.bold,fontSize: 25),),
                        NeuCircularIconButton(
                          baseColor: baseColor,
                          icon: Icons.more_horiz,
                          iconColor: Colors.grey[400],
                        )
                      ],
                    ),
                  )
              )
            ],
          ),
        ),
      ),
    );
  }
}
