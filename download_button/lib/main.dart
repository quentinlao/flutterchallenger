import 'package:clay_containers/clay_containers.dart';
import 'package:flutter/material.dart';
import 'package:sleek_circular_slider/sleek_circular_slider.dart';
import 'package:flutter_svg/flutter_svg.dart';

final customWidth05 = CustomSliderWidths(trackWidth: 8, progressBarWidth: 10, shadowWidth: 15);

final customColors05 = CustomSliderColors(
    dotColor: Color(0xFFffff00).withOpacity(0),
    trackColor: Colors.transparent,
    progressBarColors: [Color(0xFFffcc00).withAlpha(50), Color(0xFFffd11a).withAlpha(50)],
    shadowColor: Color(0xFFffff00),
    shadowMaxOpacity: 0.07);

final info05 = InfoProperties(
    mainLabelStyle: TextStyle(
        color: Colors.white, fontSize: 0.0, fontWeight: FontWeight.w600),
    modifier: (double value) {
      ///final time = printDuration(Duration(seconds: value.toInt()));
      return null;
    }
);

final CircularSliderAppearance appearance05 = CircularSliderAppearance(
    customWidths: customWidth05,
    customColors: customColors05,
    infoProperties: info05,
    startAngle: 270,
    angleRange: 360,
    size: 200.0
);



class DownloadButtonPage extends StatefulWidget {
  DownloadButtonPage({Key key}) : super(key: key);

  _DownloadButtonPageState createState() => _DownloadButtonPageState();
}

class _DownloadButtonPageState extends State<DownloadButtonPage> with SingleTickerProviderStateMixin{
  Color baseColor = Color(0xFFf2f2f2);
  double loading = 0.0;
  Color cloudColor = Colors.black45;

  bool isPushed = false;

  Animation<double> animation;
  AnimationController _controller;

  @override
  void initState(){
    super.initState();

    _controller = AnimationController(duration:const Duration(seconds: 5), vsync: this);
    animation =Tween<double>(begin: 0, end: 100).animate(_controller)
      ..addListener((){
        setState((){
          // The state that has changed here is the animation objects value
          loading = animation.value;
          if (loading >= 100.0)
            cloudColor = Color(0xFFffd11a).withAlpha(90);
        });
      });
    //_controller.forward();
  }


  @override
  void dispose() {
   _controller.dispose();
    super.dispose();
  }

  void onTapPushButton(){
    _controller.reset();
    _controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        color: baseColor,
        child: Stack(
          children: [
            /// EXTERNAL CIRCLE
            Center(
              child: ClayContainer(
                  color: baseColor,
                  surfaceColor: Colors.grey[400],
                  height: 260,
                  width: 260,
                  borderRadius: 200,
                  curveType: CurveType.concave,
                  spread: 10,
                  depth: 20,
                  emboss: false,
                  child: null
              ),
            ),
            /// CENTRAL BUTTON
            Center(
              child: ClayContainer(
                  color: baseColor,
                  height: 240,
                  width: 240,
                  borderRadius: 200,
                  curveType: CurveType.convex,
                  spread: 30,
                  depth: 50,
                  child: null
              ),
            ),
            /// circular slider
            Center(
                child: Container(
                    width: 260,
                    height: 260,
                    color: Colors.transparent,
                    child: SleekCircularSlider(
                      appearance: appearance05,
                      min: 0,
                      max: 100,
                      initialValue: loading,
                      onChange: (double value) {},
                      onChangeStart: (double startValue) {},
                      onChangeEnd: (double endValue) {},
                    )
                )
            ),
            /// INNER CIRCLE
            Center(
              child: ClayContainer(
                  color: baseColor,
                  height: 150,
                  width: 150,
                  borderRadius: 200,
                  curveType: !isPushed ? CurveType.convex : CurveType.concave,
                  spread: 1,
                  depth: 20,
                  emboss: true,
                  child: null
              ),
            ),
            /// ICON
            Center(
              child: GestureDetector(
                //onTap: () => onTapPushButton(),
                onTapDown: (TapDownDetails details) {
                  setState(() {
                    isPushed = false;
                  });
                },
                onTapUp: (TapUpDetails details){
                  setState(() {
                    isPushed = true;
                  });
                  onTapPushButton();
                },
                child: SvgPicture.asset(
                  'asset/download.svg',
                  color: cloudColor,
                  fit: BoxFit.scaleDown,
                ),
              ),
            ),
            /// LOADING TEXT
            Align(
                alignment: Alignment(0.0, 0.6),
                child: Material(
                  color: Colors.transparent,
                  child: ClayText(
                    loading < 100 ? "${loading.roundToDouble()}% Downloading..." : 'COMPLETE',
                    emboss: true,
                    size: 27,
                    textColor: Colors.grey[300],
                  ),
                )
            ),
          ],
        ),
      ),
    );
  }

}


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Download Button',
      debugShowCheckedModeBanner: false,
      home: DownloadButtonPage(),
    );
  }
}
