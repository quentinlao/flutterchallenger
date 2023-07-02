import 'package:flutter/material.dart';

class MyText extends StatelessWidget {
  final String data;
  final double fontSize;
  final FontStyle fontStyle;
  final FontWeight fontWeight;
  final Color color;
  final TextAlign alignment;
  final TextBaseline textBaseline;
  final TextOverflow textOverflow;
  final int maxLines;

  const MyText({
    Key key,
    @required this.data,
    this.fontSize = 16.0,
    this.fontStyle = FontStyle.normal,
    this.fontWeight = FontWeight.normal,
    this.color = Colors.black,
    this.alignment = TextAlign.center,
    this.textBaseline,
    this.textOverflow,
    this.maxLines,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      data,
      maxLines: maxLines,
      textAlign: alignment,
      overflow: textOverflow,
      style: TextStyle(
        fontStyle: fontStyle,
        fontWeight: fontWeight,
        fontSize: fontSize,
        color: color,
        textBaseline: textBaseline,
      ),
    );
  }
}
