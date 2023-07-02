import 'package:flutter/material.dart';
import 'package:shoesshop/services/size_config.dart';
import 'package:shoesshop/widget/my_text.dart';

class LeftSideBar extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Container(
      width: 50,
      height: SizeConfig.blockSizeVertical * 35,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          InkWell(
              child: RotatedBox(
                  quarterTurns: 3,
                  child: MyText(data: 'Children', color: Colors.grey.shade400,
                  fontWeight: FontWeight.w700,
                  )
              )
          ),
          InkWell(
              child: RotatedBox(
                  quarterTurns: 3,
                  child: MyText(data: 'Women', fontWeight: FontWeight.w700)
              )
          ),
          InkWell(
              child: RotatedBox(
                  quarterTurns: 3,
                  child: MyText(data: 'Men', color: Colors.grey.shade400,
                      fontWeight: FontWeight.w700
                  )
              )
          )
        ],
      ),
    );
  }
}
