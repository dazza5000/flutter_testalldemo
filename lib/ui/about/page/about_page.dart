import 'package:flutter/material.dart';
import 'package:lyc_clinic/base/mystyle.dart';
import 'package:lyc_clinic/test/custom_bottom_navigation_bar.dart';


class AboutPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        leading: new IconButton(
            icon: new Icon(Icons.arrow_back, color: MyStyle.colorWhite),
            onPressed: () => Navigator.pop(context)),
        toolbarOpacity: 0.0,
       title: new Image.asset('assets/images/1.png', scale: 2.0,
           alignment: FractionalOffset.center),
      ),
      body: new Container(
        child: new Column(
          children: <Widget>[
          ],
        ),
      ),
      bottomNavigationBar: new CustomBottomNavigationBar(),
    );
  }
}