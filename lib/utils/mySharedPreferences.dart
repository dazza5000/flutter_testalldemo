import 'dart:async';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:lyc_clinic/utils/configs.dart';

class MySharedPreferences {
  MySharedPreferences() {
    //_prefs = getSharePreferences();
  }

  getSharePreferences() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return preferences;
  }

  Future<bool> clear() async {
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    _prefs.clear();
    return _prefs.commit();
  }

  Future<bool> putStringData(String key, String val) async {
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    _prefs.setString(key, val);
    return _prefs.commit();
  }

  Future<bool> putIntegerData(String key, int val) async {
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    _prefs.setInt(key, val);
    return _prefs.commit();
  }

  Future<bool> putBooleanData(String key, bool val) async {
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    _prefs.setBool(key, val);
    return _prefs.commit();
  }

  Future<bool> putDoubleData(String key, double val) async {
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    _prefs.setDouble(key, val);
    return _prefs.commit();
  }

  Future<String> getStringData(String key) async {
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    return _prefs.getString(key);
  }

  Future<int> getIntData(String key) async {
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    return _prefs.getInt(key);
  }

  Future<bool> getBooleanData(String key) async {
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    return _prefs.getBool(key);
  }

  Future<double> getDoubleData(String key) async {
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    return _prefs.getDouble(key);
  }

  bool isLogin() {
    bool isLogin = false;
    getBooleanData(Configs.PREF_USER_LOGIN).then((val) {
      isLogin = val;
    });
    return isLogin;
  }
/* getData(String key) {
    return _prefs.get(key);
  }*/
}
