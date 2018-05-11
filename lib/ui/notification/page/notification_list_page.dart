import 'package:flutter/material.dart';
import 'package:lyc_clinic/base/mystyle.dart';
import 'package:lyc_clinic/ui/notification/model/noti.dart';
import 'package:lyc_clinic/base/model/pagination.dart';
import 'package:lyc_clinic/ui/notification/model/data.dart';
import 'package:lyc_clinic/ui/notification/model/booking.dart';
import 'package:lyc_clinic/ui/notification/widget/booking_noti_widet.dart';
import 'package:lyc_clinic/ui/notification/widget/comment_noti_widget.dart';
import 'package:lyc_clinic/ui/notification/widget/review_noti_widget.dart';

class NotifiacationListPage extends StatefulWidget {


  Noti notilist = new Noti(new Pagination(1, 23, 1, 2),
      [
        new Data(95, null, null, new Booking(
            50,
            6,
            "ေဒါက္တာ ေအးသီတာအုုန္း",
            "",
            1,
            "Your booking with doctor (ေဒါက္တာ ေအးသီတာအုုန္း) has been change from Feb 27. 2018 • 03:30 PM to Feb 20, 2018 • 03:30 PM.",
            "Feb 20 (Tue) 12:00 PM",
            1519128000,
            1518607129,
            7410615), 'booking'),
        new Data(95, null, null, new Booking(
            50,
            6,
            "ေဒါက္တာ ေအးသီတာအုုန္း",
            "",
            1,
            "Your booking with doctor (ေဒါက္တာ ေအးသီတာအုုန္း) has been change from Feb 27. 2018 • 03:30 PM to Feb 20, 2018 • 03:30 PM.",
            "Feb 20 (Tue) 12:00 PM",
            1519128000,
            1518607129,
            7410615), 'commentreply'),
        new Data(95, null, null, new Booking(
            50,
            6,
            "ေဒါက္တာ ေအးသီတာအုုန္း",
            "",
            1,
            "Your booking with doctor (ေဒါက္တာ ေအးသီတာအုုန္း) has been change from Feb 27. 2018 • 03:30 PM to Feb 20, 2018 • 03:30 PM.",
            "Feb 20 (Tue) 12:00 PM",
            1519128000,
            1518607129,
            7410615), 'reviewreply')
      ]);

  @override
  NotificationListPageState createState() {
    return new NotificationListPageState();
  }
}

class NotificationListPageState extends State<NotifiacationListPage> {

  Widget _buildNotificationData(BuildContext context, int index) {
    var data = widget.notilist.data[index];
    if (data.type == 'booking') {
      return new BookingNotificationWidget(widget.notilist.data[index].booking);
    }
    else if (data.type == 'commentreply') {
      return new CommentNotiWidget(widget.notilist.data[index].booking);
    }
    else {
      return new ReviewNotiWidget(widget.notilist.data[index].booking);
    }
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        backgroundColor: MyStyle.colorWhite,
        leading: new IconButton(
            icon: new Icon(Icons.clear, color: MyStyle.colorBlack),
            onPressed: () => Navigator.pop(context)),
        title: new Text('Notifications',
          style: new TextStyle(color: MyStyle.colorBlack, fontSize: 14.0),),
      ),
      body: new Container(
        child: new Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            new ListView.builder(
              padding: const EdgeInsets.all(0.0),
              itemBuilder: _buildNotificationData,
              itemCount: widget.notilist.data.length,
              controller: new ScrollController(),
              scrollDirection: Axis.vertical,
              shrinkWrap: true,)
          ],
        ),
      ),
    );
  }
}