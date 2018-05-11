import 'package:flutter/material.dart';
import 'package:lyc_clinic/base/mystyle.dart';

class ProfileInfoPage extends StatefulWidget{
  @override
  ProfileInfoPageState createState() {
    return new ProfileInfoPageState();
  }
}

class ProfileInfoPageState extends State<ProfileInfoPage>{
  @override
  Widget build(BuildContext context) {
    TextStyle captionStyle=new TextStyle(fontSize: MyStyle.small_fontSize,color: MyStyle.defaultGrey);
    return new Container(
      color: MyStyle.layoutBackground,
      child: new Column(
        children: <Widget>[
          new Stack(
            children: <Widget>[
              new Container(
                //padding: const EdgeInsets.all(5.0),
                margin: const EdgeInsets.all(5.0),
                color: MyStyle.colorWhite,
                child: new Column(

                  children: <Widget>[
                    new Padding(padding: const EdgeInsets.symmetric(vertical: 5.0),child: new Text('User Name',style: captionStyle),),
                    new Padding(padding: const EdgeInsets.symmetric(vertical: 5.0),child: new Text('User Name',style: captionStyle),),
                  ],
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}