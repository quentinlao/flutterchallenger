import 'package:clay_containers/clay_containers.dart';
import 'package:flutter/material.dart';

class NeuCircularIconButton extends StatelessWidget {
  final IconData icon;
  final Color baseColor;
  final Color surfaceColor;
  final Color iconColor;
  final double size;
  final Function onPress;
  final double height;
  final double width;

  const NeuCircularIconButton({Key key,
    this.icon,
    this.baseColor,
    this.surfaceColor,
    this.size = 25.0,
    this.height = 50.0,
    this.width = 50.0,
    this.iconColor,
    this.onPress
  }): super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onPress,
      child: ClayContainer(
        color: baseColor,
        surfaceColor: surfaceColor,
        height: height,
        width: width,
        borderRadius: 30,
        child: Icon(icon, color: iconColor, size: size,),
      ),
    );
  }
}
