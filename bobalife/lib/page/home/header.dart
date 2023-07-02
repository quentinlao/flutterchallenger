import 'package:bobalife/services/size_config.dart';
import 'package:bobalife/widget/my_text.dart';
import 'package:flutter/material.dart';

class Header extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Container(
      width: SizeConfig.screenWidth,
      height: 200,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/background.JPG'),
          fit: BoxFit.cover,
        ),
      ),
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              MyText(
                data: 'Good Afternoon',
                fontSize: 26,
                fontFamily: "lato",
                fontWeight: FontWeight.bold,
              ),
              SizedBox(
                height: 5,
              ),
              MyText(
                data: 'It\'s time for afternoon tea.',
                fontSize: 16,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
