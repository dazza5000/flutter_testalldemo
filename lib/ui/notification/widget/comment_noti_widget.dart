import 'package:flutter/material.dart';
import 'package:lyc_clinic/base/mystyle.dart';
import 'package:lyc_clinic/ui/notification/data/booking.dart';

class CommentNotiWidget extends StatelessWidget {
  Booking booking;

  CommentNotiWidget(this.booking);

  @override
  Widget build(BuildContext context) {
    var networkImage = new NetworkImage(booking.image);
    var localImage = new AssetImage('assets/images/lyc.png');

    return new Container(
        margin: const EdgeInsets.symmetric(horizontal: 0.0, vertical: 10.0),
        child: new ListTile(
          leading: new CircleAvatar(
            backgroundColor: Colors.transparent,
            backgroundImage: booking.image == "" ? localImage : networkImage,
            radius: 20.0,),
          title: new Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              new Text('Lin Yaung  Chi replied to yourr comment posted in',
                style: MyStyle.listItemTextStyle(),),
              new Padding(padding: const EdgeInsets.only(top: 10.0),
                  child: new Text('Feb 14 2018',
                    style: MyStyle.dateTimeTextStyle(),))

            ],
          ),
        )
    );
  }
}