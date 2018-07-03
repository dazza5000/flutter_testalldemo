import 'package:flutter/material.dart';
import 'package:lyc_clinic/ui/doctors/data/doctor.dart';
import 'package:lyc_clinic/ui/doctors/page/doctor_details_page.dart';
import 'package:lyc_clinic/base/mystyle.dart';
import 'package:lyc_clinic/ui/doctors/widget/create_session_items.dart';
import 'package:lyc_clinic/ui/doctors/data/schedule.dart';

class CreateDoctorItem extends StatelessWidget {
  CreateDoctorItem(this.doctor);

  final Doctor doctor;
  List<String> scheduleArr = ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'];
  List<Widget> widgets;

  _navigatorToDoctorDetails(BuildContext context) {
    Navigator.push(context,
        MaterialPageRoute(builder: (_) => new DoctorDetailsPage(doctor.id)));
  }

  @override
  Widget build(BuildContext context) {
    return new Container(
        child: new Column(
      children: <Widget>[
        new InkWell(
          onTap: () => _navigatorToDoctorDetails(context),
          child: new Card(
            color: Colors.white,
            child: new Container(
              child: new Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  new Container(
                    padding: const EdgeInsets.only(
                        left: 5.0, right: 5.0),
                    color: MyStyle.colorLightGrey,
                    child: new Center(
                      child: new Text(
                        doctor.role,
                        style: new TextStyle(
                          fontSize: MyStyle.xmedium_fontSize,
                        ),
                        textAlign: TextAlign.left,
                      ),
                    ),
                    height: 40.0,
                  ),
                  new Padding(
                    padding: const EdgeInsets.only(left: 5.0),
                    child: new Text(
                      doctor.name,
                      style: new TextStyle(
                        fontSize: MyStyle.xmedium_fontSize,
                      ),
                      textAlign: TextAlign.left,
                    ),
                  ),
                  new Padding(
                    padding: const EdgeInsets.only(left: 5.0),
                    child: new Text(
                      doctor.degree,
                      style: new TextStyle(
                          fontSize: MyStyle.small_fontSize,
                          fontWeight: FontWeight.normal),
                      textAlign: TextAlign.left,
                    ),
                  ),
                  new Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: new Divider(
                      height: 2.0,
                      color: Colors.grey,
                    ),
                  ),
                  new SessionItems(),
                  new Container(
                    height: 15.0,
                    color: MyStyle.colorWhite,
                  ),
                ],
              ),
            ),
          ),
        ),
        new Container(
          height: 20.0,
          color: MyStyle.layoutBackground,
        ),
      ],
    ));
  }

  _scheduleWidget() {
    return new Container(
      child: new Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          //Column1
          new Padding(
              padding: const EdgeInsets.only(
                  top: 5.0, bottom: 5.0, left: 10.0, right: 10.0),
              child: new Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                //crossAxisAlignment: CrossAxisAlignment.center,
                children: _getScheduleWidgets(scheduleArr, 0, 4),
              )),
          //Column2
          new Padding(
              padding: const EdgeInsets.only(top: 5.0, bottom: 5.0),
              child: new Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                //crossAxisAlignment: CrossAxisAlignment.start,
                children:
                    _getScheduleWidgets(scheduleArr, 4, scheduleArr.length),
              ))
        ],
      ),
    );
  }

  _scheduleWidgetItems(bool status, String title, String subTitle) {
    Color mColor = status ? Colors.grey : Colors.black38;
    return new Row(
      mainAxisAlignment: MainAxisAlignment.start,
      //mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        new Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            new Icon(Icons.date_range, color: mColor, size: 20.0),
            new Icon(
              Icons.access_time,
              color: mColor,
              size: 20.0,
            ),
          ],
        ),
        new Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            new Text(title,
                style: new TextStyle(fontSize: 12.0, color: mColor)),
            new Text('05:00 PM',
                style: new TextStyle(fontSize: 12.0, color: mColor))
          ],
        )
      ],
    );
  }

  List<Widget> _getScheduleWidgets(List<String> schedules, int start, int end) {
    widgets = new List<Widget>();
    for (int i = start; i < end; i++) {
      widgets.add(_scheduleWidgetItems(false, scheduleArr[i], '-'));
    }
    return widgets;
  }
}
