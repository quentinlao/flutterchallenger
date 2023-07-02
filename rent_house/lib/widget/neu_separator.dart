import 'package:clay_containers/clay_containers.dart';
import 'package:clay_containers/widgets/clay_containers.dart';
import 'package:flutter/material.dart';


class NeuSeparator extends StatelessWidget {

  final double width;
  final double height;
  final Color baseColor;

  NeuSeparator({Key key, this.width, this.height, this.baseColor}): super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClayContainer(
      color: baseColor,
      surfaceColor: baseColor.withAlpha(70),
      height: height,
      width: width,
      borderRadius: 10,
      depth: 70,
      emboss: true,
      spread: 2,
      curveType: CurveType.none,
    );
  }
}
