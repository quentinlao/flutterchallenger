import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:reservation/services/my_constant.dart';
import 'package:reservation/widget/my_bottom_bar.dart';
import 'package:reservation/widget/my_text.dart';
import 'package:table_calendar/table_calendar.dart';

class Confirmation extends StatefulWidget {
  @override
  _ConfirmationState createState() => _ConfirmationState();
}

class _ConfirmationState extends State<Confirmation>
    with TickerProviderStateMixin {
  AnimationController _animationController;
  CalendarController _calendarController;

  @override
  void initState() {
    super.initState();

    _calendarController = CalendarController();

    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 400),
    );

    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    _calendarController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 1.0,
        backgroundColor: Colors.white,
        centerTitle: true,
        title: MyText(data: "Restaurant"),
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
      body: Column(
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          _buildTableCalendar(),
        ],
      ),
    );
  }

  Widget _buildTableCalendar() {
    return TableCalendar(
      calendarController: _calendarController,
      startingDayOfWeek: StartingDayOfWeek.monday,
      calendarStyle: CalendarStyle(
        selectedColor: red,
        todayColor: Colors.deepOrange[200],
        markersColor: Colors.brown[700],
        outsideDaysVisible: false,
      ),
      headerStyle: HeaderStyle(
        formatButtonTextStyle:
            TextStyle().copyWith(color: Colors.white, fontSize: 15.0),
        formatButtonDecoration: BoxDecoration(
          color: red,
          borderRadius: BorderRadius.circular(16.0),
        ),
      ),
      headerVisible: true,
    );
  }
}
