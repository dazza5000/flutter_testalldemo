import 'package:flutter/material.dart';
import 'package:lyc_clinic/test/custom_bottom_navigation_bar.dart';
import 'package:lyc_clinic/base/mystyle.dart';
import 'package:square_calendar/square_calendar.dart';

class DoctorBookingPage extends StatefulWidget {

  @override
  DoctorBookingPageState createState() {
    return new DoctorBookingPageState();
  }
}

class DoctorBookingPageState extends State<DoctorBookingPage> {
  _getSquareCalendar(BuildContext context) {
    return new SquareCalendar(year: 2018, month: 2);
    /*return new SquareCalendar(
      year: 2018,
      month: 5,
      gestureBuilder: (child, int, date, base, first, last) {
        return new InkWell(
          child: child,
          onTap: () {
            Scaffold.of(context).showSnackBar(new SnackBar(
              content: new Text("tapped: " + date.toString()),
            ));
          },
        );
      },
      tileBuilder: (child, index, date, baseDate, firstDayOfMonth,
          lastDayOfMonth) {
        return new GridTile(child: child);
      },
      widgetBuilder:
          (index, date, baseDate, firstDayOfMonth, lastDayOfMonth) {
        return new Text(date.day.toString());
      },
    );*/
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: MyStyle.layoutBackground,
      appBar: new AppBar(
        backgroundColor: MyStyle.colorWhite,
        leading: new IconButton(
            icon: new Icon(Icons.arrow_back, color: MyStyle.colorBlack),
            onPressed: () => Navigator.pop(context)),
        title: new Text('Choose your booking date',
          style: new TextStyle(color: MyStyle.colorBlack, fontSize: 14.0),),
      ),
      body: new Container(
        child: new Column(
          children: <Widget>[
            _getSquareCalendar(context)
          ],
        ),
      ),
      bottomNavigationBar: new Material(
          child: new CustomBottomNavigationBar()
      ),
    );
  }
}