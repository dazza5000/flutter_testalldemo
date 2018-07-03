import 'package:flutter/material.dart';
import 'package:lyc_clinic/base/mystyle.dart';
import 'package:lyc_clinic/ui/home/page/user_activity_list_page.dart';
import 'package:lyc_clinic/ui/home/page/user_booking_list_page.dart';
import 'package:lyc_clinic/ui/home/page/user_saved_list_page.dart';
import 'package:lyc_clinic/ui/home/page/user_profile_info_page.dart';

class ProfileDataPage extends StatefulWidget {
  final int tabIndex;

  const ProfileDataPage({Key key, this.tabIndex}) : super(key: key);


  @override
  ProfileDataPageState createState() {
    return new ProfileDataPageState();
  }
}

class ProfileDataPageState extends State<ProfileDataPage>
    with SingleTickerProviderStateMixin {
  TabController controller;

  ProfileDataPage() {
    //controller?.dispose();
    //controller = new TabController(
    //  length: 4, initialIndex: widget.tabIndex);
    //new TabController(
    //  length: 4, vsync: this, initialIndex: widget.tabIndex);
  }


  @override
  void reassemble() {

  }


  @override
  void setState(VoidCallback fn) {

  }

  @override
  void deactivate() {

  }

  @override
  void initState() {
    super.initState();
    controller = new TabController(
        vsync: this, length: 4, initialIndex: widget.tabIndex);
    controller.addListener(_handleTabSelection);
  }

  void _handleTabSelection() {
    setState(() {
      //_selectedTab = MyWidgetTabs.values[_tabController.index];
      print("Changed tab to: ${widget.tabIndex
              .toString()
              .split('.')
              .last} , index: ${controller.index}");
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  void didChangeDependencies() {
    if (controller.index != widget.tabIndex) {
      setState(() {
        controller =
            new TabController(length: 4, initialIndex: widget.tabIndex,vsync: this);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      resizeToAvoidBottomPadding: false,
      backgroundColor: MyStyle.layoutBackground,
      appBar: new PreferredSize(
        preferredSize: new Size.fromHeight(kTextTabBarHeight),
        child: new Material(
          color: Colors.white,
          elevation: 4.0,
          child: new TabBar(
            controller: controller,
            isScrollable: true,
            labelStyle: new TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: MyStyle.xmedium_fontSize),
            tabs: <Tab>[
              new Tab(text: 'ACTIVITIES'),
              new Tab(text: 'SAVED'),
              new Tab(text: 'BOOKING'),
              new Tab(text: 'PROFILE INFO'),
            ],
            labelColor: Colors.orange,
            unselectedLabelColor: Colors.grey,
            indicatorColor: Colors.orange,
          ),
        ),
      ),
      body: new TabBarView(children: <Widget>[
        new UserActivityListPage(),
        new UserSavedListPage(),
        new UserBookingListPage(),
        new UserProfileInfoPage(context)
      ], controller: controller),
    );
  }
}
