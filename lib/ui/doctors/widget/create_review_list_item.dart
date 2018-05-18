import 'package:flutter/material.dart';
import 'package:lyc_clinic/ui/doctors/widget/create_doctor_buttons.dart';
import 'package:lyc_clinic/ui/comment/page/comment_page.dart';
import 'package:lyc_clinic/base/mystyle.dart';
import 'package:lyc_clinic/test/test_page.dart';

class ReviewListItem extends StatefulWidget {

  @override
  ReviewListItemState createState() {
    return new ReviewListItemState();
  }
}

class ReviewListItemState extends State<ReviewListItem> {

  _clickReview(BuildContext context) {
    Navigator.push(context, new MaterialPageRoute(builder: (_) => new TestPage()));
  }

  Widget _getFloatButton(IconData ic, Color bgColor, Color icColor) {
    return new Container(
      width: 40.0,
      height: 40.0,
      decoration: new BoxDecoration(
          shape: BoxShape.circle,
          color: bgColor,
          boxShadow: [new BoxShadow(
              color: MyStyle.defaultGrey,
              blurRadius: 4.0,
              offset: new Offset(1.0, 4.0)
          ),
          ]
      ),
      child: new Icon(ic, color: icColor,),
    );
  }


  Widget _roundButton(BuildContext context) {
    return new RaisedButton(
        color: MyStyle.colorGrey,
        onPressed:() => _clickReview(context),
        child: new Text("Review ေပးရန္", style: new TextStyle(
            fontSize: 14.0, color: MyStyle.colorWhite),),
        shape: new RoundedRectangleBorder(
            borderRadius: new BorderRadius.circular(30.0))
    );
  }

  @override
  Widget build(BuildContext context) {
    return new Container(
      margin: const EdgeInsets.only(top: 15.0),
      child: new Stack(
        children: <Widget>[
          new Padding(padding: const EdgeInsets.only(top: 20.0),
            child: new Card(
              child: new Column(
                children: <Widget>[
                  new Padding(padding: const EdgeInsets.symmetric(
                      vertical: 30.0, horizontal: 5.0),
                    child: new Divider(color: Colors.black45, height: 2.0,),)

                ],
              ),
            ),
          ),


          new Align(
              alignment: FractionalOffset.topLeft,
              child: new Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5.0),
                child: new Row(
                  children: <Widget>[

                    new InkWell(
                      child: new Padding(
                        padding: const EdgeInsets.only(
                            top: 10.0, left: 10.0, right: 0.0),
                        child: _getFloatButton(
                            Icons.rate_review, Colors.white, MyStyle.defaultGrey),
                      ),
                      onTap:() => _clickReview(context),
                    ),


                    new Expanded(child: new Row(children: <Widget>[],)),
                    _roundButton(context)
                  ],
                ),
              )
          )
        ],
      ),
    );
  }
}