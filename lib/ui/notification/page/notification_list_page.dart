import 'package:flutter/material.dart';
import 'package:lyc_clinic/base/mystyle.dart';
import 'package:lyc_clinic/base/widget/base_widget.dart';
import 'package:lyc_clinic/base/data/pagination.dart';
import 'package:lyc_clinic/ui/notification/data/data.dart';
import 'package:lyc_clinic/ui/notification/widget/booking_noti_widet.dart';
import 'package:lyc_clinic/ui/notification/widget/comment_noti_widget.dart';
import 'package:lyc_clinic/ui/notification/widget/review_noti_widget.dart';
import 'package:lyc_clinic/ui/notification/presenter/notification_presenter.dart';
import 'package:lyc_clinic/ui/notification/contract/notification_contract.dart';
import 'package:lyc_clinic/utils/configs.dart';
import 'package:lyc_clinic/utils/mySharedPreferences.dart';

class NotificationListPage extends StatefulWidget {
  @override
  NotificationListPageState createState() {
    return new NotificationListPageState();
  }
}

class NotificationListPageState extends State<NotificationListPage>
    implements NotificationContract {
  NotificationPresenter mPresenter;
  List<Data> notificationList = new List<Data>();
  Pagination pagination;
  String accessCode;
  MySharedPreferences mySharedPreferences = new MySharedPreferences();
  ScrollController controller = new ScrollController();

  NotificationListPageState() {
    mPresenter = new NotificationPresenter(this);
  }

  @override
  void initState() {
    super.initState();
    getAccessCode();
    controller.addListener(() {
      if (controller.position.pixels == controller.position.maxScrollExtent) {
        print('Get More');
        if (pagination.currentPage < pagination.lastPage)
          mPresenter.getMoreNoti(accessCode, pagination.currentPage + 1);
      }
    });
  }

  getAccessCode() {
    mySharedPreferences
        .getStringData(Configs.PREF_USER_ACCESSCODE)
        .then((val) =>
        setState(() {
          accessCode = val;
          mPresenter.getNoti(accessCode);
        }));
  }

  Widget _buildNotificationData(BuildContext context, int index) {
    if (index == notificationList.length) {
      if (pagination.currentPage == pagination.lastPage) {
        return new Container(
          child: null,
        );
      } else {
        return new Container(
          padding: const EdgeInsets.symmetric(vertical: 5.0),
          child: new Center(
            child: BaseWidgets.loadingIndicator,
          ),
        );
      }
    }
    else {
      var data = notificationList[index];
      if (data.type == 'booking') {
        return new BookingNotificationWidget(notificationList[index].booking);
      } else if (data.type == 'commentreply') {
        return new CommentNotiWidget(notificationList[index].commentreply);
      } else {
        return new ReviewNotiWidget(notificationList[index].reviewreply);
      }
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
        body:new ListView.builder(
          padding: const EdgeInsets.only(left: 10.0, right: 10.0),
          itemBuilder: _buildNotificationData,
          itemCount: pagination != null
              ? notificationList.length + 1
              : notificationList.length,
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          controller: controller,
        )
    );
  }

  @override
  void setPagination(Pagination p) {
    pagination = p;
  }

  @override
  void showMoreNotifications(List<Data> n) {
    setState(() {
      notificationList.addAll(n);
    });
    print('show more noti${notificationList.length}');
  }

  @override
  void showNotifications(List<Data> n) {
    setState(() {
      notificationList.clear();
      notificationList = n;
    });
  }
}
