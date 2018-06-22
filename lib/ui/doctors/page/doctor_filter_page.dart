import 'package:flutter/material.dart';
import 'package:lyc_clinic/base/mystyle.dart';
import 'package:lyc_clinic/ui/doctors/data/doctor_role.dart';
import 'package:lyc_clinic/ui/doctors/contract/doctor_filter_contract.dart';
import 'package:lyc_clinic/ui/doctors/presenter/doctor_filter_presenter.dart';
import 'package:lyc_clinic/utils/configs.dart';

class DoctorFilterPage extends StatefulWidget {
  FilterListener listener;

  DoctorFilterPage(this.listener);

  @override
  DoctorFilterPageState createState() {
    return new DoctorFilterPageState();
  }
}

class DoctorFilterPageState extends State<DoctorFilterPage>
    implements DoctorFilterContract {
  int goupValue;
  DoctorFilterPresenter mPresenter;
  List<DoctorRole> doctorRoles = new List<DoctorRole>();
  List<DoctorRole> tempList = new List<DoctorRole>();
  List<DoctorRole> selectedLit = new List<DoctorRole>();

  DoctorFilterPageState() {
    mPresenter = new DoctorFilterPresenter(this);
  }

  _clickRadio(int i) {
    setState(() {
      goupValue = i;
    });
  }

  _continueClick(BuildContext context) {
    print('Continue Click');
    if (selectedLit.isNotEmpty) {
      List<int> catList = List<int>();
      for (int i = 0; i < selectedLit.length; i++) {
        catList.add(selectedLit[i].id);
        widget.listener.onChooseFilters(catList);
      }
    } else {
      widget.listener.onChooseFilters(null);
    }
    Navigator.pop(context);
  }

  void _clearClick() {
    setState(() {
      if (tempList.isNotEmpty) {
        for (int i = 0; i < tempList.length; i++) {
          tempList[i].isSelected = false;
        }
      }

      if (doctorRoles.length > 0) {
        doctorRoles.clear();
        doctorRoles.addAll(tempList);
        selectedLit.clear();
      }
    });
  }

  @override
  void initState() {
    super.initState();
    mPresenter.getDoctorRole(Configs.GUEST_CODE);
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        backgroundColor: MyStyle.colorWhite,
        title: new Text('Filters', style: MyStyle.appbarTitleStyle()),
        leading: new IconButton(
            icon: new Icon(Icons.clear, color: MyStyle.colorBlack),
            onPressed: () => Navigator.pop(context)),
        actions: <Widget>[_buildClearButton()],
      ),
      body: new Container(
          child: new Stack(
        children: <Widget>[
          new Column(
            children: <Widget>[
              new Text(
                'Speciality',
                style: new TextStyle(fontSize: MyStyle.xlarge_fontSize),
              ),
              new Flexible(
                  child: new ListView.builder(
                padding: const EdgeInsets.only(top: 10.0),
                controller: new ScrollController(),
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                itemBuilder: _buildSpecialityList,
                itemCount: doctorRoles.length,
              )),
            ],
          ),
          new Align(
              alignment: FractionalOffset.bottomCenter,
              child: new Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    new Expanded(
                        child: new MaterialButton(
                      padding: const EdgeInsets.only(top: 15.0, bottom: 15.0),
                      child: new Text(
                        'Continue',
                        style:
                            new TextStyle(color: Colors.white, fontSize: 14.0),
                      ),
                      onPressed: () => _continueClick(context),
                      color: Colors.green,
                    )),
                  ]))
        ],
      )),
    );
  }

  Widget _buildSpecialityList(BuildContext context, int index) {
    var doctorRole = doctorRoles[index];
    bool isSelected = doctorRole.isSelected;
    return new Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        new ListTile(
          title: new Text(
            doctorRole.name,
            style: new TextStyle(
                color: isSelected ? MyStyle.colorGreen : MyStyle.colorGrey,
                fontSize: MyStyle.medium_fontSize),
          ),
          trailing: new Icon(
              isSelected ? Icons.check_circle : Icons.radio_button_unchecked,
              color: isSelected ? MyStyle.colorGreen : MyStyle.colorGrey),
          onTap: () {
            setState(() {
              doctorRoles[index].isSelected = !isSelected;
              if (!isSelected) {
                selectedLit.add(doctorRoles[index]);
              }
            });
          },
        ),
        new Divider(
          color: MyStyle.defaultGrey,
          height: 2.0,
        ),
      ],
    );
  }

  _buildClearButton() {
    return new Container(
        margin: const EdgeInsets.only(right: 5.0),
        child: new Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new Container(
              width: 50.0,
              height: 30.0,
              decoration: new BoxDecoration(
                  shape: BoxShape.rectangle,
                  color: Colors.black,
                  borderRadius: new BorderRadius.circular(15.0)),
              child: new GestureDetector(
                onTap: _clearClick,
                child: new Text(
                  'Clear',
                  style: new TextStyle(color: Colors.white),
                ),
              ),
              alignment: Alignment.center,
            )
          ],
        ));
  }

  @override
  void showRoles(List<DoctorRole> r) {
    setState(() {
      doctorRoles = r;
      tempList.clear();
      tempList.addAll(r);

      /*if (DataUtils.isExist(mContext, Configs.OBJ_DOC_ROLES)) {
        if (DataUtils.ReadArraylist(mContext, Configs.OBJ_DOC_ROLES) != null) {
          val s = DataUtils.ReadArraylist(mContext, Configs.OBJ_DOC_ROLES) as ArrayList<Int>
          if (s.isNotEmpty()) {
            for (i in 0 until s.size) {
              (0 until r.size)
                  .filter { s[i] == r[it].id }
          .forEach { r[it].isSelected = true }
    }
    }
    }
    }*/
    });
    print('Doctor Role $doctorRoles');
  }
}

abstract class FilterListener {
  void onChooseFilters(List<int> roleList);
}
