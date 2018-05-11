import 'package:flutter/material.dart';
import 'package:lyc_clinic/ui/home/widget/filter_healtheducation.dart';
import 'package:lyc_clinic/base/mystyle.dart';
import 'package:lyc_clinic/ui/article/model/category.dart';
import 'package:lyc_clinic/test/vertical_divider.dart';
import 'package:lyc_clinic/base/mystyle.dart';

class FilterHealthEducationDialogFragment extends StatefulWidget {
  //List<Category> categoryList=new List<Category> ();
  List<Category> categoryList = [
    new Category(1, 'Category Description 1', false),
    new Category(2, 'Category Description 2', false)
  ];

  @override
  FilterHealthEducationDialogFragmentState createState() {
    return new FilterHealthEducationDialogFragmentState();
  }
}

class FilterHealthEducationDialogFragmentState
    extends State<FilterHealthEducationDialogFragment> {
  static const Key contentKey = const Key('content');

  int _selectedIndex = 0;

  _buildClearButton() {
    return new Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        new Container(
          width: 50.0,
          height: 30.0,
          decoration: new BoxDecoration(
              shape: BoxShape.rectangle,
              color: Colors.black,
              borderRadius: new BorderRadius.circular(15.0)
          ),
          child: new GestureDetector(
            onTap: _clearEvent,
            child: new Text(
              'Clear', style: new TextStyle(color: Colors.white),),
          ),
          alignment: Alignment.center,
        )
      ],
    );
  }


  void _clearEvent() {
    setState(() {
      print('Clear Data');
    });
  }

  void _onChanged(bool value, int index) {
    setState(() {
      widget.categoryList[index].isSelectd = value;
    });
  }

  void _continueClick() {

  }

  _contentTypeClick(int id) {
    setState(() {

    });
  }

  Widget _categoryBuilder(BuildContext context, int index) {
    Category category = widget.categoryList[index];
    final alreadyChecked = category.isSelectd;
    return new Container(
        child: new Column(
            children: <Widget>[
              /*new CheckboxListTile(
                  activeColor: Colors.green,
                  value: category.isSelectd,
                  title: new Text(category.name),
                  onChanged: (bool value) {
                    _onChanged(value, index);
                  }),*/
              new ListTile(title: new Text(category.name),
                trailing: new Icon(
                  alreadyChecked ? Icons.check_circle : Icons
                      .radio_button_unchecked,
                  color: alreadyChecked ? MyStyle.colorGreen : MyStyle
                      .colorGrey,), onTap: () {
                  setState(() {
                    widget.categoryList[index].isSelectd = !alreadyChecked;
                  });
                },),

              new Divider(color: Colors.grey, height: 0.5)
            ])
    );
  }


  Widget _buildContentTypeButton(String title, int id) {
    if (id !=2) {
      return new Container(
          child: new Row(
            children: <Widget>[
              new FlatButton(
                  onPressed: () => _contentTypeClick(id),
                  child: new Text(
                      title, style: new TextStyle(color: Colors.green))),
              new VerticalDivider(color: Colors.green,
                  height: 40.0,
                  left_margin: 0.0,
                  right_margin: 0.0)
            ],
          )
      );
    }
    else {
      return new Container(
          child: new Row(
            children: <Widget>[
              new FlatButton(
                onPressed: () => _contentTypeClick(id),
                child: new Text(
                  title, style: new TextStyle(color: Colors.green),),),
            ],
          )
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    TextStyle titleStyle = new TextStyle(fontSize: MyStyle.xmedium_fontSize,
        color: Colors.black,
        fontWeight: FontWeight.bold);
    return new Scaffold(
      appBar: new AppBar(
        leading: new IconButton(
          onPressed: () {
            Navigator.pop(context, true);
          },
          icon: new Icon(Icons.clear),),
        backgroundColor: Colors.white,
        title: const Text('Filter',
          style: const TextStyle(fontSize: 12.0, color: Colors.black),),
        iconTheme: new IconThemeData(
            color: Colors.black
        ),
        actions: <Widget>[
          _buildClearButton()
        ],
      ),
      body: new Center(
        child: new Container(
          child: new Column(
            children: <Widget>[
              //new FilterHealthEducation(),
              new Text('Content Type', style: titleStyle,),
              new Padding(
                padding: const EdgeInsets.all(5.0),
                child: new Container(
                  child: new Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [

                        _buildContentTypeButton('Button1', 0),
                        _buildContentTypeButton('Button1', 1),
                        _buildContentTypeButton('Button2', 2),
                      //  _buildContentTypeButton('Button3', 2),
                      ]),
                  height: 40.0,
                  decoration: new BoxDecoration(
                      border: new Border.all(
                          color: Colors.green,
                          width: 1.0,
                          style: BorderStyle.solid),
                      borderRadius: new BorderRadius.circular(5.0)
                  ),

                ),
              ),

              new Text('Category', style: titleStyle,),
              new Container(
                  child: new ListView.builder(
                    controller: new ScrollController(),
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    padding: const EdgeInsets.only(bottom: 8.0),
                    itemCount: widget.categoryList.length,
                    itemBuilder: _categoryBuilder,

                  )
              ),
              new Expanded(
                  child: new Column(children: <Widget>[],)),
              new Row(
                  children: <Widget>[
                    new Expanded(
                        child: new MaterialButton(
                          padding: const EdgeInsets.only(
                              top: 15.0, bottom: 15.0),
                          child: new Text('Continue',
                            style: new TextStyle(
                                color: Colors.white, fontSize: 14.0),),
                          onPressed: _continueClick,
                          color: Colors.green,)),
                  ]
              )
            ],
          ),
        )
        ,
      )
      ,
    );
  }
}
