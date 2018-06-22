import 'package:flutter/material.dart';
import 'package:lyc_clinic/base/mystyle.dart';
import 'package:lyc_clinic/ui/doctors/widget/doctor_lists.dart';
import 'package:lyc_clinic/ui/doctors/data/doctor.dart';
import 'package:lyc_clinic/ui/doctors/data/doctors.dart';
import 'package:lyc_clinic/ui/doctors/data/search_result.dart';
import 'package:lyc_clinic/base/data/pagination.dart';
import 'package:lyc_clinic/ui/doctors/page/doctor_filter_page.dart';
import 'package:lyc_clinic/ui/doctors/contract/doctor_list_contract.dart';
import 'package:lyc_clinic/ui/doctors/presenter/doctor_list_presenter.dart';
import 'package:lyc_clinic/utils/configs.dart';
import 'package:lyc_clinic/ui/doctors/widget/create_doctor_buttons.dart';
import 'package:lyc_clinic/utils/mySharedPreferences.dart';

class DoctorListPage extends StatefulWidget {
  @override
  DoctorListPageState createState() {
    return new DoctorListPageState();
  }
}

class DoctorListPageState extends State<DoctorListPage>
    implements DoctorListContract, FilterListener, DoctorClickListener {
  DoctorListPresenter mPresenter;
  List<Doctor> doctorsList;
  Pagination pagination;
  String accessCode;
  bool isGuest = false;
  bool isLogin = false;
  bool isLoading = true;
  MySharedPreferences mySharedPreferences = new MySharedPreferences();

  DoctorListPageState() {
    mPresenter = new DoctorListPresenter(this);
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
                mPresenter.getDoctorList(accessCode, null, null, '');
              }));
    } else {
      isGuest = true;
      accessCode = Configs.GUEST_CODE;
      mPresenter.getDoctorList(accessCode, null, null, '');
    }
  }

  showLoadingOrData() {
    if (isLoading) {
      return new Container(
        child: new Center(
          child: new Container(
            child: new CircularProgressIndicator(
              strokeWidth: 2.0,
            ),
          ),
        ),
      );
    } else {
      return new SingleChildScrollView(
          controller: new ScrollController(),
          scrollDirection: Axis.vertical,
          child: new Container(
              padding: const EdgeInsets.only(top: 40.0),
              child: new DoctorLists(doctorsList, this)));
    }
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        body: new Container(
      padding: const EdgeInsets.symmetric(vertical: 0.0, horizontal: 5.0),
      color: MyStyle.layoutBackground,
      child: new Stack(children: <Widget>[
        showLoadingOrData(),
        new Align(
          alignment: FractionalOffset.topRight,
          child: new Padding(
            padding: const EdgeInsets.only(top: 10.0),
            child: new RaisedButton.icon(
                color: Colors.white,
                onPressed: () {
                  Navigator.push(
                      context,
                      new MaterialPageRoute(
                          builder: (_) => new DoctorFilterPage(this)));
                },
                icon: new Icon(
                  Icons.filter_list,
                  color: Colors.grey,
                ),
                label: new Text(
                  "FILTER",
                  style: new TextStyle(fontSize: 14.0, color: Colors.grey),
                ),
                shape: new RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(30.0))),
          ),
        ),
      ]),
    ));
  }

  @override
  void showSearchResults(List<SearchResult> r) {}

  @override
  void showMostRecentActiveDoctorList(List<Doctor> doctors) {}

  @override
  void showMoreDoctorList(List<Doctor> doctors) {
    doctorsList.addAll(doctors);
  }

  @override
  void showPagination(Pagination pagination) {
    pagination = pagination;
  }

  @override
  void showDoctorProfile(int doctorId) {}

  @override
  void showDoctorList(List<Doctor> doctors) {
    setState(() {
      doctorsList = doctors;
      isLoading = false;
    });
    print('Doctor List$doctorsList');
  }

  @override
  void onLoadError() {}

  @override
  void onChooseFilters(List<int> roleList) {
    print('List Role$roleList');
    mPresenter.getDoctorList(accessCode, roleList, null, null);
  }

  @override
  void onDoctorShareClick(Doctor doctor) {
    print('Doctor Share Click');
    mPresenter.shareDoctor(accessCode, doctor.id);
  }

  @override
  void onDoctorFavClick(Doctor doctor) {
    print('Doctor Fav Click');
    mPresenter.favDoctor(accessCode, doctor.id);
  }

  @override
  void onDoctorSaveClick(Doctor doctor) {
    print('Doctor Save Click');
    mPresenter.saveDoctor(accessCode, doctor.id);
  }

  @override
  void onDoctorItemClick(Doctor doctor) {
    print('Doctor Item Click');
  }
}
