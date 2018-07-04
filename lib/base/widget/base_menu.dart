import 'package:flutter/material.dart';
import 'package:lyc_clinic/base/data/bottom_menu.dart';

class BaseMenu extends StatelessWidget {
  BaseMenu();
  List<BottomMenu> _bottomMenu = [
    new BottomMenu("Address", Icons.location_on),
    new BottomMenu("Phone", Icons.call),
    new BottomMenu("Chat", Icons.message),
  ];


  _selectedMenu(int index) {
    switch (index) {
      case 0:
        print("Address");
        break;
      case 1:
        print("Phone");
        break;
      case 2:
        print("Message");
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    var bottomMenu = [];
    for (var i = 0; i < _bottomMenu.length; i++) {
      var menu = _bottomMenu[i];
      bottomMenu.add(new ListTile(
        leading: new Icon(menu.icon),
        title: new Text(menu.title),
        onTap: (() => _selectedMenu(i)),
      ));
    }
    return new Row(
      children: bottomMenu,
    );
  }


}