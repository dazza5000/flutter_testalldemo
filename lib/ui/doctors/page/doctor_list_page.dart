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

  DoctorListPageState() {
    mPresenter = new DoctorListPresenter(this);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    mPresenter.getDoctorList(Configs.TEST_CODE, null, 2, '');
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new Container(
          margin: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 5.0),
          child: new SingleChildScrollView(
            controller: new ScrollController(),
            scrollDirection: Axis.vertical,
            child: new Column(
              children: <Widget>[
                new Align(
                  alignment: FractionalOffset.topRight,
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
                        style:
                            new TextStyle(fontSize: 14.0, color: Colors.grey),
                      ),
                      shape: new RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(30.0))),
                ),
                new DoctorLists(doctorsList, this)
              ],
            ),
          )),
    );
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
    });
    print('Doctor List$doctorsList');
  }

  @override
  void onLoadError() {}

  @override
  void onChooseFilters(List<int> roleList) {
    print('List Role$roleList');
    mPresenter.getDoctorList(Configs.TEST_CODE, roleList, null, null);
  }

  @override
  void onDoctorShareClick(Doctor doctor) {
    print('Doctor Share Click');
    mPresenter.shareDoctor(Configs.TEST_CODE, doctor.id);
  }

  @override
  void onDoctorFavClick(Doctor doctor) {
    print('Doctor Fav Click');
    mPresenter.favDoctor(Configs.TEST_CODE, doctor.id);
  }

  @override
  void onDoctorSaveClick(Doctor doctor) {
    print('Doctor Save Click');
    mPresenter.saveDoctor(Configs.TEST_CODE, doctor.id);
  }

  @override
  void onDoctorItemClick(Doctor doctor) {
    print('Doctor Item Click');
  }
}
