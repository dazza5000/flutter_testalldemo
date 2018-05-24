import 'package:flutter/material.dart';
import 'dart:async';
import 'package:lyc_clinic/ui/home/page/home_page.dart';
import 'package:lyc_clinic/ui/doctors/page/doctor_list_page.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:lyc_clinic/ui/home/page/health_education_page.dart';
import 'package:lyc_clinic/test/custom_bottom_navigation_bar.dart';

class HomeContainerFragment extends StatefulWidget {


  @override
  _HomeContainerFragmentState createState() =>
      new _HomeContainerFragmentState();
}

class _HomeContainerFragmentState extends State<HomeContainerFragment> with SingleTickerProviderStateMixin {
  static const String PREF_KEY_TAB_INDEX = "pref_key_tab_index";
  TabController controller;

  HomeContainerFragment() {
    controller?.dispose();
    controller = new TabController(length: 2, vsync: this, initialIndex: 0);
  }

  @override
  void initState() {
    super.initState();
    controller = new TabController(length: 2, vsync: this, initialIndex: 0);
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  _saveTabIndex() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    print("saveTabIndex: ${controller?.index}");
    prefs.setInt(PREF_KEY_TAB_INDEX, controller?.index);
  }

  Future<int> _restoreTabIndex() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    int tabIndex = prefs.getInt(PREF_KEY_TAB_INDEX);
    return tabIndex != null ? tabIndex : controller?.index;
  }


  @override
  Widget build(BuildContext context) {
    if (controller == null) {
      controller = new TabController(length: 2, vsync: this);
    }

    return new Scaffold(
        appBar: new PreferredSize(

          preferredSize: new Size.fromHeight(kTextTabBarHeight),
          child: new Material(
            color: Colors.white,
            elevation: 4.0,
            child: new TabBar(
              controller: controller,
              isScrollable: true,
              labelStyle: new TextStyle(
                  fontWeight: FontWeight.bold, fontSize: 16.0),
              tabs: <Tab>[
                new Tab(text: 'Home'),
                new Tab(text: 'Health & Education')
              ],
              labelColor: Colors.orange,
              unselectedLabelColor: Colors.grey,
              indicatorColor: Colors.orange,

            ),
          ),
        ),
        body: new TabBarView(
          children: <Widget>[
            new HomePage(),
            new HealthEducationFragment()
          ],
          controller: controller,

        ),
      bottomNavigationBar:new CustomBottomNavigationBar() ,
    );

    /*return new DefaultTabController(
      length: 2,
      child: new Scaffold(
        primary: false,
        body: new NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return <Widget>[
              new SliverAppBar(
                primary: false,
                forceElevated: innerBoxIsScrolled,
                pinned: true,
                floating: true,
                snap: true,
                bottom: new TabBar(
                  tabs: <Tab>[
                    new Tab(text: 'green'),
                    new Tab(text: 'purple'),
                  ],
                ),
              ),
            ];
          },
          body: new TabBarView(
            children: <Widget>[
              new Center(
                child: new Container(
                  height: 1000.0,
                  color: Colors.green.shade200,
                  child: new Center(
                    child: new FlutterLogo(colors: Colors.green),
                  ),
                ),
              ),
              new Center(
                child: new Container(
                  height: 1000.0,
                  color: Colors.purple.shade200,
                  child: new Center(
                    child: new FlutterLogo(colors: Colors.purple),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );*/
  }
}

