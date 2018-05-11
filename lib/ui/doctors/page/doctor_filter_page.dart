import 'package:flutter/material.dart';
import 'package:lyc_clinic/base/mystyle.dart';

class DoctorFilterPage extends StatefulWidget {

  @override
  DoctorFilterPageState createState() {
    return new DoctorFilterPageState();
  }
}

class DoctorFilterPageState extends State<DoctorFilterPage> {
  int goupValue;

  _clickRadio(int i) {
    setState(() {
      goupValue = i;
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Filters', style: MyStyle.appbarTitleStyle()),
        leading: new IconButton(
            icon: new Icon(Icons.clear, color: MyStyle.colorBlack),
            onPressed: () => Navigator.pop(context)),
      ),
      body: new Container(
        child: new Column(
          children: <Widget>[
            new Text('Speciality',
              style: new TextStyle(fontSize: MyStyle.xlarge_fontSize),),
            new ListView.builder(
              itemBuilder: _buildSpecialityList,
              itemCount: 4,
              controller: new ScrollController(),
              shrinkWrap: true,
              scrollDirection: Axis.vertical,),
            new Expanded(
                child: new Column(children: <Widget>[],)),
            new Row(
                children: <Widget>[
                  new Expanded(
                      child: new MaterialButton(
                        padding: const EdgeInsets.only(
                            top: 15.0, bottom: 15.0),
                        child: new Text('Continue',
                          style: new TextStyle(
                              color: Colors.white,
                              fontSize: MyStyle.medium_fontSize),),
                        onPressed: null,
                        color: MyStyle.colorGreen,)),
                ]
            )

          ],
        ),
      ),
    );
  }

  _buildSpecialityList(BuildContext context, int index) {
    return new Column(
      children: <Widget>[
        new Divider(color: MyStyle.defaultGrey, height: 2.0,),
      ],
    );
  }
}