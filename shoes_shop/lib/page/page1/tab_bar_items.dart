import 'package:flutter/material.dart';
import 'package:shoesshop/services/size_config.dart';
import 'package:shoesshop/widget/my_text.dart';

class TabBarItems extends StatelessWidget {

  static final List<String> itemsTitle = ['Vans', 'Nike', 'Addidas', 'Puma', 'Converse', 'Jordan'];

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return SizedBox(
      width: SizeConfig.screenWidth,
      height: 70,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: itemsTitle.length,
          physics: BouncingScrollPhysics(),
          shrinkWrap: true,
          padding: EdgeInsets.symmetric(horizontal: 5.0),
          itemBuilder: (ctx, index){
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5.0),
              child: MyText(
                data: itemsTitle[index], fontWeight: FontWeight.w800, fontSize: 20,
                maxLines: 1,
              ),
            );
          }),
    );
  }
}