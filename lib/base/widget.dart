import 'package:flutter/material.dart';
import 'dart:async';
import 'package:lyc_clinic/base/mystyle.dart';
import 'package:lyc_clinic/ui/login/login_dialog_page.dart';

class BaseWidgets{

  static Widget getFloatButton(IconData ic, Color bgColor, Color icColor) {
    return new Container(
      width: 40.0,
      height: 40.0,
      decoration:
      new BoxDecoration(shape: BoxShape.circle, color: bgColor, boxShadow: [
        new BoxShadow(
            color: Colors.grey, blurRadius: 4.0, offset: new Offset(1.0, 4.0)),
      ]),
      child: new Icon(
        ic,
        color: icColor,
      ),
    );
  }

  static Future<Null> showLoginDialog(BuildContext context) async {
    return await showModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return new Container(
              color: MyStyle.colorWhite,
              height: 150.0,
              child: new LoginDialogPage());
          //return null;
        });
  }

  static Widget loadingIndicator = new Container(
      child: new CircularProgressIndicator(
        strokeWidth: 2.0,
      ));


}