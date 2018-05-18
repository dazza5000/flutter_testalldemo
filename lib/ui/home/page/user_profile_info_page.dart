import 'package:flutter/material.dart';
import 'package:lyc_clinic/base/mystyle.dart';

class UserProfileInfoPage extends StatefulWidget {
  @override
  UserProfileInfoPageState createState() {
    return new UserProfileInfoPageState();
  }
}

class UserProfileInfoPageState extends State<UserProfileInfoPage> {
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
    return new Scaffold(
      backgroundColor: MyStyle.layoutBackground,
      body: new Container(
          child: new SingleChildScrollView(
            controller: new ScrollController(),
            child: new Column(
              children: <Widget>[
                new Padding(
                  padding: const EdgeInsets.symmetric(vertical: 5.0),
                  child: new Text(
                      'User Name', style: MyStyle.captionTextStyle()),),

                new TextField(
                    obscureText: false,
                    controller: new TextEditingController(),
                    //initialValue: 'Hnin Nway Nway Hlaing',
                    decoration: getDecoration('Name')
                ),
              ],
            ),
            scrollDirection: Axis.vertical,
          )
      ),
    );
    /*return new Scaffold(
        backgroundColor: MyStyle.layoutBackground,
        body: new Stack(
          overflow: Overflow.clip,
          fit: StackFit.expand,
          children: <Widget>[
            new Container(
                margin: const EdgeInsets.symmetric(
                    horizontal: 10.0, vertical: 15.0),
                color: MyStyle.colorWhite,
                child: new ListView(
                  shrinkWrap: true,
                  children: <Widget>[
                    new Padding(
                      padding: const EdgeInsets.symmetric(vertical: 5.0),
                      child: new Text(
                          'User Name', style: MyStyle.captionTextStyle()),),

                    new TextField(
                        obscureText: false,
                        controller: new TextEditingController(),
                        //initialValue: 'Hnin Nway Nway Hlaing',
                        decoration: getDecoration('Name')
                    ),

                    new Padding(
                      padding: const EdgeInsets.symmetric(vertical: 5.0),
                      child: new Text('Mobile Phone',
                          style: MyStyle.captionTextStyle()),),
                    new TextField(
                      obscureText: true,
                      //initialValue: '09400404010',
                      decoration: getDecoration('Phone'),
                    ),

                    new Padding(
                      padding: const EdgeInsets.symmetric(vertical: 5.0),
                      child: new Text(
                          'Age', style: MyStyle.captionTextStyle()),),

                    new TextField(
                        //initialValue: '24',
                        decoration: getDecoration('Age')
                    ),

                    new Padding(
                      padding: const EdgeInsets.symmetric(vertical: 5.0),
                      child: new Text(
                          'Age', style: MyStyle.captionTextStyle()),),


                  ],
                )

            )
          ],
        )

    );*/
  }
}