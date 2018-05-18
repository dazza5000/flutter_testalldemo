import 'package:flutter/material.dart';
import 'package:lyc_clinic/base/mystyle.dart';

class TestWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new TestWidgetStae();
  }
}

class TestWidgetStae extends State<TestWidget> {
  InputDecoration getDecoration(String hinttext) {
    return new InputDecoration(
        hintText: hinttext,
        filled: true,
        fillColor: MyStyle.layoutBackground,
        contentPadding: const EdgeInsets.all(10.0),
        border: new OutlineInputBorder(
            borderRadius: new BorderRadius.circular(5.0),
            borderSide: new BorderSide(
                color: MyStyle.defaultGrey, width: 1.0),
            gapPadding: 0.5
        )
    );
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Container(
      child: new Column(
        children: <Widget>[
          new Padding(
            padding: const EdgeInsets.symmetric(vertical: 5.0),
            child: new Text('User Name', style: MyStyle.captionTextStyle()),),

          new TextField(
              obscureText: false,
              controller: new TextEditingController(),
              //initialValue: 'Hnin Nway Nway Hlaing',
              decoration: getDecoration('Name')
          ),
        ],
      ),
    );
  }
}