import 'package:flutter/material.dart';
import 'package:lyc_clinic/base/mystyle.dart';

class ServiceListPage extends StatelessWidget {

  Widget _buildServicesList(BuildContext context, int index) {
    return new Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5.0, vertical: 8.0),
      child: new Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          new Divider(color: MyStyle.defaultGrey, height: 1.0,),
          new Padding(padding: const EdgeInsets.symmetric(vertical: 10.0),
              child: new Text('Sub Title')),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          backgroundColor: MyStyle.colorWhite,
          title: new Text('Service Title', style: MyStyle.appbarTitleStyle()),
          leading: new IconButton(
              icon: new Icon(Icons.clear, color: MyStyle.colorBlack),
              onPressed: () => Navigator.pop(context)),
        ),
        body: new Container(
            child: new Padding(
                padding: const EdgeInsets.all(10.0),
                child: new Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    new Text('Services',
                      style: new TextStyle(fontSize: MyStyle.large_fontSize),),
                    new ListView.builder(
                      itemBuilder: _buildServicesList,
                      itemCount: 2,
                      shrinkWrap: true,
                      controller: new ScrollController(),
                      scrollDirection: Axis.vertical,)
                  ],
                )
            )
        )
    );
  }
}