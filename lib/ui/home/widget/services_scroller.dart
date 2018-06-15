import 'package:flutter/material.dart';
import 'package:lyc_clinic/base/mystyle.dart';
import 'package:lyc_clinic/ui/service/data/service.dart';
import 'package:lyc_clinic/ui/service/page/sub_services_list_page.dart';

class ServicesScroller extends StatelessWidget {
  ServicesScroller(this.services);

  final List<Service> services;

  _clickServiceItem(BuildContext context, int catId, String catName) {
    Navigator.push(
        context,
        new MaterialPageRoute(
            builder: (_) => new SubServiceListPage(catId, catName)));
  }

  Widget _build_ServiceScroller(BuildContext context, int index) {
    var service = services[index];
    return new Padding(
        padding: const EdgeInsets.only(right: 15.0),
        child: new ClipRRect(
            borderRadius: new BorderRadius.circular(2.0),
            child: new InkWell(
                onTap: () =>
                    _clickServiceItem(context, service.id, service.name),
                child: new Column(
                  children: <Widget>[
                    new Image.network(service.image,
                        fit: BoxFit.fill,
                        height: 110.0,
                        width: 130.0,
                        scale: 6.0),
                    new Container(
                        width: 130.0,
                        child: new Text(
                          service.name,
                          textAlign: TextAlign.left,
                          maxLines: 3,
                          style: new TextStyle(letterSpacing: 0.5),
                        ))
                  ],
                ))));
  }

  @override
  Widget build(BuildContext context) {
    return new Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        new SizedBox.fromSize(
            size: const Size.fromHeight(200.0),
            child: new ListView.builder(
              itemBuilder: _build_ServiceScroller,
              itemCount: services.length,
              scrollDirection: Axis.horizontal,
              padding: new EdgeInsets.only(top: 15.0, left: 10.0),
            ))
      ],
    );
  }
}
