import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyText extends StatelessWidget {
  final String data;
  final double fontSize;
  final String fontFamily;
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
    this.fontFamily = "opensans",
    this.fontSize = 16.0,
    this.fontStyle = FontStyle.normal,
    this.fontWeight = FontWeight.normal,
    this.color = Colors.black,
    this.alignment = TextAlign.justify,
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
      style: fontFamily == "roboto"
          ? GoogleFonts.roboto(
              fontStyle: fontStyle,
              fontWeight: fontWeight,
              fontSize: fontSize,
              color: color,
              textBaseline: textBaseline,
            )
          : GoogleFonts.openSans(
              fontStyle: fontStyle,
              fontWeight: fontWeight,
              fontSize: fontSize,
              color: color,
              textBaseline: textBaseline,
            ),
    );
  }
}
