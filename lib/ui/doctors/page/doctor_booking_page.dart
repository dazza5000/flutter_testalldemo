import 'package:flutter/material.dart';
import 'dart:async';
import 'package:small_calendar/small_calendar.dart';
import 'package:lyc_clinic/base/widget/base_widget.dart';
import 'package:lyc_clinic/base/mystyle.dart';
import 'package:lyc_clinic/ui/utils/time_utils.dart';
import 'package:lyc_clinic/base/widget/custom_bottom_navigation_bar.dart';
import 'package:lyc_clinic/ui/doctors/presenter/doctor_booking_presenter.dart';
import 'package:lyc_clinic/ui/doctors/contract/doctor_booking_contract.dart';
import 'package:lyc_clinic/ui/doctors/data/active_booking.dart';
import 'package:lyc_clinic/ui/doctors/data/schedule.dart';
import 'package:lyc_clinic/ui/doctors/data/doctor.dart';

class DoctorBookingPage extends StatefulWidget {
  ActiveBooking activeBooking;
  Doctor doctor;
  bool isLogin;
  String accessCode;

  DoctorBookingPage(
      this.activeBooking, this.doctor, this.isLogin, this.accessCode);

  @override
  DoctorBookingPageState createState() {
    return new DoctorBookingPageState();
  }
}

