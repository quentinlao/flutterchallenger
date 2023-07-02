import 'package:clay_containers/constants.dart';
import 'package:clay_containers/widgets/clay_containers.dart';
import 'package:flutter/material.dart';


class Indicator extends StatelessWidget {
  Indicator({
    this.controller,
    this.itemCount: 0,
  }) : assert(controller != null);

  /// PageView Controller
  final PageController controller;

  /// Number of indicators
  final int itemCount;

  /// Ordinary colours
  final Color normalColor = Color(0xFFcce0ff);

  /// Selected color
  final Color selectedColor = Color(0xFFd699ff);

  /// Size of points
  final double size = 15.0;

  /// Spacing of points
  final double spacing = 4.0;

  final Color baseColor = Color(0xFF99c2ff);

  /// Point Widget
  Widget _buildIndicator(
      int index, int pageCount, double dotSize, double spacing) {
    // Is the current page selected?
    bool isCurrentPageSelected = index ==
        (controller.page != null ? controller.page.round() % pageCount : 0);

    return new Container(
      height: size,
      width: size + (5 * spacing),
      child: new Center(
        child: ClayContainer(
          color: baseColor,
          surfaceColor: isCurrentPageSelected ? normalColor  : baseColor,
          height: dotSize,
          width: dotSize,
          spread: 1.0,
          borderRadius: 50,
          curveType: CurveType.concave,
          emboss: isCurrentPageSelected,
          depth: 30,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return new Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: new List<Widget>.generate(itemCount, (int index) {
        return _buildIndicator(index, itemCount, size, spacing);
      }),
    );
  }
}

