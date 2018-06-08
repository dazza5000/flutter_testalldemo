import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:lyc_clinic/ui/home/data/drawer_item.dart';
import 'package:lyc_clinic/base/base_menu.dart';
import 'package:lyc_clinic/ui/home/page/home_container_fragment.dart';
import 'package:lyc_clinic/ui/doctors/page/doctor_list_page.dart';
import 'package:lyc_clinic/ui/home/page/health_education_page.dart';
import 'home_fragment.dart';
import 'package:lyc_clinic/ui/notification/page/notification_list_page.dart';
import 'package:lyc_clinic/ui/home/page/profile_data_page.dart';
import 'package:lyc_clinic/base/mystyle.dart';
import 'package:lyc_clinic/ui/about/page/about_page.dart';
import 'package:flutter_search_bar/flutter_search_bar.dart';
import 'package:lyc_clinic/ui/chat/page/chat_list_page.dart';
import 'package:url_launcher/url_launcher.dart';
//import 'package:material_search/material_search.dart';

class HomePage extends StatefulWidget {
  final List<DrawerItem> draweritems = [
    new DrawerItem("HOME", Icons.home),
    new DrawerItem("က်န္းမာေရးပညာေပး", Icons.library_books),
    new DrawerItem(
        "ျပသေဆြးေႏြးႏိုင္ေသာဆရာဝန္မ်ား", FontAwesomeIcons.stethoscope),
    new DrawerItem("BOOKINGS", Icons.event_available),
    new DrawerItem("MY PROFILE", Icons.account_box),
    //new DrawerItem("Login", Icons.account_box),
  ];

  @override
  HomePageState createState() {
    return new HomePageState();
  }
}

class HomePageState extends State<HomePage> {
  int selectedDrawerIndex = 0;
  String imageUrl =
      "https://avatars3.githubusercontent.com/u/16825392?s=460&v=4";
  SearchBar searchBar;
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  _getDrawerItemWidgets(int position) {
    print('Drawer Item $position');
    switch (position) {
      case 0:
        return new HomeContainerFragment();
      case 1:
        return new HealthEducationPage();
      case 2:
        return new DoctorListPage();
      case 3:
        return new ProfileDataPage(tabIndex: 2);
      case 4:
        return new ProfileDataPage(tabIndex: 3);
      default:
        return new Text("Eror");
    }
  }

  _onSelectedItem(int index) {
    setState(() {
      selectedDrawerIndex = index;
      Navigator.of(context).pop();
    });
    _getDrawerItemWidgets(selectedDrawerIndex);
  }

  _clickNoti(BuildContext context) {
    Navigator.push(context,
        new MaterialPageRoute(builder: (_) => new NotifiacationListPage()));
  }

  _clickEditProfilel(BuildContext context) {
    setState(() {
      selectedDrawerIndex = 4;
      Navigator.pop(context);
    });
  }

  _clickBottomMenuItem(int index, BuildContext context) {
    switch (index) {
      case 0:
        break;
      case 1:
        _callPhone();
        break;
      case 2:
        Navigator.push(
            context, new MaterialPageRoute(builder: (_) => new ChatListPage()));
        break;
    }
  }

  _callPhone() async {
    const phoneNo = 'tel:09421234567';
    if (await canLaunch(phoneNo)) {
      await launch(phoneNo);
    } else {
      throw 'Colud not call $phoneNo';
    }
  }

  /* _buildMaterialSearchPage(BuildContext context) {
    return new MaterialPageRoute<String>(
        settings: new RouteSettings(
          name: 'material_search',
          isInitialRoute: true,
        ),
        builder: (BuildContext context) {
          return new Material(
            child: new MaterialSearch<String>(
              placeholder: 'Search',
              results: _names.map((String v) => new MaterialSearchResult<String>(
                icon: Icons.person,
                value: v,
                text: "Mr(s). $v",
              )).toList(),
              filter: (dynamic value, String criteria) {
                return value.toLowerCase().trim()
                    .contains(new RegExp(r'' + criteria.toLowerCase().trim() + ''));
              },
              onSelect: (dynamic value) => Navigator.of(context).pop(value),
            ),
          );
        }
    );
  }*/

  /*_clickSearch(BuildContext context) {
    Navigator.of(context)
        .push(_buildMaterialSearchPage(context))
        .then((dynamic value) {
      setState(() => _name = value as String);
    });
  }*/

  AppBar _buildAppBar(BuildContext context) {
    if (selectedDrawerIndex == 2) {
      return new AppBar(
        title: new Text(
          widget.draweritems[selectedDrawerIndex].title,
          style: MyStyle.appbarTitleStyle(),
        ),
        backgroundColor: MyStyle.colorWhite,
        iconTheme: new IconThemeData(color: MyStyle.colorGrey),
        actions: <Widget>[
          searchBar.getSearchAction(context)
          /*new IconButton(
            icon: new Icon(Icons.search, color: MyStyle.colorBlack,),
            onPressed: () => _clickSearch(context),)*/
        ],
        elevation: 2.0,
      );
    } else {
      return new AppBar(
        title: new Image.asset('assets/images/lyc.png',
            scale: 2.0, alignment: FractionalOffset.center),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        iconTheme: new IconThemeData(color: MyStyle.colorGrey),
        actions: <Widget>[
          new IconButton(
            icon: new Icon(Icons.notifications),
            onPressed: () => _clickNoti(context),
          )
        ],
        elevation: 0.0,
      );
    }
  }

