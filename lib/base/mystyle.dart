import 'package:flutter/material.dart';

class MyStyle {
  static final double xlarge_fontSize = 20.0;
  static final double large_fontSize = 18.0;
  static final double xmedium_fontSize = 16.0;
  static final double medium_fontSize = 14.0;
  static final double small_fontSize = 12.0;

  static final Color colorPrimaryDark = Colors.grey[800];
  static final Color colorPrimary = Colors.grey[600];
  static final Color colorAccent = Colors.amber[700];
  static final Color colorWhite = Colors.white;
  static final Color colorBlack = Colors.black;
  static final Color colorGrey = Colors.grey[600];
  static final Color colorGreen = Colors.green[600];
  static final Color layoutBackground = Colors.grey[100];
  static final Color doctorCategoryHeaderBackground = Colors.grey[300];
  static final Color colorDarkGrey = Colors.grey[850];
  static final Color defaultGrey = Colors.grey;
  static final Color colorRed = Colors.red[700];
  static final Color chatRespondBackground = Colors.orange[100];


  static headerStyle() {
    return new TextStyle(
      color: Colors.black,
      fontWeight: FontWeight.bold,
      fontSize: large_fontSize,
    );
  }

  static TextStyle appbarTitleStyle() {
    return new TextStyle(color: colorBlack, fontSize: medium_fontSize);
  }

  static TextStyle buttonTextStyle(){
    return new TextStyle(color: colorWhite,fontSize: medium_fontSize);
  }

  static TextStyle listItemTextStyle(){
    return new TextStyle(color: MyStyle.colorBlack,fontSize: medium_fontSize);
  }

  static TextStyle dateTimeTextStyle(){
    return new TextStyle(color: MyStyle.defaultGrey,fontSize: small_fontSize);
  }


}