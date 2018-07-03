import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:io';
import 'package:intl/intl.dart';
import 'package:path_provider/path_provider.dart';
import 'package:image/image.dart' as Im;
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_facebook_login/flutter_facebook_login.dart';
import 'package:image_picker/image_picker.dart';
import 'package:lyc_clinic/main.dart';
import 'package:lyc_clinic/base/mystyle.dart';
import 'package:lyc_clinic/ui/utils/time_utils.dart';
import 'package:lyc_clinic/utils/mySharedPreferences.dart';
import 'package:lyc_clinic/utils/configs.dart';
import 'package:lyc_clinic/ui/home/presenter/profile_info_presenter.dart';
import 'package:lyc_clinic/ui/home/contract/profile_info_contract.dart';
import 'package:lyc_clinic/ui/home/page/location_list_page.dart';
import 'package:lyc_clinic/ui/home/data/profile_info.dart';
import 'package:lyc_clinic/ui/home/data/sublocation.dart';

class UserProfileInfoPage extends StatefulWidget {
  BuildContext context;

  UserProfileInfoPage(this.context);

  @override
  UserProfileInfoPageState createState() {
    return new UserProfileInfoPageState();
  }
}

class UserProfileInfoPageState extends State<UserProfileInfoPage>
    implements ProfileInfoContract, LocationChangedListener {
  final GlobalKey<FormState> _formKey = new GlobalKey<FormState>();
  List<String> genderData = ['None', 'Male', 'Female'];
  String accessCode;
  File _image;
  ProfileInfo profileInfo = new ProfileInfo();
  String genderSelected;
  String dob = "";
  String location = "";
  DateTime currentDate = new DateTime.now();
  var facebookLogin = new FacebookLogin();
  ProfileInfoPresenter mPresenter;
  MySharedPreferences mySharedPreferences = new MySharedPreferences();

  TextEditingController _nameController = new TextEditingController();
  TextEditingController _phoneController = new TextEditingController();
  TextEditingController _ageController = new TextEditingController();

  UserProfileInfoPageState() {
    mPresenter = new ProfileInfoPresenter(this);
  }

  @override
  void initState() {
    super.initState();
    _getAccessCode();
  }

  _getAccessCode() {
    mySharedPreferences
        .getStringData(Configs.PREF_USER_ACCESSCODE)
        .then((val) => setState(() {
              accessCode = val;
              print(accessCode);
              mPresenter.getProfileInfo(accessCode);
            }));
  }

  InputDecoration getDecoration(String hinttext) {
    return new InputDecoration(
        hintText: hinttext,
        filled: true,
        fillColor: MyStyle.layoutBackground,
        contentPadding: const EdgeInsets.all(10.0),
        border: InputBorder.none);
  }

  void _facebookLogout() {
    facebookLogin.logOut().then((_) {
      mySharedPreferences.clear().then((value) => runApp(new MyApp()));
    });
  }

  onChangedData(String val) {
    int index = genderData.indexOf(val);
    profileInfo.gender = index;
    mPresenter.updateProfileInfo(accessCode, profileInfo);
  }

  void getImage(int index) async {
    var image;
    if (index == 0) {
      image = await ImagePicker.pickImage(source: ImageSource.camera);
    } else {
      image = await ImagePicker.pickImage(source: ImageSource.gallery);
    }
    Navigator.pop(context);
    setState(() {
      _image = image;
      print(Uri.file(_image.path).toFilePath());
      compressImage();

      //profileInfo.image = Uri.file(pack+_image.path).toFilePath();
    });
  }

  void compressImage() async {
    var timeStamp = DateFormat("yyyyMMdd_HHmmss").format(new DateTime.now());
    var imageFileName = "JPEG_" + timeStamp + "_";
    final tempDir = await getTemporaryDirectory();
    final path = tempDir.path;
    Im.Image image = Im.decodeImage(_image.readAsBytesSync());

    var newImage = new File(path + "/" + imageFileName + ".jpg")
      ..writeAsBytesSync(Im.encodeJpg(image));

    setState(() {
      _image = newImage;
      print("new Image$_image"
          "");
      mPresenter.uploadProfileImage(accessCode, _image.path);
    });
  }

  File createImageFile() {
    Directory storageDir;
    var timeStamp = DateFormat("yyyyMMdd_HHmmss").format(new DateTime.now());
    var imageFileName = "JPEG_" + timeStamp + "_";
    getApplicationDocumentsDirectory().then((d) {
      storageDir = d;
      var storageDirPath = storageDir.path;
      var image = new File(storageDirPath + "/" + imageFileName + ".jpg");
      var mCurrentPhotoPath = image.path;
      return image;
    });
  }

  void _clickCamera() async {
    await showDialog(
        context: this.context,
        builder: (BuildContext context) {
          return new SimpleDialog(
            title: new Text(
              "Source",
              style: MyStyle.headerStyle(),
            ),
            children: <Widget>[
              new Padding(
                padding: const EdgeInsets.only(left: 20.0, top: 20.0),
                child: new GestureDetector(
                  child: new Text(
                    "Camera",
                    style: MyStyle.captionTextStyle(),
                    textAlign: TextAlign.start,
                  ),
                  onTap: () => getImage(0),
                ),
              ),
              new Padding(
                padding: const EdgeInsets.only(left: 20.0, top: 20.0),
                child: new GestureDetector(
                  child: new Text(
                    "Gallery",
                    style: MyStyle.captionTextStyle(),
                    textAlign: TextAlign.left,
                  ),
                  onTap: () => getImage(1),
                ),
              )
            ],
          );
        });
    setState(() {});
  }

  void _clickLocationDropDown() {
    Navigator.push(context,
        new MaterialPageRoute(builder: (_) => new LocationListPage(this)));
  }

  Future<Null> _selectedDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
      context: context,
      initialDate: currentDate,
      firstDate: new DateTime(1900),
      lastDate: new DateTime(2019),
    );

    if (picked != null) {
      print('Picked Date$picked');
      setState(() {
        dob = TimeUtils.getYearMonthDay(picked);
        profileInfo.dob = dob;
        mPresenter.updateProfileInfo(accessCode, profileInfo);
      });
    }
  }

  void submittedName(String name) {
    setState(() {
      //_nameController.text=name;
    });
    profileInfo.name = _nameController.text;
    mPresenter.updateProfileInfo(accessCode, profileInfo);
  }

  void submittedPhone(String phone) {
    setState(() {
      //_phoneController.text=phone;
    });
    profileInfo.phone = _phoneController.text;
    mPresenter.updateProfileInfo(accessCode, profileInfo);
  }

  Widget getGenderDropDownButton() {
    return new Container(
      padding: const EdgeInsets.only(left: 10.0, right: 20.0),
      decoration: new BoxDecoration(color: MyStyle.layoutBackground),
      child: new DropdownButtonHideUnderline(
        child: new DropdownButton(
            isDense: false,
            hint: new Text("Gender"),
            items: genderData.map((String value) {
              return new DropdownMenuItem<String>(
                  value: value,
                  child: new Padding(
                    padding: const EdgeInsets.only(left: 10.0),
                    child: new Text(value, style: MyStyle.titleTextStyle()),
                  ));
            }).toList(),
            value: genderSelected,
            onChanged: (String val) => onChangedData(val)),
      ),
    );
  }

  Widget getLocationDropDownButton() {
    return new Container(
        height: 45.0,
        padding: const EdgeInsets.only(left: 10.0, right: 10.0),
        decoration: new BoxDecoration(color: MyStyle.layoutBackground),
        child: new Stack(
          children: <Widget>[
            new Align(
              alignment: FractionalOffset.centerLeft,
              child: new Text(
                location,
                textAlign: TextAlign.left,
              ),
            ),
            new Align(
              child: new IconButton(
                  icon: new Icon(
                    Icons.arrow_drop_down,
                    color: MyStyle.colorDarkGrey,
                  ),
                  onPressed: _clickLocationDropDown),
              alignment: FractionalOffset.centerRight,
            )
          ],
        ));
  }

  Widget getProfileImage() {
    if (profileInfo != null && profileInfo.image != null) {
      return new Stack(
        children: <Widget>[
          new GestureDetector(
            child: new CircleAvatar(
              backgroundImage: new NetworkImage(profileInfo.image),
              radius: 40.0,
            ),
          ),
          new Positioned(
            child: new Container(
              height: 35.0,
              padding: const EdgeInsets.all(2.0),
              child: new Container(
                width: 25.0,
                decoration: new BoxDecoration(
                  shape: BoxShape.circle,
                  color: MyStyle.colorGreen,
                ),
                child: new IconButton(
                  padding: const EdgeInsets.all(0.0),
                  icon: new Icon(Icons.camera_alt, size: 15.0),
                  onPressed: _clickCamera,
                ),
              ),
              decoration: new BoxDecoration(
                  color: MyStyle.colorWhite, shape: BoxShape.circle),
            ),
            bottom: 0.0,
            right: 0.0,
          )
        ],
      );
    } else {
      return new Container(
        child: null,
      );
      ;
    }
  }

  @override
  Widget build(BuildContext context) {
    return new SingleChildScrollView(
      child: new Container(
          color: MyStyle.layoutBackground,
          child: new Stack(
            children: <Widget>[
              new Container(
                color: MyStyle.colorWhite,
                margin: const EdgeInsets.only(
                    left: 10.0, right: 10.0, top: 60.0, bottom: 30.0),
                padding:
                    const EdgeInsets.only(left: 10.0, right: 10.0, top: 60.0),
                child: new ListView(
                    shrinkWrap: true,
                    controller: new ScrollController(),
                    children: <Widget>[
                      new Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10.0),
                        child: new Text('User Name',
                            style: MyStyle.titleTextStyle()),
                      ),
                      new TextField(
                          onSubmitted: submittedName,
                          controller: _nameController,
                          decoration: getDecoration('Name')),
                      new Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10.0),
                        child: new Text('Mobile Phone',
                            style: MyStyle.titleTextStyle()),
                      ),
                      new TextField(
                        onSubmitted: submittedPhone,
                        controller: _phoneController,
                        decoration: getDecoration('Phone'),
                      ),
                      new Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10.0),
                        child: new Text('Age', style: MyStyle.titleTextStyle()),
                      ),
                      new InkWell(
                        child: new Container(
                            height: 45.0,
                            padding:
                                const EdgeInsets.only(left: 10.0, right: 10.0),
                            decoration: new BoxDecoration(
                                color: MyStyle.layoutBackground),
                            child: new Align(
                                alignment: FractionalOffset.centerLeft,
                                child: new Text(dob))),
                        onTap: () => _selectedDate(context),
                      ),
                      new Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10.0),
                        child:
                            new Text('Gender', style: MyStyle.titleTextStyle()),
                      ),
                      getGenderDropDownButton(),
                      new Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10.0),
                        child: new Text('Location',
                            style: MyStyle.titleTextStyle()),
                      ),
                      getLocationDropDownButton(),
                      new Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10.0),
                          child: new FlatButton.icon(
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
                              )))
                    ]),
              ),
              new Positioned(
                child: getProfileImage(),
                top: 15.0,
                left: 20.0,
              ),
            ],
          )),
      controller: new ScrollController(),
      scrollDirection: Axis.vertical,
    );
  }

  @override
  void showLandingPage() {}

  @override
  void displayPhone(String phone) {
    setState(() {
      _phoneController.text = profileInfo.phone;
    });
  }

  @override
  void displayLocation(String location) {
    setState(() {
      this.location = location;
    });
  }

  @override
  void displayAge(String age) {
    setState(() {
      dob = age;
    });
  }

  @override
  void displayGender(int gender) {
    setState(() {
      profileInfo.gender = gender;
      genderSelected = genderData[gender];
    });
  }

  @override
  void displayImage(String image) {
    setState(() {
      profileInfo.image = image;
    });
  }

  @override
  void displayName(String name) {
    _nameController.text = profileInfo.name;
  }

  @override
  void displayProfileLayout(ProfileInfo profileInfo) {
    setState(() {
      this.profileInfo = profileInfo;
      _phoneController.text = profileInfo.phone;
      _nameController.text = profileInfo.name;
    });
    print("Profile Info Data$profileInfo");
  }

  @override
  void onLocationChanged(SubLocation subLocation) {
    print('Location Changed>>$subLocation');
    profileInfo.locationId = subLocation.location;
    profileInfo.subLocation = subLocation.name;
    profileInfo.subLocationId = subLocation.id;
    mPresenter.updateProfileInfo(accessCode, profileInfo);
  }
}
