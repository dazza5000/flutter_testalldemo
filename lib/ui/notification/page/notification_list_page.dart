import 'package:flutter/material.dart';
import 'package:lyc_clinic/base/mystyle.dart';
import 'package:lyc_clinic/ui/notification/data/noti.dart';
import 'package:lyc_clinic/base/data/pagination.dart';
import 'package:lyc_clinic/ui/notification/data/data.dart';
import 'package:lyc_clinic/ui/notification/data/booking.dart';
import 'package:lyc_clinic/ui/notification/widget/booking_noti_widet.dart';
import 'package:lyc_clinic/ui/notification/widget/comment_noti_widget.dart';
import 'package:lyc_clinic/ui/notification/widget/review_noti_widget.dart';
import 'package:lyc_clinic/ui/notification/presenter/notification_presenter.dart';
import 'package:lyc_clinic/ui/notification/contract/notification_contract.dart';
import 'package:lyc_clinic/utils/configs.dart';

class NotifiacationListPage extends StatefulWidget {

  @override
  NotificationListPageState createState() {
    return new NotificationListPageState();
  }
}

class NotificationListPageState extends State<NotifiacationListPage>
    implements NotificationContract {
  NotificationPresenter mPresenter;
  List<Data> notiDataList = new List<Data>();

  NotificationListPageState() {
    mPresenter = new NotificationPresenter(this);
  }

  @override
  void initState() {
    super.initState();
    mPresenter.getNoti(Configs.TEST_CODE);
  }

  Widget _buildNotificationData(BuildContext context, int index) {
    var data = notiDataList[index];
    if (data.type == 'booking') {
      return new BookingNotificationWidget(notiDataList[index].booking);
    } else if (data.type == 'commentreply') {
      return new CommentNotiWidget(notiDataList[index].commentreply);
    } else {
      return new ReviewNotiWidget(notiDataList[index].reviewreply);
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
        title: new Text(
          'Notifications',
          style: new TextStyle(color: MyStyle.colorBlack, fontSize: 14.0),
        ),
      ),
      body: new SingleChildScrollView(
        controller: new ScrollController(),
        scrollDirection: Axis.vertical,
        child: new Container(
          child: new Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                new ListView.builder(
                  padding: const EdgeInsets.only(left: 10.0,right: 10.0),
                  itemBuilder: _buildNotificationData,
                  itemCount: notiDataList.length,
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  controller: new ScrollController(),
                )
              ]),
        ),
      ),
    );
  }

  @override
  void pagination(Pagination p) {
    setState(() {});
  }

  @override
  void showMoreNotifications(List<Data> n) {
    setState(() {
      notiDataList.addAll(n);
    });
  }

  @override
  void showNotifications(List<Data> n) {
    setState(() {
      notiDataList.clear();
      notiDataList = n;
    });
  }
}
