import 'package:flutter/material.dart';
import  'package:share/share.dart';
import 'package:lyc_clinic/base/mystyle.dart';
import 'package:lyc_clinic/base/widget/base_widget.dart';
import 'package:lyc_clinic/utils/configs.dart';
import 'package:lyc_clinic/ui/doctors/data/doctor.dart';
import 'package:lyc_clinic/utils/mySharedPreferences.dart';

class CreateDoctorButton extends StatefulWidget {
  Doctor doctor;
  DoctorClickListener listener;

  CreateDoctorButton(this.doctor,this.listener);

  @override
  _CreateButtonState createState() {
    return new _CreateButtonState();
  }
}

class _CreateButtonState extends State<CreateDoctorButton> {
  bool _isFavourite = false;
  bool _isBookMark = false;
  int _favCount = 0;
  DoctorClickListener doctorClickListener;
  bool isLogin=false;
  MySharedPreferences mySharedPreferences=new MySharedPreferences();

  @override
  void initState() {
    _favCount = widget.doctor.favCount;
    _isFavourite = widget.doctor.fav;
    _isBookMark = widget.doctor.save;
    doctorClickListener=widget.listener;

    mySharedPreferences
        .getBooleanData(Configs.PREF_USER_LOGIN)
        .then((val) => setState(() {
      isLogin = val!=null?val:false;
    }));
  }

  /*Widget _getFloatButton(IconData ic, Color bgColor, Color icColor) {
    return new Container(
      width: 40.0,
      height: 40.0,
      decoration:
          new BoxDecoration(shape: BoxShape.circle, color: bgColor, boxShadow: [
        new BoxShadow(
            color: Colors.grey, blurRadius: 4.0, offset: new Offset(1.0, 4.0)),
      ]),
      child: new Icon(
        ic,
        color: icColor,
      ),
    );
  }*/

  void _clickLikeButton() {
    if(isLogin) {
      setState(() {
        if (_isFavourite) {
          _isFavourite = false;
          _favCount -= 1;
        } else {
          _isFavourite = true;
          _favCount += 1;
        }
      });
      doctorClickListener.onDoctorFavClick(widget.doctor);
    }else{
      BaseWidgets.showLoginDialog(context);
    }
  }

  _clickShareButton() {
    setState(() {
      Share.share(widget.doctor.shareUrl);
    });
    doctorClickListener.onDoctorShareClick(widget.doctor);
  }

  _clickBookMarkButton() {
    if(isLogin) {
      setState(() {
        if (_isBookMark) {
          _isBookMark = false;
        } else {
          _isBookMark = true;
        }
      });
      doctorClickListener.onDoctorSaveClick(widget.doctor);
    }
    else{
      BaseWidgets.showLoginDialog(context);
    }
  }

  Widget _showActivityCount(String activityCount) {
    return new Text(
      activityCount,
      style: new TextStyle(
          fontSize: MyStyle.small_fontSize, color: MyStyle.colorGrey),
    );
  }

  @override
  Widget build(BuildContext context) {
    Color _favbgColor = _isFavourite ? Colors.orangeAccent : Colors.white;
    Color _favicColor = _isFavourite ? Colors.white : Colors.grey;
    IconData _favIcon = _isFavourite ? Icons.favorite : Icons.favorite_border;
    IconData _bookMarkIcon =
        _isBookMark ? Icons.bookmark : Icons.bookmark_border;
    Color _bookbgColor = _isBookMark ? Colors.orangeAccent : Colors.white;
    Color _bookicColor = _isBookMark ? Colors.white : Colors.grey;
    var favCount = _favCount > 0 ? "$_favCount" : " ";

    return new Container(
        //margin: new EdgeInsets.fromLTRB(20.0, 180.0, 10.0, 10.0),
        alignment: FractionalOffset.bottomCenter,
        child: new Row(
          children: <Widget>[
            new InkWell(
              child: new Padding(
                padding: const EdgeInsets.only(top: 10.0, left: 0.0, right: 5.0),
                child: BaseWidgets.getFloatButton(_favIcon, _favbgColor, _favicColor),
              ),
              onTap: _clickLikeButton,
            ),
            new Padding(
                padding:
                    const EdgeInsets.only(top: 10.0, bottom: 10.0, right: 15.0),
                child: _showActivityCount(favCount)),
            new InkWell(
              child: new Padding(
                padding: const EdgeInsets.only(top: 10.0, left: 0.0, right: 0.0),
                child: BaseWidgets.getFloatButton(Icons.share, Colors.white, Colors.grey),
              ),
              onTap: _clickShareButton,
            ),
            new Expanded(
                child: new Row(
              children: <Widget>[],
            )),
            new InkWell(
              child: new Padding(
                padding: const EdgeInsets.only(top: 10.0, left: 0.0, right: 0.0),
                child:
                    BaseWidgets.getFloatButton(_bookMarkIcon, _bookbgColor, _bookicColor),
              ),
              onTap: _clickBookMarkButton,
            ),
          ],
        ));
  }
}

abstract class DoctorClickListener {
  void onDoctorItemClick(Doctor doctor);

  void onDoctorSaveClick(Doctor doctor);

  void onDoctorFavClick(Doctor doctor);

  void onDoctorShareClick(Doctor doctor);
}
