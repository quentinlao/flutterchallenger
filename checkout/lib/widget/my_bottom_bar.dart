import 'dart:async';

import 'package:flutter/material.dart';
import 'package:checkout/services/my_constant.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';

import 'my_text.dart';

class MyBottomBar extends StatelessWidget {
  final int index;
  final RoundedLoadingButtonController _btnController =
      new RoundedLoadingButtonController();

  MyBottomBar({Key key, this.index}) : super(key: key);

  void _doSomething() async {
    Timer(Duration(seconds: 3), () {
      _btnController.success();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      decoration: BoxDecoration(
        color: blue,
        borderRadius: BorderRadius.only(
            topLeft: const Radius.circular(20.0),
            topRight: const Radius.circular(20.0)),
      ),
      child: Padding(
        padding: const EdgeInsets.only(top: 18.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Container(
              width: 100,
              child: Padding(
                padding: const EdgeInsets.only(top: 11.0),
                child: MyText(
                  data: "Items | \$33.33 ",
                  fontSize: 14,
                  color: Colors.white,
                ),
              ),
            ),
            Container(
                height: 40.0,
                width: 100,
                child: RoundedLoadingButton(
                  color: Colors.white,
                  child: MyText(
                    data: 'Checkout',
                    color: blue,
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    fontFamily: "roboto",
                  ),
                  controller: _btnController,
                  onPressed: _doSomething,
                  valueColor: blue,
                ))
          ],
        ),
      ),
    );
  }
}
