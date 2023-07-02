import 'package:flutter/material.dart';

class MyCard extends StatelessWidget {
  final Widget child;
  final double borderRadius;
  final Color color;
  final double elevation;

  const MyCard({Key key,
    this.child,
    this.borderRadius = 8.0,
    this.color = Colors.white,
    this.elevation = 3
  })
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(borderRadius)),
      clipBehavior: Clip.antiAlias,
      elevation: elevation,
      color: color,
      child: child,
    );
  }
}