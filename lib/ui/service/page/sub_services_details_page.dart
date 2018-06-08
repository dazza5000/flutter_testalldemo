import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:lyc_clinic/utils/configs.dart';
import 'package:lyc_clinic/ui/service/data/sub_service_details.dart';
import 'package:lyc_clinic/ui/service/data/service.dart';
import 'package:lyc_clinic/ui/service/presenter/sub_services_details_presenter.dart';
import 'package:lyc_clinic/ui/service/contract/sub_services_details_contract.dart';
import 'package:lyc_clinic/ui/home/widget/services_scroller.dart';
import 'package:lyc_clinic/base/mystyle.dart';
import 'package:html2md/html2md.dart' as html2md;
import 'package:flutter_markdown/flutter_markdown.dart';

const double _kAppBarHeight = 250.0;
const double _kFabHalfSize =
    28.0; // TODO(mpcomplete): needs to adapt to screen size
const double _kRecipePageMaxWidth = 500.0;

class SubServicesDetailsPage extends StatefulWidget {
  int servicesId;
  int subServicesId;
  String title;

  SubServicesDetailsPage(this.servicesId, this.subServicesId, this.title);

  @override
  SubServicesDetailsPageState createState() {
    // TODO: implement createState
    return new SubServicesDetailsPageState();
  }
}

class SubServicesDetailsPageState extends State<SubServicesDetailsPage>
    implements SubServicesDetailsContract {
  SubServicesDetailsPresenter mPresenter;
  List<Service> servicesList;
  SubServiceDetails subServiceDetails;

  SubServicesDetailsPageState() {
    mPresenter = new SubServicesDetailsPresenter(this);
  }

  _clickBack(BuildContext context){
    Navigator.pop(context);
  }

  _clickShare(BuildContext context){

  }

  _clickNextDirection(BuildContext context){

  }


  @override
  void initState() {
    super.initState();
    print('Service & SubService Id${widget.subServicesId }');
    mPresenter.getSubServicesDetails(
        Configs.TEST_CODE, widget.servicesId, widget.subServicesId);
    mPresenter.getServices(Configs.TEST_CODE);
  }

  Widget _buildAppBar(BuildContext context) {
    return new Stack(
      children: <Widget>[
        new Positioned(
          left: 0.0,
          top: 10.0,
          child: new IconButton(
            icon: new Icon(
              Icons.arrow_back,
              color: MyStyle.colorWhite,
            ),
            iconSize: 30.0,
            onPressed:() => _clickBack(context),
          ),
        ),
        new Positioned(
          right: 0.0,
          top: 10.0,
          child: new IconButton(
            icon: new Icon(
              Icons.share,
              color: MyStyle.colorWhite,
            ),
            iconSize: 30.0,
            onPressed: () => _clickShare(context),
          ),
        ),
      ],
    );
  }

  Widget _buildBody(BuildContext context) {
    return new SingleChildScrollView(
        controller: new ScrollController(),
        scrollDirection: Axis.vertical,
        child: new Padding(
          padding: const EdgeInsets.only(top: 0.0, bottom: 5.0),
          child: new Container(
            child: new Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                new Container(
                  constraints: new BoxConstraints.expand(
                    height: 250.0,
                  ),
                  padding:
                      new EdgeInsets.only(left: 16.0, bottom: 8.0, right: 16.0),
                  decoration: new BoxDecoration(
                    image: new DecorationImage(
                      image: new NetworkImage(subServiceDetails.image),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                new Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 15.0, vertical: 5.0),
                    child: new Text(
                      widget.title.toString(),
                      textAlign: TextAlign.left,
                      style: MyStyle.headerStyle(),
                    )),
                new Padding(
                    padding: const EdgeInsets.only(
                        top: 15.0, left: 5.0, right: 5.0, bottom: 15.0),
                    child: new Text(
                      'ဝန္ေဆာင္မွဳမ်ား',
                      textAlign: TextAlign.left,
                      style: MyStyle.listItemTextStyle(),
                    )),
                new MarkdownBody(data: html2md.convert(subServiceDetails.desc)),
                new Container(
                  margin: const EdgeInsets.all(10.0),
                  color: MyStyle.layoutBackground,
                  child: new Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      new Row(
                        children: <Widget>[
                          new Text('အျခားဝန္ေဆာင္မွဳမ်ား'),
                          new Expanded(
                              child: new Row(
                            children: <Widget>[],
                          )),
                          new IconButton(
                              icon: new Icon(
                                FontAwesomeIcons.handPointRight,
                                color: MyStyle.colorGrey,
                              ),
                              onPressed: () => _clickNextDirection(context))
                        ],
                      ),
                      new ServicesScroller(servicesList),
                    ],
                  ),
                )
              ],
            ),
          ),
        ));
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        body: new Container(
      padding: const EdgeInsets.only(top: 25.0),
      child: new Stack(
        children: <Widget>[
          _buildBody(context),
          new Positioned(
            child: _buildAppBar(context),
          ),
        ],
      ),
    ));
  }

  @override
  void hideServiceDialog() {}

  @override
  void showServiceDialog() {}

  @override
  void showServicePicker() {}

  @override
  void showServices(List<Service> s) {
    setState(() {
      servicesList = s;
    });
  }

  @override
  void showServiceDetail(SubServiceDetails sd) {
    setState(() {
      subServiceDetails = sd;
    });
  }
}
