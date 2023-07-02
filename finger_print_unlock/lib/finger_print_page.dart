import 'package:flutter/material.dart';
import 'package:clay_containers/clay_containers.dart';

class FingerPrintPage extends StatefulWidget {
  @override
  _FingerPrintPageState createState() => _FingerPrintPageState();
}

class _FingerPrintPageState extends State<FingerPrintPage>  with TickerProviderStateMixin{
  final Color baseColor = Color(0xFF262626);
  final Color activatedColor = Color(0xFFffe066);
  final Color successfulAuthColor = Color(0xFF80e5ff);
  final Color desActivatedColor = Colors.black12.withAlpha(65);

  Color fingerPrintColor;
  Color indicatorColor;

  Animation<double> waveAnimation;
  AnimationController _waveAnimationController;

  double size = 200.0;

  @override
  void initState(){
    super.initState();

    fingerPrintColor = desActivatedColor;
    indicatorColor = activatedColor;

    _waveAnimationController = AnimationController(duration:const Duration(milliseconds: 2000), vsync: this);

    waveAnimation = Tween<double>(begin: 0, end: 10)
        .animate(_waveAnimationController)
      ..addListener((){
        setState((){
          size += waveAnimation.value;
//          if (size >= MediaQuery.of(context).size.height)
//            size = 0;
          if (waveAnimation.isCompleted){
            size = 0;
            indicatorColor = successfulAuthColor;
            fingerPrintColor = successfulAuthColor;
          }
        });
      });
    //_controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: baseColor,
      child: Stack(
        children: [
          /// WAVES
          Center(
            child: Opacity(
              opacity: 1 - waveAnimation.value / 10,
              child: ClayContainer(
                  color: baseColor,
                  height: size + 10,
                  width: size,
                  borderRadius: 115,
                  curveType: size % 100 == 0 ? CurveType.convex : CurveType.concave,
                  spread: 20,
                  depth: 10,
                  emboss: true,
              ),
            ),
          ),
          /// BUTTON
          Center(
            child: GestureDetector(
              onTapDown: (TapDownDetails detail){
                _waveAnimationController.reset();
                _waveAnimationController.forward();
              },
              onTapUp: (TapUpDetails details){
                _waveAnimationController.reset();
                size = 200.0;
              },
              child: ClayContainer(
                  color: baseColor,
                  height: 270,
                  width: 260,
                  borderRadius: 115,
                  curveType: CurveType.concave,
                  spread: 20,
                  depth: 8,
                  emboss: false,
                  child: Icon(Icons.fingerprint, color: fingerPrintColor, size: 120,)
              ),
            ),
          ),
          /// INDICATOR
          Align(
            alignment:  Alignment(0.0, 0.6),
            child: ClayContainer(
                color: baseColor,
                surfaceColor: indicatorColor,
                height: 10,
                width: 10,
                borderRadius: 50,
                curveType: CurveType.convex,
                spread: 3.7,
                depth: 70,
                emboss: true,
            ),
          )
        ],
      ),
    );
  }
}
