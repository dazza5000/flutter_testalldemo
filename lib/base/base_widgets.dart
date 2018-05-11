import 'package:flutter/material.dart';

class BaseWidgets {

  Widget _getFloatButton(IconData ic, Color bgColor, Color icColor) {
    return new Container(
      width: 40.0,
      height: 40.0,
      decoration: new BoxDecoration(
          shape: BoxShape.circle,
          color: bgColor,
          boxShadow: [new BoxShadow(
              color: Colors.grey,
              blurRadius: 4.0,
              offset: new Offset(1.0, 4.0)
          ),
          ]
      ),
      child: new Icon(ic, color: icColor,),
    );
  }

  Widget _roundButton() {
    return null;
   /* return new RaisedButton.icon(
        color: Colors.white,
        onPressed: () {
          Navigator.push(context, new MaterialPageRoute(
              builder: (_) => new FilterHealthEducationDialogFragment()));
        },
        icon: new Icon(
          Icons.filter_list, color: Colors.grey,),
        label: new Text("FILTER", style: new TextStyle(
            fontSize: 14.0, color: Colors.grey),),
        shape: new RoundedRectangleBorder(
            borderRadius: new BorderRadius.circular(30.0))
    );*/
  }
}