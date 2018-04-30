import 'package:flutter/material.dart';
import 'dart:math';

class FilterHealthEducation extends StatefulWidget {

  @override
  FilterHealthEducationState createState() {
    return new FilterHealthEducationState();
  }
}

class FilterHealthEducationState extends State<FilterHealthEducation> {

  _buildContentTypeButton(){
    return new Container(
      child: new Column(
        children: <Widget>[
          
        ],
      ),
    );
    /*return new Container(
      child: new Column(
        children: <Widget>[
          new RadioListTile<SingingCharacter>(
            title: const Text('Lafayette'),
            value: SingingCharacter.lafayette,
            groupValue: _character,
            onChanged: (SingingCharacter value) { setState(() { _character = value; }); },
          ),
          new RadioListTile<SingingCharacter>(
            title: const Text('Thomas Jefferson'),
            value: SingingCharacter.jefferson,
            groupValue: _character,
            onChanged: (SingingCharacter value) { setState(() { _character = value; }); },
          ),
        ],
      ) ,
    );*/
  }

  @override
  Widget build(BuildContext context) {
      return new Container(
        child: new Column(
          children: <Widget>[
            //_buildContentTypeButton(),
          ],
        ),
      );
  }
}