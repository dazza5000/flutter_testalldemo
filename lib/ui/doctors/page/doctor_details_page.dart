import 'package:flutter/material.dart';
import 'package:lyc_clinic/ui/doctors/widget/create_session_items.dart';
import 'package:lyc_clinic/ui/doctors/widget/create_review_list_item.dart';
import 'package:lyc_clinic/ui/doctors/data/doctor_profile.dart';
import 'package:lyc_clinic/ui/home/widget/create_booking_item.dart';
import 'package:lyc_clinic/ui/doctors/data/doctor.dart';
import 'package:lyc_clinic/ui/comment/data/comment.dart';
import 'package:lyc_clinic/ui/doctors/data/active_booking.dart';
import 'package:lyc_clinic/ui/doctors/page/doctor_booking_page.dart';
import 'package:lyc_clinic/base/mystyle.dart';
import 'package:lyc_clinic/test/custom_bottom_navigation_bar.dart';
import 'package:lyc_clinic/ui/doctors/contract/doctor_profile_contract.dart';
import 'package:lyc_clinic/ui/doctors/presenter/doctor_profile_presenter.dart';
import 'package:lyc_clinic/ui/doctors/data/doctor_profile.dart';
import 'package:lyc_clinic/ui/doctors/data/schedule.dart';
import 'package:lyc_clinic/ui/home/data/booking.dart';
import 'package:lyc_clinic/ui/comment/data/review.dart';
import 'package:lyc_clinic/utils/configs.dart';
import 'package:lyc_clinic/ui/home/page/profile_data_page.dart';

class DoctorDetailsPage extends StatefulWidget {
  int doctorId;

  DoctorDetailsPage(this.doctorId);

  ActiveBooking activeBooking;

  @override
  DoctorDetailsPageState createState() {
    return new DoctorDetailsPageState();
  }
}

