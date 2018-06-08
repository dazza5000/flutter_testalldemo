import 'package:flutter/material.dart';
import 'package:lyc_clinic/base/mystyle.dart';
import 'package:lyc_clinic/ui/service/contract/services_contract.dart';
import 'package:lyc_clinic/ui/service/presenter/services_presenter.dart';
import 'package:lyc_clinic/ui/service/data/sub_service.dart';
import 'package:lyc_clinic/utils/configs.dart';
import 'package:lyc_clinic/ui/service/page/sub_services_details_page.dart';

class SubServiceListPage extends StatefulWidget {
  int catId;
  String catName;

  SubServiceListPage(this.catId, this.catName);

  @override
  ServiceListPageState createState() {
    return new ServiceListPageState();
  }
}

class ServiceListPageState extends State<SubServiceListPage>
    implements ServicesContract {
  ServicePresenter mPresenter;
  List<SubService> servicesList = new List<SubService>();

  ServiceListPageState() {
    mPresenter = new ServicePresenter(this);
  }

  _goToServicesDetails(
      BuildContext context, int servicesId, int subServicesId,String title) {
    Navigator.push(
        context,
        new MaterialPageRoute(
            builder: (_) =>
                new SubServicesDetailsPage(servicesId, subServicesId,title)));
  }

  Widget _buildServicesList(BuildContext context, int index) {
    return new Container(
      child: new Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          new Divider(
            color: MyStyle.defaultGrey,
            height: 1.0,
          ),
          new ListTile(
              onTap: () => _goToServicesDetails(
                  context, widget.catId, servicesList[index].id,servicesList[index].name),
              title: new Text(servicesList[index].name.toString())),
        ],
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    mPresenter.getSubServices(Configs.TEST_CODE, widget.catId);
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          backgroundColor: MyStyle.colorWhite,
          title: new Text(widget.catName, style: MyStyle.appbarTitleStyle()),
          leading: new IconButton(
              icon: new Icon(Icons.clear, color: MyStyle.colorBlack),
              onPressed: () => Navigator.pop(context)),
        ),
        body: new Container(
            child: new Padding(
                padding: const EdgeInsets.all(10.0),
                child: new Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    new Text(
                      'ဝန္ေဆာင္မႈမ်ား',
                      style: new TextStyle(fontSize: MyStyle.large_fontSize),
                    ),
                    new ListView.builder(
                      padding: const EdgeInsets.only(top: 10.0),
                      itemBuilder: _buildServicesList,
                      itemCount: servicesList.length,
                      shrinkWrap: true,
                      controller: new ScrollController(),
                      scrollDirection: Axis.vertical,
                    )
                  ],
                ))));
  }

  @override
  void showServiceDetails() {}

  @override
  void showServices(List<SubService> services) {
    setState(() {
      servicesList = services;
    });
  }
}
