import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:reservation/page/detail/confirm/confirm.dart';
import 'package:reservation/page/detail/confirmation/confirmation.dart';
import 'package:reservation/services/my_constant.dart';

import 'my_text.dart';

class MyBottomBar extends StatelessWidget {
  final int index;

  MyBottomBar({Key key, this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(
          top: BorderSide(
            color: grey.withOpacity(0.7),
            width: 1.0,
          ),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.only(top: 18.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            index == 1
                ? Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      MyText(
                        data: "Order now and",
                        fontSize: 12,
                        color: grey,
                      ),
                      MyText(
                        data: "Earn discount",
                        fontFamily: "roboto",
                        fontSize: 16,
                      ),
                    ],
                  )
                : Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      MyText(
                        data: "Select date",
                        fontSize: 12,
                        color: grey,
                      ),
                      MyText(
                        data: "Reservation",
                        fontFamily: "roboto",
                        fontSize: 16,
                      ),
                    ],
                  ),
            Container(
              height: 40.0,
              child: RaisedButton(
                elevation: 0.0,
                onPressed: () {
                  switch (index) {
                    case 1:
                      Navigator.push(
                          context,
                          PageTransition(
                              type: PageTransitionType.leftToRight,
                              child: Confirmation()));
                      break;
                    case 2:
                      Navigator.push(
                          context,
                          PageTransition(
                              type: PageTransitionType.leftToRight,
                              child: Confirm()));
                      break;
                  }
                },
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5.0)),
                padding: EdgeInsets.all(0.0),
                child: Ink(
                  decoration: BoxDecoration(
                    color: red,
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                  child: Container(
                    constraints:
                        BoxConstraints(maxWidth: 150.0, minHeight: 50.0),
                    alignment: Alignment.center,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        index == 1
                            ? MyText(
                                data: 'Book Now',
                                color: Colors.white,
                              )
                            : MyText(
                                data: 'Next',
                                color: Colors.white,
                              ),
                      ],
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
