import 'package:flutter/material.dart';
import 'package:lyc_clinic/base/mystyle.dart';

class ProfileDataPage extends StatefulWidget{
  @override
  ProfileDataPageState createState() {
    return new ProfileDataPageState();
  }
}

class ProfileDataPageState extends State<ProfileDataPage>{
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: MyStyle.layoutBackground,
      body: new Container(
        child: new Column(
          children: <Widget>[
            new TabBar(
              tabs: <Widget>[
                new Tab(text: 'Title1',),
                new Tab(text: 'Title2',),
                new   Tab(text: 'Title3',),
              ],
              /*children: <Widget>[
                new Tab(child: new Text('Title1'),),
                new Tab(child: new Text('Title2'),),
                new Tab(child: new Text('Title3'),),
              ],*/
              //controller: new TabController(length: 3, vsync: this),

            )
          ],
        ),

      ),
    );
  }
}