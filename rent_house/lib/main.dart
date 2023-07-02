import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:renthouse/pages/home_page.dart';

void main() {
  runApp(NeumorphicApp());
}

class NeumorphicApp extends StatelessWidget {
  Color _color = Color(0xFFf2f2f2);

  @override
  Widget build(BuildContext context) {
//    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
//      statusBarColor: Colors.transparent,
//      statusBarBrightness: Brightness.light,
//      statusBarIconBrightness: Brightness.dark,
//      systemNavigationBarIconBrightness: Brightness.dark,
//      systemNavigationBarColor: _color,
//    ));

    return MaterialApp(
      title: 'Rent Houses',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: HomePage(),
    );
  }
}
