import 'package:flutter/material.dart';
import 'package:xbanner/xbanner.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:lyc_clinic/ui/home/data/banner_data.dart';

class ImageBanner extends StatelessWidget {
  ImageBanner(this.bannerList);

  final List<BannerData> bannerList;
  List<Widget> widgets = new List();


  _launchUrl(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  void _clickBannerImage(BuildContext context, String url) {
    print('Click Image Banner$url');
    _launchUrl(url);
  }

  List<Widget> _getWidget(List<BannerData> bannerData, BuildContext context) {
    for (int i = 0; i < bannerData.length; i++) {
      widgets.add(
          new InkWell(
            child: new Image.network(
              bannerData[i].img.toString(),
              height: 100.0,
              fit: BoxFit.fill,),
            onTap: () => _clickBannerImage(context, bannerData[i].link),

          )
      );
    }
    return widgets;
  }

  @override
  Widget build(BuildContext context) {
    return new SizedBox.fromSize(
      size: const Size.fromHeight(200.0),
      child: new XBanner(_getWidget(bannerList, context)),
    );
  }


}