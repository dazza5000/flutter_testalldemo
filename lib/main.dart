import 'package:flutter/material.dart';
import 'package:lyc_clinic/test/home_page.dart';
import 'test/theme.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  AppLifecycleState _state;

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'LYC Clinic Flutter Demo',
      color: Colors.white,
      theme: themeData,
      home: new MainPage(),
      debugShowCheckedModeBanner: false,
    );
  }

}
