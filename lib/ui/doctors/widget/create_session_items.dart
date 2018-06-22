import 'package:flutter/material.dart';

class SessionItems extends StatelessWidget {
  List<String> scheduleArr = ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'];
  List<Widget> widgets;
  int i = 0;
  int j = 4;

  _scheduleWidget() {
    return new Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: <Widget>[
        new Column(
          children: <Widget>[
            _getScheduleWidget("_", i),
            _getScheduleWidget("_", j),
          ],
        ),
        new Column(
          children: <Widget>[
            _getScheduleWidget("_", i + 1),
            _getScheduleWidget("_", j + 1),
          ],
        ),
        new Column(
          children: <Widget>[
            _getScheduleWidget("_", i + 2),
            _getScheduleWidget("_", j + 2),
          ],
        ),
        new Column(
          children: <Widget>[
            _getScheduleWidget("_", i + 3),
            new Opacity(
              opacity: 0.0,
              child: _getScheduleWidget("_", i + 3),
            )
          ],
        )
      ],
    );
  }

  /*_scheduleWidget() {
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
              )
          ),
          //Column2
          new Padding(
              padding: const EdgeInsets.only(top: 5.0, bottom: 5.0),
              child: new Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                //crossAxisAlignment: CrossAxisAlignment.start,
                children: _getScheduleWidgets(
                    scheduleArr, 4, scheduleArr.length),
              )
          )
        ],
      ),
    );
  }*/

  _scheduleWidgetItems(bool status, String title, String subTitle) {
    Color mColor = status ? Colors.grey : Colors.black38;
    return new Padding(
        padding: const EdgeInsets.only(top: 5.0, bottom: 5.0, left: 5.0),
        child: new Row(
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
        ));
  }

  _getScheduleWidget(String subTitle, int i) {
    return _scheduleWidgetItems(false, scheduleArr[i], subTitle);
  }

  /*List<Widget> _getScheduleWidgets(List<String> schedules, int start, int end) {
    widgets = new List<Widget>();
    for (int i = start; i < end; i++) {
      widgets.add(_scheduleWidgetItems(false, scheduleArr[i], '-'));
    }
    return widgets;
  }*/

  @override
  Widget build(BuildContext context) {
    return new Container(
      padding: const EdgeInsets.all(5.0),
      child: _scheduleWidget(),
    );
  }
}
