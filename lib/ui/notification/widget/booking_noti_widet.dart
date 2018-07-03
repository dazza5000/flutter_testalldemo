import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:lyc_clinic/base/mystyle.dart';
import 'package:lyc_clinic/ui/notification/data/booking.dart';
import 'package:lyc_clinic/ui/utils/time_utils.dart';
import 'package:lyc_clinic/ui/doctors/page/doctor_details_page.dart';

class BookingNotificationWidget extends StatelessWidget {
  Booking booking;

  BookingNotificationWidget(this.booking);

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

  @override
  Widget build(BuildContext context) {
    var networkImage = new NetworkImage(booking.image);
    var localImage = new AssetImage('assets/images/lyc.png');
    var tapRecognizer = new TapGestureRecognizer()
      ..onTap = () {
        print('Doctor Link');
        Navigator.push(
            context,
            new MaterialPageRoute(
                builder: (_) => new DoctorDetailsPage(booking.doctor)));
      };

    Widget showDateAndTime() {
      if (booking.timeAgo > 88640) {
        return new Text(
          TimeUtils.getDateWithoutHours(booking.createDate),
          style: MyStyle.dateTimeTextStyle(),
        );
      } else {
        return new Row(
          children: <Widget>[
            new Text(
              TimeUtils.getTime(booking.timeAgo),
              style: MyStyle.dateTimeTextStyle(),
            ),
            new Text('.')
          ],
        );
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
      _date = booking.time;
      _doctor = booking.doctorName;
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
                recognizer: tapRecognizer
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
                  text: _doctor, style: mDoctorSpan, recognizer: tapRecognizer),
              new TextSpan(
                text: _is,
                style: mNormalSpan,
              ),
              new TextSpan(
                text: status[booking.status],
                style: style[booking.status],
              ),
            ],
          ),
        );
      }
    }

    Widget _getCustomMessage() {
      if (booking.customMesg != null && booking.customMesg != '') {
        return new Text(
          booking.customMesg,
          style: MyStyle.listItemTextStyle(),
        );
      } else {
        return _getSpannableString();
      }
    }

    return new Container(
        margin: const EdgeInsets.symmetric(horizontal: 0.0, vertical: 10.0),
        child: new Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            new CircleAvatar(
              backgroundColor: Colors.transparent,
              backgroundImage: booking.image == "" ? localImage : networkImage,
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
                      child: showDateAndTime())
                ],
              ),
            )
          ],
        ));
  }
}
