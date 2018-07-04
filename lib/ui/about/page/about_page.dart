import 'package:flutter/material.dart';
import 'package:html2md/html2md.dart' as html2md;
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:share/share.dart';
import 'package:lyc_clinic/base/mystyle.dart';
import 'package:lyc_clinic/utils/configs.dart';
import 'package:lyc_clinic/utils/mySharedPreferences.dart';
import 'package:lyc_clinic/ui/about/data/about.dart';
import 'package:lyc_clinic/ui/about/presenter/about_presenter.dart';
import 'package:lyc_clinic/ui/about/contract/about_contract.dart';
import 'package:lyc_clinic/base/widget/custom_bottom_navigation_bar.dart';


class AboutPage extends StatefulWidget {
  @override
  AboutPageState createState() {
    // TODO: implement createState
    return new AboutPageState();
  }
}

class AboutPageState extends State<AboutPage> implements AboutContract {
  AboutPresenter mPresenter;
  About about;
  bool isLoading = true;
  bool isLogin = false;
  bool isGuest = true;
  String accessCode;
  MySharedPreferences mySharedPreferences = new MySharedPreferences();

  AboutPageState() {
    mPresenter = new AboutPresenter(this);
    mySharedPreferences
        .getBooleanData(Configs.PREF_USER_LOGIN)
        .then((val) => setState(() {
              isLogin = val != null ? val : false;
            }));
  }

  _clickBack(BuildContext context) {
    Navigator.pop(context);
  }



  _clickNextDirection(BuildContext context) {}

  @override
  void initState() {
    super.initState();
    if (isLogin) {
      isGuest = false;
      mySharedPreferences
          .getStringData(Configs.PREF_USER_ACCESSCODE)
          .then((val) => setState(() {
                accessCode = val;
              }));
    } else {
      isGuest = true;
      accessCode = Configs.GUEST_CODE;
    }
    mPresenter.getContent(accessCode);
  }

  Widget _buildAppBar(BuildContext context) {
    return new Stack(
      children: <Widget>[
        new Positioned(
          left: 0.0,
          top: 10.0,
          child: new IconButton(
            icon: new Icon(
              Icons.arrow_back,
              color: MyStyle.colorWhite,
            ),
            iconSize: 30.0,
            onPressed: () => _clickBack(context),
          ),
        ),

      ],
    );
  }

  showLoadOrData() {
    if (isLoading) {
      return new Container(
        child:new Center(
          child: new CircularProgressIndicator(
            strokeWidth: 2.0,
          ),
        )
      );
    } else {
      return new MarkdownBody(data: html2md.convert(about.content));
    }
  }

  Widget _buildBody(BuildContext context) {
    return new Scaffold(
      body: new SingleChildScrollView(
          controller: new ScrollController(),
          scrollDirection: Axis.vertical,
          child: new Padding(
            padding: const EdgeInsets.only(
                top: 0.0, bottom: 5.0, left: 5.0, right: 5.0),
            child: new Container(
              child: new Center(child: showLoadOrData()),
            ),
          )),
      bottomNavigationBar: new CustomBottomNavigationBar(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        body: new Container(
      padding: const EdgeInsets.only(top: 25.0),
      child: new Stack(
        children: <Widget>[
          _buildBody(context),
          new Positioned(
            child: _buildAppBar(context),
          ),
        ],
      ),
    ));
  }

  @override
  void showContent(About about) {
    setState(() {
      this.about = about;
      isLoading = false;
    });
  }
}
