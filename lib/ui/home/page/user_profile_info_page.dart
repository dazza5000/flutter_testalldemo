import 'package:flutter/material.dart';
import 'package:lyc_clinic/base/mystyle.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_facebook_login/flutter_facebook_login.dart';
import 'package:lyc_clinic/ui/home/presenter/profile_info_presenter.dart';
import 'package:lyc_clinic/ui/home/contract/profile_info_contract.dart';
import 'package:lyc_clinic/utils/mySharedPreferences.dart';
import 'package:lyc_clinic/utils/configs.dart';
import 'package:lyc_clinic/ui/home/data/profile_info.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:lyc_clinic/ui/login/facebook_loginlogout.dart';

class UserProfileInfoPage extends StatefulWidget {
  @override
  UserProfileInfoPageState createState() {
    return new UserProfileInfoPageState();
  }
}

class UserProfileInfoPageState extends State<UserProfileInfoPage>
    implements ProfileInfoContract {
  final GlobalKey<FormState> _formKey = new GlobalKey<FormState>();
  List<String> data = ['Mandalay', 'Yangon', 'Monywa'];
  ProfileInfoPresenter mPresenter;
  MySharedPreferences mySharedPrefs = new MySharedPreferences();
  SharedPreferences prefs;
  String accessCode = Configs.TEST_CODE;
  ProfileInfo profileInfo;
  var facebookLogin = new FacebookLogin();
  TextEditingController _nameController = new TextEditingController();
  TextEditingController _phoneController = new TextEditingController();
  TextEditingController _ageController = new TextEditingController();

  UserProfileInfoPageState() {
    mPresenter = new ProfileInfoPresenter(this);
  }

  InputDecoration getDecoration(String hinttext) {
    return new InputDecoration(
        hintText: hinttext,
        helperText: hinttext,
        filled: true,
        fillColor: MyStyle.layoutBackground,
        contentPadding: const EdgeInsets.all(10.0),
        border: new OutlineInputBorder(
            borderRadius: new BorderRadius.circular(5.0),
            borderSide: new BorderSide(color: MyStyle.defaultGrey, width: 1.0),
            gapPadding: 0.5));
  }

  void _facebookLogout() {
    facebookLogin.logOut().then((_) => mySharedPrefs.clear());
  }

  onChangedData() {
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    //mySharedPrefs.getStringData(Configs.PREF_USER_ACCESSCODE).then(updatAccessCode);
    mPresenter.getProfileInfo(accessCode);
  }

  void updatAccessCode(String val) {
    setState(() {
      this.accessCode = val;
    });
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
                  child: new Text('User Name', style: MyStyle.titleTextStyle()),
                ),
                new TextField(
                    controller: _nameController,
                    decoration: getDecoration('Name')),
                new Padding(
                  padding: const EdgeInsets.symmetric(vertical: 5.0),
                  child:
                      new Text('Mobile Phone', style: MyStyle.titleTextStyle()),
                ),
                new TextField(
                  controller: _phoneController,
                  decoration: getDecoration('Phone'),
                ),
                new Padding(
                  padding: const EdgeInsets.symmetric(vertical: 5.0),
                  child: new Text('Age', style: MyStyle.titleTextStyle()),
                ),
                new InkWell(
                  child: new TextField(
                    controller: _ageController,
                    decoration: getDecoration('Age'),
                  ),
                  onTap: null,
                ),
                new Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5.0),
                  child: new Text('Gender', style: MyStyle.titleTextStyle()),
                ),
                new Container(
                  decoration: new BoxDecoration(
                      color: MyStyle.layoutBackground,
                      shape: BoxShape.rectangle,
                      boxShadow: [
                        new BoxShadow(color: Colors.grey, spreadRadius: 2.0),
                      ]),
                  child: new DropdownButton(
                      isDense: false,
                      hint: new Text('Gender'),
                      items: data.map((String value) {
                        return new DropdownMenuItem<String>(
                            value: value,
                            child: new Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 5.0),
                              child: new Text(value,
                                  style: MyStyle.titleTextStyle()),
                            ));
                      }).toList(),
                      onChanged: onChangedData()),
                ),
                new Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5.0),
                  child: new Text('Location', style: MyStyle.titleTextStyle()),
                ),
                new Container(
                  decoration: new BoxDecoration(
                      color: MyStyle.layoutBackground,
                      shape: BoxShape.rectangle,
                      boxShadow: [
                        new BoxShadow(color: Colors.grey, spreadRadius: 2.0),
                      ]),
                  child: new DropdownButton(
                      isDense: false,
                      hint: new Text('Location'),
                      items: data.map((String value) {
                        return new DropdownMenuItem<String>(
                            value: value,
                            child: new Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 5.0),
                              child: new Text(value,
                                  style: MyStyle.titleTextStyle()),
                            ));
                      }).toList(),
                      onChanged: onChangedData()),
                ),
                new FlatButton.icon(
                    onPressed: _facebookLogout,
                    icon: new Icon(
                      Icons.exit_to_app,
                      color: MyStyle.colorDarkGrey,
                    ),
                    label: new Text(
                      'LOG OUT',
                      style: new TextStyle(
                          fontSize: MyStyle.medium_fontSize,
                          color: MyStyle.colorDarkGrey),
                    ))
              ]),
        ),
      ),
    );
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
      _phoneController.text = profileInfo.phone;
      _nameController.text = profileInfo.name;
      _ageController.text = profileInfo.dob;
    });
    print("Profile Info Data$profileInfo");
  }
}
