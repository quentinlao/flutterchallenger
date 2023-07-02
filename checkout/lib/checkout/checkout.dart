import 'package:checkout/services/my_constant.dart';
import 'package:checkout/services/size_config.dart';
import 'package:checkout/widget/my_bottom_bar.dart';
import 'package:checkout/widget/my_text.dart';
import 'package:flutter/material.dart';

class Checkout extends StatefulWidget {
  @override
  _CheckoutState createState() => _CheckoutState();
}

class _CheckoutState extends State<Checkout> {
  TextEditingController _controllerNumber = TextEditingController();

  @override
  void initState() {
    super.initState();
    _controllerNumber.text = "1"; // Setting the initial value for the field.
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      backgroundColor: greyWhite,
      bottomNavigationBar: MyBottomBar(
        index: 1,
      ),
      appBar: AppBar(
        elevation: 3.0,
        backgroundColor: Colors.white,
        centerTitle: true,
        title: MyText(
          data: "Cart",
          fontWeight: FontWeight.bold,
          fontSize: 18,
        ),
        leading: IconButton(
          icon: Icon(
            Icons.chevron_left,
            color: primary,
          ),
          onPressed: () => Navigator.pop(context, false),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 20.0, bottom: 20.0),
              child: Container(
                color: Colors.white,
                child: ListTile(
                  leading: Image.network(
                    "https://mir-s3-cdn-cf.behance.net/project_modules/1400_opt_1/b375ec92071841.5e423ad6282e1.jpg",
                    scale: 9.0,
                    fit: BoxFit.none,
                    width: 60,
                    height: 60,
                    alignment: Alignment(0.9, 0),
                  ),
                  title: MyText(
                    data: 'SKIN AQUA',
                    fontSize: 18,
                    fontFamily: "roboto",
                    fontWeight: FontWeight.bold,
                  ),
                  subtitle: MyText(
                    data: 'Tone up UV Spray',
                    fontSize: 14,
                    color: grey,
                  ),
                ),
              ),
            ),
            Container(
              color: Colors.white,
              child: ListView.separated(
                separatorBuilder: (context, index) => Divider(
                  color: Colors.grey.withOpacity(0.3),
                  height: 1.0,
                  thickness: 1,
                ),
                shrinkWrap: true,
                itemCount: 3,
                itemBuilder: (BuildContext ctxt, int index) {
                  return Container(
                    height: 70,
                    child: ListTile(
                      title: MyText(
                        data: '• Sray tone ${index + 1}',
                        fontSize: 18,
                        fontFamily: "roboto",
                        fontWeight: FontWeight.bold,
                      ),
                      subtitle: Padding(
                        padding: const EdgeInsets.only(left: 10.0),
                        child: MyText(
                          data: '\$ ${index + 2}.88',
                          fontSize: 14,
                          color: grey,
                        ),
                      ),
                      trailing: Container(
                        width: 100,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: <Widget>[
                            InkWell(
                              child: Icon(
                                Icons.remove_circle_outline,
                                size: 24.0,
                                color: greyLow,
                              ),
                              onTap: () {
                                int currentValue =
                                    int.parse(_controllerNumber.text);
                                setState(() {
                                  currentValue--;
                                  _controllerNumber.text =
                                      (currentValue > 0 ? currentValue : 0)
                                          .toString(); // decrementing value
                                });
                              },
                            ),
                            MyText(
                              data: "${_controllerNumber.text}",
                              fontSize: 20,
                              fontFamily: "roboto",
                            ),
                            InkWell(
                              child: Icon(
                                Icons.add_circle,
                                size: 24.0,
                                color: blue,
                              ),
                              onTap: () {
                                int currentValue =
                                    int.parse(_controllerNumber.text);
                                setState(() {
                                  print("Setting state");
                                  currentValue++;
                                  _controllerNumber.text = (currentValue)
                                      .toString(); // incrementing value
                                });
                              },
                            ),
                          ],
                        ),
                      ),
                      isThreeLine: true,
                    ),
                  );
                },
              ),
            ),
            SizedBox(height: 20),
            Container(
              width: SizeConfig.screenWidth,
              height: 60,
              decoration: BoxDecoration(color: Colors.white),
              child: ListTile(
                leading: Icon(Icons.star_border),
                title: MyText(
                  data: 'Apply Coupon',
                  color: grey,
                  fontFamily: "roboto",
                  fontSize: 16,
                ),
              ),
            ),
            SizedBox(height: 20),
            CustomPaint(
                painter: BoxShadowPainter(),
                child: ClipPath(
                  clipper: TriangleClipper(),
                  child: Container(
                    width: SizeConfig.screenWidth,
                    color: Colors.white,
                    height: 220,
                    child: Padding(
                      padding: const EdgeInsets.only(top: 25.0, left: 25),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          MyText(
                            data: "Bill Details",
                            fontWeight: FontWeight.bold,
                            fontFamily: "roboto",
                            fontSize: 18,
                          ),
                          SizedBox(height: 10),
                          Row(
                            children: <Widget>[
                              MyText(
                                data: "Item Total",
                                fontSize: 14,
                              ),
                              SizedBox(
                                  width: SizeConfig.blockSizeHorizontal * 55),
                              MyText(
                                data: "\$ 29.83",
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ],
                          ),
                          SizedBox(height: 10),
                          Container(
                            width: SizeConfig.blockSizeHorizontal * 85,
                            child: Divider(
                              color: greyLow,
                            ),
                          ),
                          Row(
                            children: <Widget>[
                              MyText(
                                data: "Delivery",
                                fontSize: 14,
                              ),
                              SizedBox(
                                  width: SizeConfig.blockSizeHorizontal * 60),
                              MyText(
                                data: "\$ 3.50",
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ],
                          ),
                          SizedBox(height: 10),
                          Container(
                            width: SizeConfig.blockSizeHorizontal * 85,
                            child: Divider(
                              color: greyLow,
                            ),
                          ),
                          Row(
                            children: <Widget>[
                              MyText(
                                data: "To Pay",
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                              ),
                              SizedBox(
                                  width: SizeConfig.blockSizeHorizontal * 58),
                              MyText(
                                data: "\$ 33.33",
                                fontSize: 17,
                                fontWeight: FontWeight.bold,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ))
          ],
        ),
      ),
    );
  }
}

class BoxShadowPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Path path = Path();
    path.lineTo(0.0, size.height);

    double x = 0;
    double y = size.height;

    double increment = size.width / 12;

    while (x < size.width) {
      path.quadraticBezierTo(x, y, x, y);
      x += increment;
    }

    path.lineTo(size.width, 0.0);

    while (x > 0) {
      path.quadraticBezierTo(
          x - increment / 2, size.height * .1, x - increment, 0);
      x -= increment;
    }
    path.close();

    canvas.drawShadow(path, Colors.black, 10.0, false);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}

class TriangleClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(0.0, size.height);

    double x = 0;
    double y = size.height;

    double increment = size.width / 12;

    while (x < size.width) {
      path.quadraticBezierTo(x, y, x, y);
      x += increment;
    }

    path.lineTo(size.width, 0.0);

    while (x > 0) {
      path.quadraticBezierTo(
          x - increment / 2, size.height * .1, x - increment, 0);
      x -= increment;
    }
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper old) {
    return old != this;
  }
}
