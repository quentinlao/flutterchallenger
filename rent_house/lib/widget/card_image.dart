import 'package:flutter/material.dart';
import 'package:renthouse/data.dart';

class CardImage extends StatelessWidget {
  final String url;
  final double height;
  final double width;

  CardImage({
    Key key,
    this.url,
    this.height = 150,
    this.width = double.infinity
  }): super(key: key);

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: url,
      child: Card(
        margin: EdgeInsets.all(5.0),
        color: baseColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        clipBehavior: Clip.antiAlias,
        child: Image.network(
          url,
          height: height,
          width: width,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