class DoctorBookingPageState extends State<DoctorBookingPage>
    implements DoctorBookingContract {
  SmallCalendarDataController _smallCalendarDataController;
  SmallCalendarPagerController _smallCalendarPagerController;
  String _displayedMonthText;
  bool _showWeekdayIndication = true;
  bool _showTicks = true;
  String _displayMonthYear;
  String dayMonthYear;
  DateTime selectedDate;
  int selectedDay;
  String doctorName;
  String doctorRole;
  String office;
  String degree;
  int doctorId;
  int scheduleId;
  bool showBookingBox = false;
  bool hasBooking = false;
  List<Schedule> scheduleList;
  List<DateTime> availableDay;
  DoctorBookingPresenter mPresenter;

  DoctorBookingPageState() {
    mPresenter = new DoctorBookingPresenter(this);
  }

  void _updateDisplayedMonthText(int day, DateTime month) {
    setState(() {
      DateTime displayedMonth = _smallCalendarPagerController.displayedMonth;
      _displayedMonthText =
          "Displayed Month: ${displayedMonth.year}.${displayedMonth.month}";
      _displayMonthYear = TimeUtils.getMonthNameYear(month);
      dayMonthYear = TimeUtils.getMonthDayYear(month);
      selectedDay = day;
      selectedDate = month;
    });
  }

  Future<bool> _isTodayCallback(DateTime date) async {
    DateTime now = new DateTime.now();
    return now.year == date.year &&
        now.month == date.month &&
        now.day == date.day;
  }

  Future<bool> _isSelectedCallback(DateTime date, int day) async {
    DateTime now = new DateTime.now();
    if (date.month == now.month)
      return date.day == day;
    else
      return null;
  }

  @override
  void initState() {
    super.initState();
    scheduleList = new List<Schedule>();
    scheduleList.addAll(widget.doctor.schedule);
    doctorId = widget.doctor.id;
    doctorName = widget.doctor.name;
    doctorRole = widget.doctor.role;
    degree = widget.doctor.degree;
    office = widget.doctor.office;
    showBookingBox = widget.activeBooking != null ? true : false;

    DateTime initialMonth = new DateTime.now();
    _smallCalendarDataController = new SmallCalendarDataController();
    _smallCalendarPagerController = new SmallCalendarPagerController(
        initialMonth: initialMonth,
        maximumMonth: initialMonth,
        minimumMonth: initialMonth);
    _updateDisplayedMonthText(initialMonth.day, initialMonth);
  }

  _clickRequestBooking() {
    if (widget.isLogin) {
      mPresenter.requestBooking(widget.accessCode, doctorId, 1,
          '${selectedDate.year}-${selectedDate.month}-${selectedDate.day}');
    } else {
      BaseWidgets.showLoginDialog(context);
    }
  }

  _clickCancelBooking() {
    mPresenter.cancelBooking(
        widget.accessCode, doctorId, widget.activeBooking.id);
  }

  Widget _bookingSummary() {
    return new Container(
      decoration: new BoxDecoration(
        color: MyStyle.colorWhite,
        borderRadius: BorderRadius.circular(2.0),
      ),
      child: new Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          new Container(
            padding: const EdgeInsets.all(8.0),
            decoration: new BoxDecoration(
                color: MyStyle.colorLightGrey,
                borderRadius: BorderRadius.circular(2.0)),
            child: new Text(
              'Booking Summary',
              textAlign: TextAlign.left,
            ),
          ),
          new Container(
            padding: const EdgeInsets.all(8.0),
            child: new Stack(
              alignment: Alignment.center,
              children: <Widget>[
                _scheduleWidgetItems(false, "Mon", '_'),
                new Align(
                  alignment: FractionalOffset.centerRight,
                  child: _roundShapeContainer(dayMonthYear),
                )
              ],
            ),
          ),
          new Padding(
            padding: const EdgeInsets.only(left: 8.0, right: 8.0),
            child: new Divider(
              height: 2.0,
              color: MyStyle.colorDarkGrey,
            ),
          ),
          new Padding(
            padding: const EdgeInsets.all(10.0),
            child: new Text(
              doctorName,
              textAlign: TextAlign.left,
              style: MyStyle.captionTextStyle(),
            ),
          ),
          new Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 12.0, vertical: 5.0),
            child: new Text(
              office,
              textAlign: TextAlign.left,
              style: MyStyle.itemTextStyle(),
            ),
          ),
          new Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 12.0, vertical: 5.0),
            child: new Text(
              doctorRole,
              textAlign: TextAlign.left,
              style: MyStyle.customTextStyle(MyStyle.colorBlack),
            ),
          ),
          new Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 12.0, vertical: 5.0),
            child: new Text(
              degree,
              textAlign: TextAlign.left,
              style: MyStyle.customTextStyle(MyStyle.colorBlack),
            ),
          )
        ],
      ),
    );
  }

  _roundShapeContainer(String data) {
    return new Container(
      alignment: FractionalOffset.centerRight,
      padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 5.0),
      width: 120.0,
      height: 40.0,
      child: new Center(
        child: new Text(
          data,
          textAlign: TextAlign.center,
          style: MyStyle.buttonTextStyle(),
        ),
      ),
      decoration: new BoxDecoration(
          borderRadius: BorderRadius.circular(35.0),
          color: MyStyle.colorAccent),
    );
  }

  _scheduleWidgetItems(bool status, String title, String subTitle) {
    Color mColor = status ? Colors.grey : Colors.black38;
    return new Padding(
        padding: const EdgeInsets.only(top: 5.0, bottom: 5.0, left: 5.0),
        child: new Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          //mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            new Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                new Icon(Icons.date_range, color: mColor, size: 20.0),
                new Container(
                  height: 5.0,
                  child: null,
                ),
                new Icon(
                  Icons.access_time,
                  color: mColor,
                  size: 20.0,
                ),
              ],
            ),
            new Padding(
              padding: const EdgeInsets.only(
                left: 5.0,
              ),
              child: null,
            ),
            new Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                new Text(title,
                    style: new TextStyle(fontSize: 12.0, color: mColor),
                    textAlign: TextAlign.center),
                new Container(
                  height: 6.0,
                  child: null,
                ),
                new Text('05:00 PM',
                    style: new TextStyle(fontSize: 12.0, color: mColor),
                    textAlign: TextAlign.center)
              ],
            )
          ],
        ));
  }

  Widget _requestBookingButton() {
    return new Row(mainAxisAlignment: MainAxisAlignment.end, children: <Widget>[
      new Expanded(
          child: new RaisedButton(
        padding: const EdgeInsets.only(top: 15.0, bottom: 15.0),
        child: new Text(
          'REQUEST BOOKING NOW',
          style: MyStyle.buttonTextStyle(),
        ),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(7.0)),
        onPressed: _clickRequestBooking,
        color: Colors.green,
      )),
    ]);
  }

  Widget _cancelBookingButton() {
    return new Row(mainAxisAlignment: MainAxisAlignment.end, children: <Widget>[
      new Expanded(
          child: new RaisedButton(
        padding: const EdgeInsets.only(top: 15.0, bottom: 15.0),
        child: new Text(
          'CANCEL',
          style: MyStyle.buttonTextStyle(),
        ),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(7.0)),
        onPressed: _clickCancelBooking,
        color: MyStyle.colorAccent,
      )),
    ]);
  }

  showRequestOrCancelButton() {
    if (hasBooking) {
      return _cancelBookingButton();
    } else {
      if (showBookingBox) {
        return _requestBookingButton();
      } else {
        return new Container(
          child: null,
        );
      }
    }
  }

  Widget _getCalendar() {
    return new Container(
      height: 300.0,
      color: MyStyle.layoutBackground,

      /// SmallCalendarData
      child: new SmallCalendarData(
        firstWeekday: DateTime.sunday,
        isSelectedCallback: (DateTime d) => _isSelectedCallback(d, selectedDay),
        controller: _smallCalendarDataController,

        /// SmallCalendarStyle
        child: new SmallCalendarStyle(
            showWeekdayIndication: _showWeekdayIndication,
            weekdayIndicationStyle: new WeekdayIndicationStyle(
                backgroundColor: MyStyle.layoutBackground,
                weekdayIndicationHeight: 40.0),
            dayStyle: new DayStyle(
              showTicks: _showTicks,
              selectedColor: MyStyle.colorAccent,
              tick3Color: Colors.orange,
              tick1Color: Colors.green,
              tick2Color: Colors.red,
              extendedDayTextStyle:
                  new TextStyle(color: MyStyle.layoutBackground),
            ),

            /// SmallCalendarPager
            child: new SmallCalendarPager(
              controller: _smallCalendarPagerController,
              onMonthChanged: (DateTime month) {
                _updateDisplayedMonthText(month.day, month);
              },
              pageBuilder: (BuildContext context, DateTime month) {
                /// SmallCalendar
                return new SmallCalendar(
                  month: month,
                  onDayTap: (DateTime day) {
                    setState(() {
                      selectedDay = day.day;
                      selectedDate = day;
                      showBookingBox = true;
                      dayMonthYear = TimeUtils.getMonthDayYear(day);
                    });
                    print(
                      "Pressed on: ${day.year}.${day
                          .month}.${day.day}",
                    );

                    // shows SnackBar
                    if (scheduleList.contains(day)) {
                      Scaffold.of(context).showSnackBar(new SnackBar(
                              content: new Text(
                            "Pressed on:  ${day
                                .year}.${day
                                .month}.${day.day} ",
                          )));
                    }
                  },
                );
              },
            )),
      ),
    );
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
        title: new Text(
          'Choose your booking date',
          style: new TextStyle(color: MyStyle.colorBlack, fontSize: 14.0),
        ),
      ),
      body: new Container(
        child: new SingleChildScrollView(
          controller: new ScrollController(),
          scrollDirection: Axis.vertical,
          child: new Column(
            children: <Widget>[
              new Center(
                child: new Padding(
                    padding: const EdgeInsets.only(top: 10.0, bottom: 10.0),
                    child: new Text(_displayMonthYear)),
              ),
              new Container(
                color: Colors.grey[200],
                child: new Center(child: _getCalendar()),
              ),
              new Container(
                margin: const EdgeInsets.only(top: 20.0),
                child: new Opacity(
                  opacity: 1.0,
                  child: new Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      new Container(
                        padding: const EdgeInsets.all(10.0),
                        child: new Opacity(
                            opacity: showBookingBox ? 1.0 : 0.0,
                            child: _bookingSummary()),
                      ),
                      new Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: showRequestOrCancelButton(),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
      //}),

      bottomNavigationBar: new Material(child: new CustomBottomNavigationBar()),
    );
  }

  @override
  void showBookingForm(
      int schedule, DateTime date, int rawTime, String time, String day) {
   setState(() {
     hasBooking=true;
     showBookingBox=true;
     scheduleId=schedule;
     dayMonthYear=TimeUtils.getMonthDayYear(date);
   });
  }

  @override
  void showAvailableWeeks(List<int> weekDayColors) {}

  @override
  void showSelectedDate(DateTime eata) {}

  @override
  void removeBooking() {
    setState(() {
      hasBooking = false;
      widget.activeBooking = null;
      showBookingBox = false;
    });
  }

  @override
  void showBookingDetail(ActiveBooking booking) {
    setState(() {
      widget.activeBooking = booking;
    });
  }

  @override
  void onLoadError() {}

  @override
  void showErrorMessage(String message) {}

  @override
  void showMessage(String message) {}

  @override
  void hideDialog() {}

  @override
  void showDialog() {}
}
