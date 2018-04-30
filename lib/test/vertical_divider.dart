import 'package:flutter/material.dart';
class VerticalDivider extends StatelessWidget {
  final Color color;
  final double height;
  VerticalDivider({Color this.color, double this.height});

  /*
  static BorderSide createBorderSide(BuildContext context, { Color color, double width: 0.0 }) {
    assert(width != null);
    return new BorderSide(
      color: color ?? Theme.of(context).dividerColor,
      width: width,
    );
  }

  @override
  Widget build(BuildContext context) {
    return new SizedBox(
      height: 30.0,
      child: new Center(
        child: new Container(
          height: 3.0,
          margin: new EdgeInsetsDirectional.only(start: 2.0),
          decoration: new BoxDecoration(
            border: new Border(
              left: createBorderSide(context, color: Colors.green),
            ),
          ),
        ),
      ),
    );
  }*/

  @override
  Widget build(BuildContext context) {
    return new Container(
      height:height,
      width: 1.0,
      color: color,
      margin: const EdgeInsets.only(left: 10.0, right: 10.0),
    );
  }
}