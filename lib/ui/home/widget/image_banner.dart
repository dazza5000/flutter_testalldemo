import 'package:flutter/material.dart';
import 'package:xbanner/xbanner.dart';

class ImageBanner extends StatelessWidget {
  ImageBanner(this.images);
  final List<String> images;
  List<Widget> widgets = new List();


  List<Widget> _getWidget(List<String> data) {
    for (int i = 0; i < data.length; i++) {
      widgets.add(
          new Image.asset(
            data[i].toString(),
            height: 100.0,
            fit: BoxFit.fill,)
      );
    }
    return widgets;
  }

  @override
  Widget build(BuildContext context) {
    return new SizedBox.fromSize(
      size: const Size.fromHeight(200.0),
      child: new XBanner(_getWidget(images)),
    );
  }


}