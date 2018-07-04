import 'package:flutter/material.dart';
import 'dart:async';
import 'package:map_view/map_view.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:lyc_clinic/ui/chat/page/chat_list_page.dart';
import 'package:lyc_clinic/utils/mySharedPreferences.dart';
import 'package:lyc_clinic/utils/configs.dart';
import 'package:lyc_clinic/base/widget/base_widget.dart';

class CustomBottomNavigationBar extends StatefulWidget {
  @override
  CustomBottomNavigationBarState createState() {
    return new CustomBottomNavigationBarState();
  }
}

class CustomBottomNavigationBarState extends State<CustomBottomNavigationBar> {
  MapView mapView = new MapView();
  CameraPosition cameraPosition;
  var compositeSubscription = new CompositeSubscription();
  var staticMapProvider = new StaticMapProvider(Configs.GOOGLE_MAP_API_KEY);
  MySharedPreferences mySharedPreferences = new MySharedPreferences();
  Uri staticMapUri;
  bool isLogin = false;
  String address;
  double lat;
  double lon;
  String phone;

  CustomBottomNavigationBarState() {
    mySharedPreferences
        .getBooleanData(Configs.PREF_USER_LOGIN)
        .then((val) => setState(() {
              isLogin = val != null ? val : false;
            }));
    getAddress(isLogin);
  }

  getAddress(bool isLogin) async {
      address =
          await mySharedPreferences.getStringData(Configs.PREF_LYC_ADDRESS);
      print('GET Address??$address');
      lat = await mySharedPreferences.getDoubleData(Configs.PREF_LYC_LAT);
      lon = await mySharedPreferences.getDoubleData(Configs.PREF_LYC_LON);
      phone = await mySharedPreferences.getStringData(Configs.PREF_PHONE_ONE);
  }

  _addressClick(BuildContext context) {
    if (isLogin)
      showMap();
    else
      BaseWidgets.showLoginDialog(context);
    //_launchMaps();
  }

  _phoneClick(BuildContext context) {
    _callPhone();
  }

  _chatClick(BuildContext context) {
    if (isLogin)
      Navigator.push(
          context, new MaterialPageRoute(builder: (_) => new ChatListPage()));
    else
      BaseWidgets.showLoginDialog(context);
  }

  _callPhone() async {
    print('Custom Bottom Nav Phone call');
    var phoneNo = 'tel:$phone';
    if (await canLaunch(phoneNo)) {
      await launch(phoneNo);
    } else {
      throw 'Colud not call $phoneNo';
    }
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

  Widget buildButtonColumn(
      BuildContext context, IconData icon, String label, Color color, int id) {
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
  void initState() {
    super.initState();
    MapView.setApiKey(Configs.GOOGLE_MAP_API_KEY);
    cameraPosition = new CameraPosition(Locations.portland, 12.0);
    staticMapUri = staticMapProvider.getStaticUri(Locations.portland, 12,
        width: 900, height: 400);
  }

  @override
  Widget build(BuildContext context) {
    return new Container(
      height: 50.0,
      decoration: new BoxDecoration(
          color: Colors.white,
          shape: BoxShape.rectangle,
          boxShadow: [
            new BoxShadow(
                color: Colors.black,
                blurRadius: 15.0,
                offset: new Offset(1.0, 4.0)),
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

  _launchMaps() async {
    String googleUrl = 'comgooglemaps://?center=${16.797035},${96.126425}';
    String appleUrl = 'https://maps.apple.com/?sll=${16.797035},${96.126425}';
    if (await canLaunch("comgooglemaps://")) {
      print('launching com googleUrl');
      await launch(googleUrl);
    } else if (await canLaunch(appleUrl)) {
      print('launching apple url');
      await launch(appleUrl);
    } else {
      throw 'Could not launch url';
    }
  }

  showMap() {
    print(address);
    mapView.show(
        new MapOptions(
            mapViewType: MapViewType.normal,
            showUserLocation: true,
            initialCameraPosition:
                new CameraPosition(new Location(16.796969, 96.126417), 15.0),
            title: address),
        toolbarActions: [new ToolbarAction("Close", 1)]);

    var sub = mapView.onMapReady.listen((_) {
      mapView.setMarkers(<Marker>[
        new Marker("1", address, 16.796969, 96.126417, color: Colors.red),
      ]);
      mapView.zoomToFit(padding: 200);
    });
    compositeSubscription.add(sub);

    sub = mapView.onLocationUpdated
        .listen((location) => print("Location updated $location"));
    compositeSubscription.add(sub);

    sub = mapView.onTouchAnnotation
        .listen((annotation) => print("annotation tapped"));
    compositeSubscription.add(sub);

    sub = mapView.onMapTapped
        .listen((location) => print("Touched location $location"));
    compositeSubscription.add(sub);

    sub = mapView.onCameraChanged.listen((cameraPosition) =>
        this.setState(() => this.cameraPosition = cameraPosition));
    compositeSubscription.add(sub);

    sub = mapView.onToolbarAction.listen((id) {
      if (id == 1) {
        _handleDismiss();
      }
    });
    compositeSubscription.add(sub);

    sub = mapView.onInfoWindowTapped.listen((marker) {
      print("Info Window Tapped for ${marker.title}");
    });
    compositeSubscription.add(sub);
  }

  _handleDismiss() async {
    double zoomLevel = await mapView.zoomLevel;
    Location centerLocation = await mapView.centerLocation;
    List<Marker> visibleAnnotations = await mapView.visibleAnnotations;
    print("Zoom Level: $zoomLevel");
    print("Center: $centerLocation");
    print("Visible Annotation Count: ${visibleAnnotations.length}");
    var uri = await staticMapProvider.getImageUriFromMap(mapView,
        width: 900, height: 400);
    setState(() => staticMapUri = uri);
    mapView.dismiss();
    compositeSubscription.cancel();
  }
}

class CompositeSubscription {
  Set<StreamSubscription> _subscriptions = new Set();

  void cancel() {
    for (var n in this._subscriptions) {
      n.cancel();
    }
    this._subscriptions = new Set();
  }

  void add(StreamSubscription subscription) {
    this._subscriptions.add(subscription);
  }

  void addAll(Iterable<StreamSubscription> subs) {
    _subscriptions.addAll(subs);
  }

  bool remove(StreamSubscription subscription) {
    return this._subscriptions.remove(subscription);
  }

  bool contains(StreamSubscription subscription) {
    return this._subscriptions.contains(subscription);
  }

  List<StreamSubscription> toList() {
    return this._subscriptions.toList();
  }
}
