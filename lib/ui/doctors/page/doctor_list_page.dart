import 'package:flutter/material.dart';
class DoctorListPage extends StatefulWidget{


  @override
  DoctorListPageState createState() {
    return new DoctorListPageState();
  }
}

class DoctorListPageState extends State<DoctorListPage>{

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new Center(
        child: new Text('Doctor List Fragemnt'),
      ),
    );
  }
}