  void onSubmitted(String value) {
    Scaffold
        .of(context)
        .showSnackBar(new SnackBar(content: new Text('You wrote $value!')));
    /*setState(() =>
        _scaffoldKey.currentState
            .showSnackBar(
            new SnackBar(content: new Text('You wrote $value!'))));*/
  }

  HomePageState() {
    searchBar = new SearchBar(
        inBar: false,
        buildDefaultAppBar: _buildAppBar,
        setState: setState,
        onSubmitted: onSubmitted);
  }

  Widget _getNavHeader() {
    return new Padding(
      padding: new EdgeInsets.fromLTRB(5.0, 30.0, 5.0, 30.0),
      child: new Row(
        children: <Widget>[
          new GestureDetector(
            child: new CircleAvatar(
              backgroundImage: new NetworkImage(imageUrl),
              radius: 40.0,
            ),
          ),
          new Column(
            children: <Widget>[
              new Padding(
                padding: const EdgeInsets.fromLTRB(15.0, 3.0, 0.0, 3.0),
                child: new Text('Hnin Nway Nway Hlaing',
                    textAlign: TextAlign.left),
              ),
              new Padding(
                padding: const EdgeInsets.all(3.0),
                child: new RaisedButton.icon(
                    onPressed: () => _clickEditProfilel(context),
                    color: MyStyle.colorWhite,
                    textColor: MyStyle.colorGrey,
                    icon: new Icon(
                      Icons.edit,
                      color: MyStyle.colorGrey,
                    ),
                    label: new Text(
                      "Edit Profile",
                      style: new TextStyle(fontWeight: FontWeight.bold),
                    )),
              ),
            ],
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> drawerOptions = new List<Widget>();
    for (var i = 0; i < widget.draweritems.length; i++) {
      var d = widget.draweritems[i];
      drawerOptions.add(new ListTile(
          leading: new Icon(d.icon),
          title: new Text(d.title),
          selected: i == selectedDrawerIndex,
          onTap: () {
            _onSelectedItem(i);
          }));
    }

    Widget buildBottomColumn(
        IconData icon, String label, Color color, int index) {
      return new InkWell(
          onTap: () => _clickBottomMenuItem(index, context),
          child: new Row(
            //mainAxisSize: MainAxisSize.max,
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
          ));
    }

    Widget buttonSection = new Container(
      child: new Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          buildBottomColumn(
              Icons.location_on, 'Address', MyStyle.colorWhite, 0),
          buildBottomColumn(Icons.phone, 'Phone', MyStyle.colorWhite, 1),
          buildBottomColumn(Icons.message, 'Chat', MyStyle.colorWhite, 2),
        ],
      ),
    );

    var textTheme = Theme.of(context).textTheme;

    return new Scaffold(
      appBar: searchBar.build(context),
      drawer: new Drawer(
        child: new Scaffold(
          bottomNavigationBar: new Stack(
            overflow: Overflow.visible,
            alignment: new FractionalOffset(.5, 1.0),
            children: [
              new Container(
                height: 50.0,
                color: MyStyle.colorGreen,
                child: new Container(
                  padding: const EdgeInsets.fromLTRB(0.0, 13.0, 0.0, 13.0),
                  child: new ListView(
                    children: <Widget>[buttonSection],
                  ),
                ),
              ),
            ],
          ),
          body: new Container(
            color: MyStyle.colorWhite,
            child: new Stack(children: <Widget>[
              new Column(
                children: <Widget>[
                  _getNavHeader(),
                  new Column(children: drawerOptions),
                ],
              ),
              new Align(
                  alignment: FractionalOffset.bottomCenter,
                  child: new Container(
                    padding: const EdgeInsets.all(8.0),
                    height: 180.0,
                    color: MyStyle.layoutBackground,
                    alignment: FractionalOffset.bottomCenter,
                    child: new Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        new Container(
                          alignment: FractionalOffset.centerLeft,
                          child: new Image.asset('assets/images/lyc.png',
                              scale: 2.0,
                              alignment: FractionalOffset.centerLeft),
                        ),
                        new Text(
                          'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec vehicula sem a malesuada rhoncus. Pellentesque ut dolor a dui porttitor porta lacinia non libero. Nunc volutpat arcu quis quam convallis molestie. Etiam ac tristique sem, id commodo justo. Phasellus congue tincidunt lectus, at dignissim ligula maximus eu. Quisque interdum nunc eget tellus bibendum suscipit. Phasellus feugiat ultricies posuere. Nullam porta accumsan velit, ut rutrum massa fermentum eu. Nunc ac bibendum nunc. Mauris eu ultricies ipsum. Ut id dolor dui. Pellentesque dictum dui vel tempus maximus. Vivamus non nisi quis libero scelerisque pretium. Ut eu tristique justo. Sed pellentesque placerat quam, ut ultricies turpis feugiat a. Aliquam a volutpat risus.',
                          maxLines: 3,
                        ),
                        new InkWell(
                            child: new Text(
                              'Learn more about us',
                              style: textTheme.subhead.copyWith(
                                  fontSize: MyStyle.medium_fontSize,
                                  decoration: TextDecoration.underline),
                            ),
                            onTap: () => Navigator.push(
                                context,
                                new MaterialPageRoute(
                                    builder: (_) => new AboutPage())))
                      ],
                    ),
                  ))
            ]),
          ),
        ),
      ),
      body: _getDrawerItemWidgets(selectedDrawerIndex),
      backgroundColor: MyStyle.colorWhite,
    );
  }
}
