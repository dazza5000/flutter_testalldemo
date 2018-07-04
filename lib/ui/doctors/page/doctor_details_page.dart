import 'package:flutter/material.dart';
import 'package:share/share.dart';
import 'package:lyc_clinic/ui/doctors/widget/create_session_items.dart';
import 'package:lyc_clinic/ui/doctors/widget/create_review_list_item.dart';
import 'package:lyc_clinic/ui/doctors/data/doctor_profile.dart';
import 'package:lyc_clinic/ui/home/widget/create_booking_item.dart';
import 'package:lyc_clinic/ui/doctors/data/doctor.dart';
import 'package:lyc_clinic/ui/comment/data/comment.dart';
import 'package:lyc_clinic/ui/doctors/data/active_booking.dart';
import 'package:lyc_clinic/ui/doctors/page/doctor_booking_page.dart';
import 'package:lyc_clinic/base/mystyle.dart';
import 'package:lyc_clinic/base/widget/custom_bottom_navigation_bar.dart';
import 'package:lyc_clinic/ui/doctors/contract/doctor_profile_contract.dart';
import 'package:lyc_clinic/ui/doctors/presenter/doctor_profile_presenter.dart';
import 'package:lyc_clinic/ui/doctors/data/doctor_profile.dart';
import 'package:lyc_clinic/ui/doctors/data/schedule.dart';
import 'package:lyc_clinic/ui/home/data/booking.dart';
import 'package:lyc_clinic/ui/comment/data/review.dart';
import 'package:lyc_clinic/utils/configs.dart';
import 'package:lyc_clinic/ui/home/page/profile_data_page.dart';
import 'package:lyc_clinic/utils/mySharedPreferences.dart';
import 'package:lyc_clinic/base/widget/base_widget.dart';


class DoctorDetailsPage extends StatefulWidget {
  int doctorId;

  DoctorDetailsPage(this.doctorId);

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
  ActiveBooking activeBooking;
  List<Booking> bookingList = new List<Booking>();
  List<Schedule> scheduleList = new List<Schedule>();

  bool _isFavourite = false;
  bool isLoading = true;
  bool _isBookMark = false;
  int _favCount = 0;
  String accessCode;
  bool isGuest = false;
  bool isLogin = false;
  MySharedPreferences mySharedPreferences = new MySharedPreferences();

  DoctorDetailsPageState() {
    mPresenter = new DoctorProfilePresetner(this);
  }

  @override
  void initState() {
    super.initState();
    mySharedPreferences
        .getBooleanData(Configs.PREF_USER_LOGIN)
        .then((val) => setState(() {
              isLogin = val != null ? val : false;
              getAccessCode(isLogin);
            }));
  }

  void getAccessCode(bool login) {
    if (login) {
      isGuest = false;
      mySharedPreferences
          .getStringData(Configs.PREF_USER_ACCESSCODE)
          .then((val) => setState(() {
                accessCode = val;
                mPresenter.getDoctorProfile(accessCode, widget.doctorId);
              }));
    } else {
      isGuest = true;
      accessCode = Configs.GUEST_CODE;
      mPresenter.getDoctorProfile(accessCode, widget.doctorId);
    }
  }

  _clickSeelAllBooking(BuildContext context) {
    print('Click see all booking');
    //Navigator.pop(context);
    Navigator.push(
        context,
        new MaterialPageRoute(
            builder: (_) => new ProfileDataPage(tabIndex: 2)));
  }

  _clickShare(){
    Share.share(doctor.shareUrl);
  }

  _clickBookMark(){
    if(isLogin){
      setState(() {
       _isBookMark=!_isBookMark;
      });
      mPresenter.saveDoctor(accessCode, doctor.id);
    }
    else{
      BaseWidgets.showLoginDialog(context);
    }
  }

  void _clickLikeButton() {
    if (isLogin) {
      setState(() {
        if (_isFavourite) {
          _isFavourite = false;
          _favCount -= 1;
        } else {
          _isFavourite = true;
          _favCount += 1;
        }
      });
      mPresenter.favDoctor(accessCode, doctor.id);
    } else {
      BaseWidgets.showLoginDialog(context);
    }
  }

  _clickAvalibleSession(BuildContext context) {
    if(doctor.schedule.length>0)
    Navigator.push(context,
        new MaterialPageRoute(builder: (_) => new DoctorBookingPage(activeBooking,doctor,isLogin,accessCode)));
    else
      Scaffold.of(context).showSnackBar(new SnackBar(content: new Text('Hello')));

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
    if (isLogin) {
      return new Card(
          child: new Column(children: <Widget>[
        new Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 10.0, vertical: 15.0),
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
    } else {
      return new Container(
        child: null,
      );
    }
  }

  Widget _buildBookingList(BuildContext context, int index) {
    Booking booking = bookingList[index];
    return new BookingItems(booking, booking.status);
  }


  /*Widget loadingIndicator = new Container(
      child: new CircularProgressIndicator(
    strokeWidth: 2.0,
  ));*/

  Widget _showLoadingAndData() {
    if (isLoading) {
      return new Center(child: BaseWidgets.loadingIndicator);
    } else {
      return new SingleChildScrollView(
          controller: new ScrollController(),
          scrollDirection: Axis.vertical,
          child: new Container(
              color: MyStyle.layoutBackground,
              child: new Padding(
                padding:
                    const EdgeInsets.only(top: 20.0, left: 10.0, right: 10.0),
                child: new Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    _doctorInfo(),
                    _availableSessionRow(),
                    new InkWell(
                      child: new Card(
                        child: new SessionItems(),
                      ),
                      onTap: () => _clickAvalibleSession(context),
                    ),
                    new ReviewListItem(
                        comment, widget.doctorId, false, isLogin),
                    new Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 0.0, vertical: 10.0),
                        child: _showBookingItems())
                  ],
                ),
              )));
    }
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
              icon: new Icon(_isBookMark?Icons.bookmark:Icons.bookmark_border, color: MyStyle.colorBlack),
              onPressed: _clickBookMark),
          new IconButton(
              icon: new Icon(Icons.share, color: MyStyle.colorBlack),
              onPressed: _clickShare)
        ],
      ),
      body: new Container(
        color: MyStyle.layoutBackground,
        child: _showLoadingAndData(),
      ),
      bottomNavigationBar: new Material(
        child: new CustomBottomNavigationBar(),
      ),
    );
  }

  @override
  void hideRequestedBooking() {}

  @override
  void showRequestedBooking(ActiveBooking ab) {
    setState(() {
      activeBooking=ab;
    });
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
      isLoading = false;
    });
    print('Doctor  Data${doctor.toString()}');
  }

  @override
  void showReviews(Comment c) {
    setState(() {
      comment = c;
      isLoading = false;
    });
    print('Review Data $comment');
  }

  @override
  void showBookings(List<Booking> b) {
    setState(() {
      bookingList = b;
      isLoading = false;
    });
    print('Booking Data$b');
  }

  @override
  void showDoctorSchedules(List<Schedule> schedules) {
    setState(() {
      scheduleList = schedules;
    });
    print('Schedule List $schedules');
  }

  @override
  void onLoadError() {
    print('Erorr');
  }
}
