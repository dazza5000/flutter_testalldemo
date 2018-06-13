import 'package:flutter/material.dart';
import 'package:lyc_clinic/ui/home/data/banner_data.dart';
import 'package:lyc_clinic/ui/home/widget/services_scroller.dart';
import 'package:lyc_clinic/ui/home/widget/image_banner.dart';
import 'package:lyc_clinic/ui/doctors/widget/doctor_lists.dart';
import 'package:lyc_clinic/ui/doctors/data/doctor.dart';
import 'package:lyc_clinic/base/mystyle.dart';
import 'package:lyc_clinic/ui/doctors/page/doctor_list_page.dart';
import 'package:lyc_clinic/ui/service/data/service.dart';
import 'package:lyc_clinic/ui/home/presenter/home_presenter.dart';
import 'package:lyc_clinic/ui/home/contract/home_contract.dart';
import 'package:lyc_clinic/utils/configs.dart';
import 'package:lyc_clinic/ui/doctors/widget/create_doctor_buttons.dart';

class HomePage extends StatefulWidget {

  @override
  HomePageState createState() {
    return new HomePageState();
  }
}

class HomePageState extends State<HomePage> implements HomeContract ,DoctorClickListener{

  HomePresenter mPresenter;
  List<Service> serviceList;
  List<Doctor> doctorList;
  List<BannerData> bannerList;


  HomePageState() {
    mPresenter = new HomePresenter(this);
  }

  @override
  void initState() {
    super.initState();
    mPresenter.getService(Configs.TEST_CODE);
    mPresenter.getDoctor(Configs.TEST_CODE, 3);
    mPresenter.getBanner(Configs.TEST_CODE);
  }

  @override
  Widget build(BuildContext context) {
    _clickSeeMore(BuildContext context) {
      Navigator.push(
          context, new MaterialPageRoute(builder: (_) => new DoctorListPage()));
    }
    return new Scaffold(
        body: new SingleChildScrollView(
          controller: new ScrollController(),
          scrollDirection: Axis.vertical,
          child: new Center(
              child: new Column(
                children: <Widget>[
                  new ImageBanner(bannerList),
                  new ServicesScroller(serviceList),
                  new DoctorLists(doctorList,this),
                  /*new Expanded(
                      child: new Column(children: <Widget>[],)),*/
                  new Row(
                      children: <Widget>[
                        new Expanded(
                            child: new MaterialButton(
                              padding: const EdgeInsets.only(
                                  top: 15.0, bottom: 15.0),
                              child: new Text('See More',
                                style: new TextStyle(
                                    color: MyStyle.colorWhite,
                                    fontSize: MyStyle.medium_fontSize),),
                              onPressed: () => _clickSeeMore(context),
                              color: MyStyle.colorAccent,)),
                      ]
                  )
                ],
              )
          ),
        )
    );
  }

  @override
  void hideDoctorDialog() {
    // TODO: implement hideDoctorDialog
  }

  @override
  void hideServiceDialog() {
    // TODO: implement hideServiceDialog
  }

  @override
  void onLoadError() {
    // TODO: implement onLoadError
  }


  @override
  void showDoctorDialog() {
    // TODO: implement showDoctorDialog
  }

  @override
  void showDoctors(List<Doctor> d) {
    // TODO: implement showDoctors
    setState(() {
      doctorList = d;
      print('Doctor Respone Page $doctorList');
    });
  }

  @override
  void showErrorMessage(String message) {
    // TODO: implement showErrorMessage
  }

  @override
  void showMessage(String message) {
    // TODO: implement showMessage
  }

  @override
  void showMoreDoctors() {
    // TODO: implement showMoreDoctors
  }

  @override
  void showServiceDialog() {
    // TODO: implement showServiceDialog
  }

  @override
  void showServicePicker() {
    // TODO: implement showServicePicker
  }

  @override
  void showServices(List<Service> services) {
    setState(() {
      serviceList = services;
      print("Services${serviceList[0]}");
    });
  }

  @override
  void showBanner(List<BannerData> banner) {
    setState(() {
      bannerList=banner;
    });
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

  }


}