class DoctorDetailsPageState extends State<DoctorDetailsPage>
    implements DoctorProfileContract {
  DoctorProfilePresetner mPresenter;
  DoctorProfile doctorProfile;
  Doctor doctor;
  Comment comment;
  List<Booking> bookingList = new List<Booking>();

  bool _isFavourite = false;
  bool _isBookMark = false;
  int _favCount = 0;

  DoctorDetailsPageState() {
    mPresenter = new DoctorProfilePresetner(this);
  }

  @override
  void initState() {
    super.initState();
    mPresenter.getDoctorProfile(Configs.TEST_CODE, widget.doctorId);
  }

  _clickSeelAllBooking(BuildContext context) {
    print('Click see all booking');
    //Navigator.pop(context);
    Navigator.push(
        context,
        new MaterialPageRoute(
            builder: (_) => new ProfileDataPage(tabIndex: 2)));
  }

  Widget _doctorInfo() {
    return new Container(
        child: new Stack(
      children: <Widget>[
        new Padding(
            padding: const EdgeInsets.only(top: 20.0, left: 0.0, right: 0.0),
            child: new Card(
                child: new Align(
                    alignment: FractionalOffset.topLeft,
                    child: new Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: new Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          new Padding(
                              padding:
                                  const EdgeInsets.only(top: 5.0, bottom: 5.0),
                              child: new Text(doctor.name,
                                  style:
                                      new TextStyle(color: MyStyle.colorGreen),
                                  textAlign: TextAlign.left)),
                          new Padding(
                              padding: const EdgeInsets.only(top: 5.0),
                              child: new Text(doctor.office,
                                  style: new TextStyle(
                                      color: MyStyle.colorGreen,
                                      fontSize: 11.0))),
                          new Padding(
                              padding: const EdgeInsets.only(top: 5.0),
                              child: new Text(doctor.role,
                                  style: new TextStyle(
                                      color: MyStyle.colorBlack,
                                      fontSize: 12.0))),
                          new Padding(
                              padding:
                                  const EdgeInsets.only(top: 5.0, bottom: 5.0),
                              child: new Text(doctor.degree,
                                  style: new TextStyle(
                                      color: MyStyle.colorBlack,
                                      fontSize: 12.0))),
                        ],
                      ),
                    )))),
        new Align(
            alignment: FractionalOffset.topRight,
            child: new Padding(
              padding: const EdgeInsets.only(right: 10.0),
              child: new FloatingActionButton(
                  backgroundColor:
                      _isFavourite ? MyStyle.colorAccent : MyStyle.colorWhite,
                  mini: true,
                  onPressed: _clickLikeButton,
                  child: new Icon(
                      _isFavourite ? Icons.favorite : Icons.favorite_border,
                      color: _isFavourite
                          ? MyStyle.colorWhite
                          : MyStyle.colorGrey)),
            ))
      ],
    ));
  }

  Widget _availableSessionRow() {
    return new Padding(
        padding: const EdgeInsets.all(5.0),
        child: new Row(
          children: <Widget>[
            new Text('Available Sessions'),
            new Expanded(
                child: new Row(
              children: <Widget>[],
            )),
            new InkWell(
              child: new Row(children: <Widget>[
                new Text(
                  'More Info',
                  style: new TextStyle(
                    color: MyStyle.colorBlack,
                    decoration: TextDecoration.underline,
                    decorationColor: MyStyle.colorBlack,
                    decorationStyle: TextDecorationStyle.solid,
                  ),
                ),
                new Icon(
                  Icons.keyboard_arrow_right,
                  color: MyStyle.colorBlack,
                )
              ]),
              onTap: () => _clickAvalibleSession(context),
            )
          ],
        ));
  }

  Widget _showBookingItems() {
    return new Card(
        child: new Column(children: <Widget>[
      new Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 15.0),
          child: new Row(children: <Widget>[
            new Image.asset('assets/images/lyc_icon.png', scale: 2.0),
            new Expanded(
                child: new Row(
              children: <Widget>[],
            )),
            new InkWell(
                onTap: () => _clickSeelAllBooking(context),
                child: new Text(
                  'See all your booking',
                  style: new TextStyle(
                    fontSize: MyStyle.small_fontSize,
                    color: MyStyle.colorBlack,
                    decoration: TextDecoration.underline,
                    decorationColor: MyStyle.colorBlack,
                    decorationStyle: TextDecorationStyle.solid,
                  ),
                )),
          ])),
      new ListView.builder(
          controller: new ScrollController(),
          padding: const EdgeInsets.all(0.0),
          itemBuilder: _buildBookingList,
          itemCount: bookingList.length,
          shrinkWrap: true,
          scrollDirection: Axis.vertical)
    ]));
  }

  Widget _buildBookingList(BuildContext context, int index) {
    Booking booking = bookingList[index];
    return new BookingItems(booking, booking.status);
  }

  void _clickLikeButton() {
    setState(() {
      if (_isFavourite) {
        _isFavourite = false;
        _favCount -= 1;
      } else {
        _isFavourite = true;
        _favCount += 1;
      }
    });
  }

  _clickAvalibleSession(BuildContext context) {
    Navigator.push(context,
        new MaterialPageRoute(builder: (_) => new DoctorBookingPage()));
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        backgroundColor: MyStyle.colorWhite,
        leading: new IconButton(
            icon: new Icon(Icons.arrow_back, color: MyStyle.colorBlack),
            onPressed: () => Navigator.pop(context)),
        title: new Text(
          'Doctor Info and Schedules',
          style: MyStyle.appbarTitleStyle(),
        ),
        actions: <Widget>[
          new IconButton(
              icon: new Icon(Icons.bookmark_border, color: MyStyle.colorBlack),
              onPressed: null),
          new IconButton(
              icon: new Icon(Icons.share, color: MyStyle.colorBlack),
              onPressed: null)
        ],
      ),
      body: new SingleChildScrollView(
          child: new Container(
              color: MyStyle.layoutBackground,
              child: new Padding(
                padding:
                    const EdgeInsets.only(top: 20.0, left: 10.0, right: 10.0),
                child: new Column(
                  children: <Widget>[
                    _doctorInfo(),
                    _availableSessionRow(),
                    new InkWell(
                      child: new SessionItems(),
                      onTap: () => _clickAvalibleSession(context),
                    ),
                    new ReviewListItem(comment, widget.doctorId, false),
                    new Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 0.0, vertical: 10.0),
                        child: _showBookingItems())
                  ],
                ),
              ))),
      bottomNavigationBar: new Material(
        child: new CustomBottomNavigationBar(),
      ),
    );
  }

  @override
  void hideRequestedBooking() {}

  @override
  void showRequestedBooking(ActiveBooking activeBooking) {
    setState(() {});
    print('Active booking$activeBooking');
  }

  @override
  void setSaveStatus(bool isSaved) {}

  @override
  void setFavoriteStatus(bool isFav, int favCount) {}

  @override
  void showDoctorInfo(Doctor doctor) {
    setState(() {
      this.doctor = doctor;
    });
    print('Doctor  Data${doctor.toString()}');
  }

  @override
  void showReviews(Comment c) {
    setState(() {
      comment = c;
    });
    print('Review Data $comment');
  }

  @override
  void showBookings(List<Booking> b) {
    setState(() {
      bookingList = b;
    });
    print('Booking Data$b');
  }

  @override
  void showDoctorSchedules(List<Schedule> schedules) {
    setState(() {});
    print('Schedule List $schedules');
  }

  @override
  void onLoadError() {
    print('Erorr');
  }
}
