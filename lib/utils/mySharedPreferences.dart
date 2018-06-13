import 'dart:async';
import 'package:shared_preferences/shared_preferences.dart';

class MySharedPreferences {
  static SharedPreferences _prefs;

  MySharedPreferences() {
    _prefs = getSharePreferences();
  }

  static getSharePreferences() async {
    return await SharedPreferences.getInstance();
  }

  static Future<SharedPreferences> getPrefs() {
    return getSharePreferences();
  }

  static clear() {
    _prefs.clear();
  }

  static putStringData(String key, String val) {
    _prefs.setString(key, val);
  }

  static putIntegerData(String key, int val) {
    _prefs.setInt(key, val);
  }

  static putBooleanData(String key, bool val) {
    _prefs.setBool(key, val);
  }

  static putDoubleData(String key, double val) async {
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    _prefs.setDouble(key, val);
  }

  static String getStringData(String key) {
    return _prefs.getString(key);
  }

  static int getIntData(String key) {
    return _prefs.getInt(key);
  }

  static bool getBooleanData(String key) {
    return _prefs.getBool(key);
  }

  static double getDoubleData(String key) {
    return _prefs.getDouble(key);
  }

  static getData(String key) {
    return _prefs.get(key);
  }
}
