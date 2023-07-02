import 'package:bobalife/services/my_constant.dart';
import 'package:flutter/material.dart';

import 'my_text.dart';

class MyAppBar extends StatelessWidget with PreferredSizeWidget {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      iconTheme: new IconThemeData(color: primary),
      title: Container(
        height: 30,
        width: 250,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.0),
          color: Colors.white.withOpacity(0.9),
        ),
      ),
      elevation: 0.0,
      backgroundColor: Colors.transparent,
      actions: <Widget>[
        IconButton(
          icon: Icon(
            Icons.account_circle,
            color: primary,
          ),
        )
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
