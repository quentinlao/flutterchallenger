import 'package:flutter/material.dart';

import 'my_hero.dart';

class MyCardImage extends StatelessWidget {
  final String imageUrl;
  final BoxFit fit;
  final double elevation;

  const MyCardImage({
    Key key,
    @required this.imageUrl,
    this.fit = BoxFit.cover,
    this.elevation = 3.0
  }): super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
        color: Colors.white,
        semanticContainer: true,
        clipBehavior: Clip.antiAliasWithSaveLayer,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        elevation: elevation,
        margin: EdgeInsets.all(5),
        child: MyHero(
          url: imageUrl,
          fit: fit,
        )
    );
  }
}
