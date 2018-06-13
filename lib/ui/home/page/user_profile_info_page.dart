import 'package:flutter/material.dart';
import 'package:lyc_clinic/base/mystyle.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:lyc_clinic/ui/home/presenter/profile_info_presenter.dart';
import 'package:lyc_clinic/ui/home/contract/profile_info_contract.dart';
import 'package:lyc_clinic/utils/mySharedPreferences.dart';
import 'package:lyc_clinic/utils/configs.dart';
import 'package:lyc_clinic/ui/home/data/profile_info.dart';

class UserProfileInfoPage extends StatefulWidget {
  @override
  UserProfileInfoPageState createState() {
    return new UserProfileInfoPageState();
  }
}

class UserProfileInfoPageState extends State<UserProfileInfoPage> {
  final GlobalKey<FormState> _formKey = new GlobalKey<FormState>();
  List<String> data = ['Mandalay', 'Yangon', 'Monywa'];
  ProfileInfoPresenter mPresenter;
  String accessCode =
      MySharedPreferences.getStringData(Configs.PREF_USER_ACCESSCODE) != null
          ? MySharedPreferences.getStringData(Configs.PREF_USER_ACCESSCODE)
          : Configs.TEST_CODE;
  ProfileInfo profileInfo;

  UserProfileInfoPageState() {
    mPresenter = new ProfileInfoPresenter(this);
  }

  InputDecoration getDecoration(String hinttext) {
    return new InputDecoration(
        hintText: hinttext,
        filled: true,
        fillColor: MyStyle.layoutBackground,
        contentPadding: const EdgeInsets.all(10.0),
        border: new OutlineInputBorder(
            borderRadius: new BorderRadius.circular(5.0),
            borderSide: new BorderSide(color: MyStyle.defaultGrey, width: 1.0),
            gapPadding: 0.5));
  }

  onChangedData() {
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    mPresenter.getProfileInfo(accessCode);
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new Container(
        padding: new EdgeInsets.all(20.0),
        child: new Form(
          key: this._formKey,
          child: new ListView(
              shrinkWrap: true,
              controller: new ScrollController(),
              children: <Widget>[
                new Padding(
                  padding: const EdgeInsets.symmetric(vertical: 5.0),
                  child:
                      new Text('User Name', style: MyStyle.captionTextStyle()),
                ),
                new TextFormField(
                    initialValue: 'Nway Nway',
                    controller: new TextEditingController(),
                    decoration: getDecoration('Name')),
                new Padding(
                  padding: const EdgeInsets.symmetric(vertical: 5.0),
                  child: new Text('Mobile Phone',
                      style: MyStyle.captionTextStyle()),
                ),
                new TextField(
                  controller: new TextEditingController(),
                  decoration: getDecoration('Phone'),
                ),
                new Padding(
                  padding: const EdgeInsets.symmetric(vertical: 5.0),
                  child: new Text('Age', style: MyStyle.captionTextStyle()),
                ),
                new InkWell(
                  child: new TextField(
                    controller: new TextEditingController(),
                    decoration: getDecoration('Age'),
                  ),
                  onTap: null,
                ),
                new DropdownButton(
                    value: data.length,
                    items: data.map((String value) {
                      return new DropdownMenuItem(
                          value: value,
                          child: new Row(
                            children: <Widget>[new Text('Size: ${value}')],
                          ));
                    }).toList(),
                    onChanged: onChangedData()),
              ]),
        ),
      ),
    );

    /*return new Scaffold(
        backgroundColor: MyStyle.layoutBackground,
        body: new Stack(
          overflow: Overflow.clip,
          fit: StackFit.expand,
          children: <Widget>[
            new Container(
                margin: const EdgeInsets.symmetric(
                    horizontal: 10.0, vertical: 15.0),
                color: MyStyle.colorWhite,
                child: new ListView(
                  shrinkWrap: true,
                  children: <Widget>[
                    new Padding(
                      padding: const EdgeInsets.symmetric(vertical: 5.0),
                      child: new Text('User Name',
                          style: MyStyle.captionTextStyle()),
                    ),
                    new TextField(
                        enabled: true,
                        obscureText: true,
                        controller: new TextEditingController(),
                        //initialValue: 'Hnin Nway Nway Hlaing',
                        decoration: getDecoration('Name')),
                    new Padding(
                      padding: const EdgeInsets.symmetric(vertical: 5.0),
                      child: new Text('Mobile Phone',
                          style: MyStyle.captionTextStyle()),
                    ),
                    new TextField(
                      enabled: true,
                      obscureText: true,
                      controller: new TextEditingController(),
                      //initialValue: '09400404010',
                      decoration: getDecoration('Phone'),
                    ),
                    new Padding(
                      padding: const EdgeInsets.symmetric(vertical: 5.0),
                      child: new Text('Age', style: MyStyle.captionTextStyle()),
                    ),
                    new TextField(
                        enabled: true,
                        obscureText: true,
                        controller: new TextEditingController(),
                        //initialValue: '24',
                        decoration: getDecoration('Age')),
                    new Padding(
                      padding: const EdgeInsets.symmetric(vertical: 5.0),
                      child: new Text('Age', style: MyStyle.captionTextStyle()),
                    ),
                  ],
                ))
          ],
        ));*/
  }

  @override
  void showLandingPage() {}

  @override
  void displayPhone(String phone) {}

  @override
  void displayLocation(String location) {}

  @override
  void displayAge(String age) {}

  @override
  void displayGender(int gender) {}

  @override
  void displayImage(String image) {}

  @override
  void displayName(String name) {}

  @override
  void displayProfileLayout(ProfileInfo profileInfo) {
    setState(() {
      this.profileInfo = profileInfo;
    });
  }
}
