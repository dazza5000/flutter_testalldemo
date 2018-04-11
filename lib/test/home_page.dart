import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:lyc_clinic/ui/home/model/drawer_item.dart';
import 'package:lyc_clinic/base/base_menu.dart';
import 'package:lyc_clinic/ui/home/fragment/home_container_fragment.dart';
import 'package:lyc_clinic/ui/doctors/fragment/doctor_list_fragment.dart';
import 'home_fragment.dart';

class HomePage extends StatefulWidget {
  final List<DrawerItem> draweritems = [
    new DrawerItem("HOME", Icons.home),
    new DrawerItem("က်န္းမာေရးပညာေပး", Icons.library_books),
    new DrawerItem(
        "ျပသေဆြးေႏြးႏိုင္ေသာဆရာဝန္မ်ား", FontAwesomeIcons.stethoscope),
    new DrawerItem("BOOKINGS", Icons.event_available),
    new DrawerItem("MY PROFILE", Icons.account_box),
    new DrawerItem("Login", Icons.account_box),
  ];

  @override
  HomePageState createState() {
    return new HomePageState();
  }

}

class HomePageState extends State<HomePage> {
  int selectedDrawerIndex = 0;
  String imageUrl = "https://avatars3.githubusercontent.com/u/16825392?s=460&v=4";

  _getDrawerItemWidgets(int position) {
    switch (position) {
      case 0:
        return new HomeContainerFragment();
      case 1:
        return new HomeFragment();
      case 2:
        return new DoctorListFragment ();
      case 3:
        return new HomeFragment();
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

  @override
  Widget build(BuildContext context) {
    var drawerOptions = [];
    for (var i = 0; i < widget.draweritems.length; i++) {
      var d = widget.draweritems[i];
      drawerOptions.add(
          new ListTile(
              leading: new Icon(d.icon),
              title: new Text(d.title),
              selected: i == selectedDrawerIndex,
              onTap: () {
                _onSelectedItem(i);
              }));
    }

    Row buildButtonColumn(IconData icon, String label, Color color) {
      return new Row(
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
      );
    }

    Widget buttonSection = new Container(
      child: new Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          buildButtonColumn(Icons.location_on, 'Address', Colors.white),
          buildButtonColumn(Icons.phone, 'Phone', Colors.white),
          buildButtonColumn(Icons.message, 'Chat', Colors.white),
        ],
      ),
    );

    var textTheme = Theme
        .of(context)
        .textTheme;


    return new Scaffold(
      appBar: new AppBar(
        title: new Text(widget.draweritems[selectedDrawerIndex].title),
        backgroundColor: Colors.transparent,
        iconTheme: new IconThemeData(color: Colors.grey),
        actions: <Widget>[new Icon(Icons.notifications)],
        elevation:0.0,
      ),
      drawer: new Drawer(
          child: new Scaffold(
            bottomNavigationBar: new Stack(
              overflow: Overflow.visible,
              alignment: new FractionalOffset(.5, 1.0),
              children: [
                new Container(
                  height: 50.0,
                  color: Colors.green,
                  child: new Container(
                    padding: const EdgeInsets.fromLTRB(
                        0.0, 13.0, 0.0, 13.0),
                    child: new ListView(
                      children: <Widget>[
                        buttonSection
                      ],
                    ),
                  ),
                ),
                new Padding(
                  padding: const EdgeInsets.only(bottom: 12.0),
                ),
              ],
            ),
            body: new Container(
              color: Colors.white,
              child: new Column(
                children: <Widget>[
                  new Padding(
                    padding: new EdgeInsets.fromLTRB(
                        5.0, 30.0, 5.0, 30.0),
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
                              padding: const EdgeInsets.fromLTRB(
                                  15.0, 3.0, 0.0, 3.0),
                              child: new Text('Hnin Nway Nway Hlaing',
                                  textAlign: TextAlign.left),
                            ),
                            new Padding(
                              padding: const EdgeInsets.all(3.0),
                              child: new RaisedButton.icon(
                                  onPressed: () {},
                                  color: Colors.white70,
                                  textColor: Colors.grey,
                                  icon: new Icon(
                                    Icons.edit, color: Colors.grey,),
                                  label: new Text("Edit Profile",
                                    style: new TextStyle(
                                        fontWeight: FontWeight.bold),)),
                            ),

                          ],
                        ),


                      ],
                    ),),
                  new Column(children: drawerOptions),
                  new Container(
                    padding: new EdgeInsets.fromLTRB(0.0, 29.0, 0.0, 0.0),
                    decoration: new BoxDecoration(
                      color: new Color(0xFFF7F6F6),
                    ),
                    child: new Column(
                        children: <Widget>[
                          new Container(
                            alignment: FractionalOffset.centerLeft,
                            child: new Image.asset(
                                'images/lyc.png', scale: 2.0,
                                alignment: FractionalOffset.centerLeft),
                          ),
                          new Text(
                            'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec vehicula sem a malesuada rhoncus. Pellentesque ut dolor a dui porttitor porta lacinia non libero. Nunc volutpat arcu quis quam convallis molestie. Etiam ac tristique sem, id commodo justo. Phasellus congue tincidunt lectus, at dignissim ligula maximus eu. Quisque interdum nunc eget tellus bibendum suscipit. Phasellus feugiat ultricies posuere. Nullam porta accumsan velit, ut rutrum massa fermentum eu. Nunc ac bibendum nunc. Mauris eu ultricies ipsum. Ut id dolor dui. Pellentesque dictum dui vel tempus maximus. Vivamus non nisi quis libero scelerisque pretium. Ut eu tristique justo. Sed pellentesque placerat quam, ut ultricies turpis feugiat a. Aliquam a volutpat risus.',
                            maxLines: 3,),
                          new Text('Learn more about us',
                            style: textTheme.subhead.copyWith(
                                fontSize: 16.0,
                                fontWeight: FontWeight.bold),)
                        ]
                    ),
                  ),

                ],
              ),
            ),
          )
      ),
      body: _getDrawerItemWidgets(selectedDrawerIndex),
      backgroundColor: Colors.white,
    );
  }
}