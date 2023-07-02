import 'package:flutter/material.dart';
import 'package:shoesshop/data.dart';
import 'package:shoesshop/services/size_config.dart';
import 'package:shoesshop/widget/my_parallax_card.dart';

class CardViews extends StatefulWidget {
  @override
  _CardViewsState createState() => _CardViewsState();
}

class _CardViewsState extends State<CardViews> {
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
    SizeConfig().init(context);

    return Container(
      height: SizeConfig.blockSizeVertical * 40,
      width: SizeConfig.screenWidth,
      child: PageView.builder(
          controller: pageController,
          itemCount: shoesList.length,
          itemBuilder: (context, index){
            return MyParallaxCard(
              data: shoesList[index],
              offset: pageOffset - (index + 1),
              index: index,
            );
          }
      )
    );
  }
}

