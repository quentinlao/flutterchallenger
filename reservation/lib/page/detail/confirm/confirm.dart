import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:reservation/services/my_constant.dart';
import 'package:reservation/widget/my_bottom_bar.dart';
import 'package:reservation/widget/my_text.dart';

class Confirm extends StatefulWidget {
  @override
  _ConfirmState createState() => _ConfirmState();
}

class _ConfirmState extends State<Confirm> {
  //var _controller = TextEditingController(); // If you want clear button
  TextEditingController _controllerNumber = TextEditingController();

  @override
  void initState() {
    super.initState();
    _controllerNumber.text = "0"; // Setting the initial value for the field.
  }

  Widget _buildPhone() {
    return Padding(
      padding: const EdgeInsets.only(left: 15.0, top: 5.0, right: 15.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          MyText(
            data: 'Phone',
            fontFamily: 'roboto',
          ),
          SizedBox(height: 10.0),
          Container(
            alignment: Alignment.centerLeft,
            height: 60.0,
            child: TextField(
              keyboardType: TextInputType.phone,
              style: GoogleFonts.openSans(color: primary, fontSize: 14),
              decoration: InputDecoration(
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: primary, width: 1.0),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: greyLow, width: 1.0),
                ),
                contentPadding: EdgeInsets.only(top: 14.0),
                prefixIcon: Icon(
                  Icons.phone,
                  color: primary,
                ),
                hintText: 'Enter your Phone number',
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildNumber() {
    return Padding(
      padding: const EdgeInsets.only(left: 15.0, top: 5.0, right: 15.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          MyText(
            data: 'Number of people',
            fontFamily: 'roboto',
          ),
          Padding(
            padding: const EdgeInsets.only(top: 15.0),
            child: Center(
              child: Container(
                width: 400.0,
                foregroundDecoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5.0),
                  border: Border.all(
                    color: greyLow,
                    width: 1.0,
                  ),
                ),
                child: Row(
                  children: <Widget>[
                    Expanded(
                      flex: 1,
                      child: TextFormField(
                        textAlign: TextAlign.center,
                        decoration: InputDecoration(
                          prefixIcon: Icon(
                            Icons.people_outline,
                            color: primary,
                          ),
                          contentPadding: EdgeInsets.all(8.0),
                          border: null,
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide.none,
                          ),
                          enabledBorder:
                              OutlineInputBorder(borderSide: BorderSide.none),
                        ),
                        controller: _controllerNumber,
                        keyboardType: TextInputType.numberWithOptions(
                          decimal: false,
                          signed: true,
                        ),
                      ),
                    ),
                    Container(
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Container(
                            child: InkWell(
                              child: Icon(
                                Icons.add,
                                size: 18.0,
                              ),
                              onTap: () {
                                int currentValue =
                                    int.parse(_controllerNumber.text);
                                setState(() {
                                  currentValue++;
                                  _controllerNumber.text = (currentValue)
                                      .toString(); // incrementing value
                                });
                              },
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          InkWell(
                            child: Icon(
                              Icons.remove,
                              size: 18.0,
                            ),
                            onTap: () {
                              int currentValue =
                                  int.parse(_controllerNumber.text);
                              setState(() {
                                print("Setting state");
                                currentValue--;
                                _controllerNumber.text =
                                    (currentValue > 0 ? currentValue : 0)
                                        .toString(); // decrementing value
                              });
                            },
                          ),
                          SizedBox(
                            width: 10,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildName() {
    return Padding(
      padding: const EdgeInsets.only(
        left: 15.0,
        top: 5.0,
        right: 15.0,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          MyText(
            data: 'Name of reservation',
            fontFamily: 'roboto',
          ),
          SizedBox(height: 10.0),
          Container(
            alignment: Alignment.centerLeft,
            height: 60.0,
            child: TextField(
              // controller: _controller,
              keyboardType: TextInputType.text,
              style: GoogleFonts.openSans(color: primary, fontSize: 14),
              decoration: InputDecoration(
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: primary, width: 1.0),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: greyLow, width: 1.0),
                ),
                contentPadding: EdgeInsets.only(top: 14.0),
                prefixIcon: Icon(
                  Icons.text_fields,
                  color: primary,
                ),
                /*suffixIcon: IconButton(
                  onPressed: () => _controller.clear(),
                  icon: Icon(
                    Icons.clear,
                    color: primary,
                  ),
                ),*/
                hintText: 'Enter the name of the reservation',
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 1.0,
        backgroundColor: Colors.white,
        centerTitle: true,
        title: MyText(data: "Confirm and reserve"),
        leading: IconButton(
          icon: Icon(
            Icons.chevron_left,
            color: primary,
          ),
          onPressed: () => Navigator.pop(context, false),
        ),
      ),
      bottomNavigationBar: MyBottomBar(
        index: 2,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(
                left: 15.0,
                top: 20.0,
              ),
              child: MyText(
                data: "Restaurant Mampino",
                fontFamily: "roboto",
                fontSize: 22,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 15.0,
                top: 5.0,
              ),
              child: MyText(
                data: "Street pondo indah mall no. 15 Medan",
                fontSize: 14,
                color: grey,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 15.0,
                top: 20.0,
              ),
              child: MyText(
                data: "Your reservation",
                fontFamily: "roboto",
                fontSize: 22,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 15.0,
                top: 5.0,
              ),
              child: MyText(
                data: "23 june 2020-30 june 2020",
                fontSize: 14,
                color: grey,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            _buildPhone(),
            _buildName(),
            _buildNumber()
          ],
        ),
      ),
    );
  }
}
