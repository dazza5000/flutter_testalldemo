import 'package:flutter/material.dart';
import 'package:lyc_clinic/base/mystyle.dart';

class CommentEditDialogPage extends StatefulWidget {
  @override
  CommentEditDialogPageState createState() {
    // TODO: implement createState
    return new CommentEditDialogPageState();
  }
}

class CommentEditDialogPageState extends State<CommentEditDialogPage> {

  _cancelClick(BuildContext context) {
    Navigator.pop(context);
  }

  _updateClick(BuildContext context, String val) {
    setState(() {

    });
    Navigator.pop(context);
  }

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
      appBar: new AppBar(
        backgroundColor: MyStyle.colorWhite,
        leading: new IconButton(
            icon: new Icon(Icons.clear, color: MyStyle.colorBlack),
            onPressed: () => Navigator.pop(context)),
        centerTitle: true,
        title: new Text('Edit',
          style: new TextStyle(color: MyStyle.colorBlack, fontSize: MyStyle.xmedium_fontSize),),
      ),
      body: new Container(
        padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 15.0),
        color: MyStyle.colorWhite,
        child: new Container(
          child: new Column(
            children: <Widget>[
              new TextField(
                  obscureText: false,
                  controller: new TextEditingController(),
                  decoration: getDecoration('Name')
              ),
              new Container(
                  margin: const EdgeInsets.only(top: 15.0),
                  child: new Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      new Padding(
                          padding: const EdgeInsets.only(right: 5.0),
                          child: new RaisedButton(
                              shape: new RoundedRectangleBorder(
                                  borderRadius: new BorderRadius.circular(
                                      5.0)),
                              onPressed: () => _cancelClick(context),
                              child: new Text('Cancel', style: new TextStyle(
                                  fontSize: MyStyle.medium_fontSize,
                                  color: MyStyle.colorBlack)),
                              color: MyStyle.layoutBackground)
                      ),


                      new RaisedButton(
                          shape: new RoundedRectangleBorder(
                              borderRadius: new BorderRadius.circular(
                                  5.0)),
                          onPressed: () => _updateClick(context, 'Hello12345'),
                          child: new Text('Update', style: new TextStyle(
                              fontSize: MyStyle.medium_fontSize,
                              color: MyStyle.colorWhite)),
                          color: MyStyle.colorAccent)
                    ],
                  )
              )
            ],
          ),
        ),
      ),
    );
  }
}