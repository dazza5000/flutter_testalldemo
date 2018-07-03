import 'package:flutter/material.dart';
import 'package:lyc_clinic/utils/mySharedPreferences.dart';
import 'package:lyc_clinic/utils/configs.dart';
import 'package:lyc_clinic/base/mystyle.dart';
import 'package:lyc_clinic/ui/home/data/location.dart';
import 'package:lyc_clinic/ui/home/data/sublocation.dart';
import 'package:lyc_clinic/ui/home/data/region.dart';
import 'package:lyc_clinic/ui/home/presenter/location_presenter.dart';
import 'package:lyc_clinic/ui/home/contract/location_contract.dart';

class LocationListPage extends StatefulWidget {
  LocationChangedListener listener;

  LocationListPage(this.listener);

  @override
  LocationListPageState createState() {
    return new LocationListPageState();
  }
}

class LocationListPageState extends State<LocationListPage>
    implements LocationContract {
  List<Location> locationList = new List<Location>();
  List<SubLocation> subLocationList = new List<SubLocation>();
  List<Region> regionList = new List<Region>();
  MySharedPreferences mySharedPreferences = new MySharedPreferences();
  LocationPresenter mPresenter;
  bool isLogin;
  bool isGuest;
  String accessCode;

  LocationListPageState() {
    mPresenter = new LocationPresenter(this);
  }

  @override
  void initState() {
    super.initState();
    mySharedPreferences
        .getBooleanData(Configs.PREF_USER_LOGIN)
        .then((val) => getAccessCode(val != null ? val : false));
  }

  void getAccessCode(bool login) {
    if (login) {
      isGuest = false;
      mySharedPreferences.getStringData(Configs.PREF_USER_ACCESSCODE).then((v) {
        accessCode = v;
        mPresenter.getRegion(accessCode);
      });
    } else {
      isGuest = true;
      accessCode = Configs.GUEST_CODE;
      mPresenter.getRegion(accessCode);
    }
  }

  _buildExpandableContent(Region region) {
    List<Widget> columnContent = [];
    for (int i = 0; i < region.items.length; i++) {
      columnContent.add(
        new ListTile(
          title: new GestureDetector(
            child: new Text(
              region.items[i].name,
              style: MyStyle.listItemTextStyle(),
            ),
            onTap: () => clickExpandedData(region.items[i]),
          ),
        ),
      );
    }
    return columnContent;
  }

  clickExpandedData(SubLocation subLocation) {
    widget.listener.onLocationChanged(subLocation);
    Navigator.pop(context);
  }

  Widget _buildLocationItem(BuildContext context, int index) {
    Region region = regionList[index];
    return new ExpansionTile(
        title: new Text(region.title),
        trailing: new Icon(Icons.arrow_drop_down),
        children: _buildExpandableContent(regionList[index]));
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        backgroundColor: MyStyle.colorWhite,
        title: new Text(
          'Choose Location',
          style: MyStyle.appbarTitleStyle(),
        ),
        leading: new IconButton(
            icon: new Icon(
              Icons.clear,
              color: MyStyle.colorBlack,
            ),
            onPressed: () => Navigator.pop(context)),
      ),
      body: new Container(
        child: new ListView.builder(
          itemBuilder: _buildLocationItem,
          controller: new ScrollController(),
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          itemCount: regionList.length,
        ),
      ),
    );
  }

  @override
  void showLocationList(List<Region> r) {
    setState(() {
      regionList.addAll(r);
    });
    print('Show location List page${r.toString()}');
  }

  @override
  void getCityList(List<Location> regions) {
    setState(() {
      locationList.addAll(regions);
    });
    mPresenter.getCityList(accessCode, regions);
  }

  @override
  void matchLocation(List<SubLocation> sl) {
    setState(() {
      subLocationList.addAll(sl);
    });
    mPresenter.matchLocations(locationList, sl);
  }
}

abstract class LocationChangedListener {
  void onLocationChanged(SubLocation subLocation);
}
