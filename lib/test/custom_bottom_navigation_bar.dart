import 'package:flutter/material.dart';
import 'package:lyc_clinic/ui/chat/page/chat_list_page.dart';

class CustomBottomNavigationBar extends StatelessWidget {

  _addressClick(BuildContext context) {

  }

  _phoneClick(BuildContext context) {

  }

  _chatClick(BuildContext context) {
    Navigator.push(
        context, new MaterialPageRoute(builder: (_) => new ChatListPage()));
  }

  _clickButton(int id, BuildContext context) {
    switch (id) {
      case 0:
        _addressClick(context);
        break;
      case 1:
        _phoneClick(context);
        break;
      case 2:
        _chatClick(context);
        break;
    }
  }

  Widget buildButtonColumn(BuildContext context, IconData icon, String label,
      Color color, int id) {
    return new InkWell(
      highlightColor: Colors.red,
      child: new Row(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          new Icon(icon, color: color),
          new Text(
            label,
            style: new TextStyle(
              fontSize: 12.0,
              fontWeight: FontWeight.w400,
              color: color,
            ),
          ),
        ],
      ),
      onTap: () => _clickButton(id, context),

    );
  }

  @override
  Widget build(BuildContext context) {
    return new Container(
      height: 50.0,
      decoration: new BoxDecoration(
          color: Colors.white,
          shape: BoxShape.rectangle,
          boxShadow: [new BoxShadow(
              color: Colors.black,
              blurRadius: 15.0,
              offset: new Offset(1.0, 4.0)
          ),
          ]),
      child: new Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          buildButtonColumn(
              context, Icons.location_on, 'Address', Colors.grey, 0),
          buildButtonColumn(context, Icons.phone, 'Phone', Colors.grey, 1),
          buildButtonColumn(context, Icons.message, 'Chat', Colors.grey, 2),
        ],
      ),
    );
  }
}