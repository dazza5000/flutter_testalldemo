import 'dart:async';
import 'package:shared_preferences/shared_preferences.dart';

class MySharedPreferences {
  Future<SharedPreferences> mySharedPreferences = SharedPreferences
      .getInstance();

  _clear() async {
    SharedPreferences _prefs = await mySharedPreferences;
    _prefs.clear();
  }

  _putStringData(String key, String val) async {
    SharedPreferences _prefs = await mySharedPreferences;
    _prefs.setString(key, val);
  }

  _putIntegerData(String key, int val) async {
    SharedPreferences _prefs = await mySharedPreferences;
    _prefs.setInt(key, val);
  }

  _putBooleanData(String key, bool val) async {
    SharedPreferences _prefs = await mySharedPreferences;
    _prefs.setBool(key, val);
  }

  _putDoubleData(String key, double val) async {
    SharedPreferences _prefs = await mySharedPreferences;
    _prefs.setDouble(key, val);
  }

  _getStringData(String key) async {
    SharedPreferences _prefs = await mySharedPreferences;
    _prefs.getString(key);
  }

  _getIntData(String key) async {
    SharedPreferences _prefs = await mySharedPreferences;
    _prefs.getInt(key);
  }

  _getBooleanData(String key) async {
    SharedPreferences _prefs = await mySharedPreferences;
    _prefs.getBool(key);
  }

  _getDoubleData(String key) async {
    SharedPreferences _prefs = await mySharedPreferences;
    _prefs.getDouble(key);
  }

  _getData(String key) async {
    SharedPreferences _prefs = await mySharedPreferences;
    _prefs.get(key);
  }
}