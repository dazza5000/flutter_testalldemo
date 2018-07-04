import 'package:flutter/material.dart';

class VerticalDivider extends StatelessWidget {
  final Color color;
  final double height;
  final double width;
  final double left_margin;
  final double right_margin;

  VerticalDivider(
      {Color this.color, double this.height, double this.width, double this.left_margin, double this.right_margin});

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
      height: height,
      width: width != null ? width : 1.0,
      color: color,
      margin: new EdgeInsets.only(left: left_margin, right: right_margin),
    );
  }
}