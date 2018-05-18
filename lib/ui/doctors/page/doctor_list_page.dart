import 'package:flutter/material.dart';
import 'package:lyc_clinic/base/mystyle.dart';
import 'package:lyc_clinic/ui/doctors/widget/doctor_lists.dart';
import 'package:lyc_clinic/ui/doctors/model/doctor.dart';
import 'package:lyc_clinic/ui/doctors/page/doctor_filter_page.dart';


class DoctorListPage extends StatefulWidget {
  List<Doctor> doctors = [
    new Doctor(
        65,
        "ေဒါက္တာယမင္းရူပါထြန္း",
        "",
        "ဗဟိုအမ်ိဳးသမီးေဆးရံုၾကီး",
        false,
        'Radiologists(ဓါတ္ေရာင္ျခည္ဆုုိင္ရာ အထူးကုုဆရာ၀န္)',
        "M.B.,B.S,M.Med.Sc(Radiology)",
        null,
        true,
        1,
        0,
        "http://linyaungchi.com",
        false,
        true),
    new Doctor(
        65,
        "ပါေမာကၡေဒါက္တာလွလွ",
        "",
        "ဗဟိုအမ်ိဳးသမီးေဆးရံုၾကီး",
        false,
        'Radiologists(ဓါတ္ေရာင္ျခည္ဆုုိင္ရာ အထူးကုုဆရာ၀န္)',
        "M.B.,B.S,M.Med.Sc(Radiology)",
        null,
        true,
        1,
        0,
        "http://linyaungchi.com",
        false,
        true)
  ];

  @override
  DoctorListPageState createState() {
    return new DoctorListPageState();
  }
}

class DoctorListPageState extends State<DoctorListPage> {


  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new Container(
        margin: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 5.0),
        child: new Column(
          children: <Widget>[
            new Align(
              alignment: FractionalOffset.topRight,
              child: new RaisedButton.icon(
                  color: Colors.white,
                  onPressed: () {
                    Navigator.push(context, new MaterialPageRoute(
                        builder: (_) => new DoctorFilterPage()));
                  },
                  icon: new Icon(
                    Icons.filter_list, color: Colors.grey,),
                  label: new Text("FILTER", style: new TextStyle(
                      fontSize: 14.0, color: Colors.grey),),
                  shape: new RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(30.0))
              ),
            ),

            new DoctorLists(widget.doctors)

          ],
        ),
      ),
    );
  }
}