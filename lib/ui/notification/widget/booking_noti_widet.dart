import 'package:flutter/material.dart';
import 'package:lyc_clinic/base/mystyle.dart';
import 'package:lyc_clinic/ui/notification/data/booking.dart';

class BookingNotificationWidget extends StatefulWidget {
  Booking booking;

  BookingNotificationWidget(this.booking);

  @override
  BookingNotiWidgetState createState() {
    return new BookingNotiWidgetState();
  }
}

class BookingNotiWidgetState extends State<BookingNotificationWidget> {
  String _you_have = "You have ";
  String _requested = "requested";
  String _booking_for = " booking for ";
  String _your_booking_for = "Your booking for ";
  String _with = " with ";
  String _is = " is ";
  String _date;
  String _doctor;
  String _boking_date;
  String _fullStop = ".";

  var status = ["approved", "pending", "unavailable", "completed", "cancelled"];

  var mNormalSpan = new TextStyle(
      color: MyStyle.colorBlack, fontSize: MyStyle.xmedium_fontSize);
  var mBoldSpan = new TextStyle(
      color: MyStyle.colorBlack,
      fontSize: MyStyle.xmedium_fontSize,
      fontWeight: FontWeight.bold);
  var mRequestedSpan = new TextStyle(
      color: MyStyle.colorPrimary,
      fontSize: MyStyle.xmedium_fontSize,
      fontWeight: FontWeight.bold);
  var mUnavailableSpan = new TextStyle(
      color: MyStyle.colorRed,
      fontSize: MyStyle.xmedium_fontSize,
      fontWeight: FontWeight.bold);
  var mConfirmSpan = new TextStyle(
      color: MyStyle.colorGreen,
      fontSize: MyStyle.xmedium_fontSize,
      fontWeight: FontWeight.bold);
  var mDateSpan = new TextStyle(
    color: MyStyle.colorDarkGrey,
    fontWeight: FontWeight.bold,
  );
  var mDoctorSpan = new TextStyle(
      color: MyStyle.colorDarkGrey,
      fontWeight: FontWeight.bold,
      decoration: TextDecoration.underline);

  Widget _getCustomMessage(){
    if(widget.booking.customMesg!=null && widget.booking.customMesg!=''){
      return new Text(widget.booking.customMesg,style: MyStyle.listItemTextStyle(),);
    }
    else{
      return _getSpannableString();
    }
  }

  Widget _getSpannableString() {
    var style = [
      mConfirmSpan,
      mRequestedSpan,
      mUnavailableSpan,
      mNormalSpan,
      mUnavailableSpan
    ];
    _date = widget.booking.time;
    _doctor = widget.booking.doctorName;
    if (status == 1) {
      return new RichText(
        text: new TextSpan(
          //style: DefaultTextStyle.of(this).style,
          children: <TextSpan>[
            new TextSpan(
              text: _you_have,
              style: mNormalSpan,
            ),
            new TextSpan(
              text: _requested,
              style: mBoldSpan,
            ),
            new TextSpan(
              text: _booking_for,
              style: mNormalSpan,
            ),
            new TextSpan(
              text: _date,
              style: mDateSpan,
            ),
            new TextSpan(
              text: _with,
              style: mNormalSpan,
            ),
            new TextSpan(
              text: _doctor,
              style: mDoctorSpan,
            ),
          ],
        ),
      );
    } else {
      return new RichText(
        text: new TextSpan(
          //style: DefaultTextStyle.of(context).style,
          children: <TextSpan>[
            new TextSpan(
              text: _your_booking_for,
              style: mNormalSpan,
            ),
            new TextSpan(
              text: _date,
              style: mDateSpan,
            ),
            new TextSpan(
              text: _with,
              style: mNormalSpan,
            ),
            new TextSpan(
              text: _doctor,
              style: mDoctorSpan,
            ),
            new TextSpan(
              text: _is,
              style: mNormalSpan,
            ),
            new TextSpan(
              text: status[widget.booking.status],
              style: style[widget.booking.status],
            ),
          ],
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    var networkImage = new NetworkImage(widget.booking.image);
    var localImage = new AssetImage('assets/images/lyc.png');

    return new Container(
        margin: const EdgeInsets.symmetric(horizontal: 0.0, vertical: 10.0),
        child: new Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            new CircleAvatar(
              backgroundColor: Colors.transparent,
              backgroundImage:
              widget.booking.image == "" ? localImage : networkImage,
              radius: 20.0,
            ),
            new Expanded(
              child: new Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  new Padding(
                      padding: const EdgeInsets.only(top: 0.0, left: 10.0),
                      child: _getCustomMessage(),
                      ),
                  new Padding(
                      padding: const EdgeInsets.only(top: 10.0, left: 10.0),
                      child: new Text(
                        'Feb 14 2018',
                        style: MyStyle.dateTimeTextStyle(),
                      ))
                ],
              ),
            )
          ],
        ));
  }
}
