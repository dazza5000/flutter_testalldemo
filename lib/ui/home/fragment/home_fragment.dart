import 'package:flutter/material.dart';
import 'package:xbanner/xbanner.dart';

class HomeFragment extends StatelessWidget {
  List<Widget> widgets = new List();
  List<String> images = [
    'images/1.png', 'images/2.png', 'images/3.png', 'images/4.png'];

  List<Widget> _getWidget(List<String> data) {
    for (int i = 0; i < data.length; i++) {
      widgets.add(
          new Image.asset(
            data[i].toString(),
            height: 100.0,
            fit: BoxFit.fill,)
      );
    }
    return widgets;
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new Center(
          child: new Column(
            children: <Widget>[
              new SizedBox.fromSize(
                size: const Size.fromHeight(200.0),
                child: new XBanner(_getWidget(images)),
              ),
              new Text('Services'),

            ],
          )
      ),
    );
  }
}