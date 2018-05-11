import 'package:flutter/material.dart';
import 'package:lyc_clinic/test/vertical_divider.dart';
import 'package:lyc_clinic/base/mystyle.dart';
import 'package:lyc_clinic/ui/home/model/booking.dart';
import 'package:square_calendar/square_calendar.dart';

class BookingItems extends StatefulWidget {
  Booking booking;

  BookingItems(this.booking);

  @override
  BookingItemsState createState() {
    return new BookingItemsState();
  }
}

class BookingItemsState extends State<BookingItems> {
  String _you_have = "You have ";
  String _requested = "requested";
  String _booking_for = " booking for ";
  String _your_booking_for = "Your booking for ";
  String _with = " with ";
  String _is = " is ";
  String _doctor;
  String _boking_date;
  String _fullStop = ".";
  var status = ["unavailable", "pending", "approved", "completed", "cancelled"];

  Widget _getVerticalDivider(int status) {
    _boking_date = widget.booking.time;
    _doctor = widget.booking.doctorName;
    Color _bookingStatusLineColor;
    switch (status) {
      case 0:
        _bookingStatusLineColor = MyStyle.colorRed;
        break;
      case 1:
        _bookingStatusLineColor = MyStyle.colorAccent;
        break;
      case 2:
        _bookingStatusLineColor = MyStyle.colorGreen;
        break;
      case 3:
        _bookingStatusLineColor = MyStyle.colorBlack;
        break;
      case 4:
        _bookingStatusLineColor = MyStyle.colorRed;
        break;
    }
    return new VerticalDivider(
        color: _bookingStatusLineColor,
        height: 50.0,
        width: 3.0,
        left_margin: 0.0,
        right_margin: 10.0);
  }

  Widget _getSpannableString(BuildContext mcontext) {
    TextSpan span = new TextSpan(
        style: new TextStyle(color: Colors.blue[800]), text: 'Name');
    TextPainter tp = new TextPainter(text: span,
        textAlign: TextAlign.left,
        textDirection: TextDirection.ltr);
    //tp.layout();
    // tp.paint(MaterialType.canvas, new Offset(5.0, 5.0));
    return new RichText(text: new TextSpan(
      // Note: Styles for TextSpans must be explicitly defined.
      // Child text spans will inherit styles from parent
      style: new TextStyle(
        fontSize: 14.0,
        color: Colors.black,
      ),
      children: <TextSpan>[
        new TextSpan(text: 'Hello'),
        new TextSpan(
            text: 'World', style: new TextStyle(fontWeight: FontWeight.bold)),
      ],
    ),);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.all(0.0),
        padding: const EdgeInsets.all(0.0),
        child: new Row(
            children: <Widget>[
              _getVerticalDivider(4),
              _getSpannableString(context)

            ]
        )
    );
  }


}