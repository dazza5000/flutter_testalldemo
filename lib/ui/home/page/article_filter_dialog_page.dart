import 'package:flutter/material.dart';
import 'package:lyc_clinic/base/mystyle.dart';
import 'package:lyc_clinic/ui/article/data/category.dart';
import 'package:lyc_clinic/base/widget/vertical_divider.dart';
import 'package:lyc_clinic/base/mystyle.dart';
import 'package:lyc_clinic/ui/home/presenter/health_education_filter_presenter.dart';
import 'package:lyc_clinic/ui/home/contract/health_education_filter_contract.dart';
import 'package:lyc_clinic/utils/configs.dart';

class FilterHealthEducationDialogFragment extends StatefulWidget {
  FilterListener filterListener;

  FilterHealthEducationDialogFragment(this.filterListener);

  @override
  FilterHealthEducationDialogFragmentState createState() {
    return new FilterHealthEducationDialogFragmentState();
  }
}

class FilterHealthEducationDialogFragmentState
    extends State<FilterHealthEducationDialogFragment>
    implements HealthEducationFilterContract {
  static const Key contentKey = const Key('content');
  HealthEducationFilterPresenter mPresenter;
  List<Category> categoryList = new List<Category>();
  List<Category> selectedLit = new List<Category>();

  FilterHealthEducationDialogFragmentState() {
    mPresenter = new HealthEducationFilterPresenter(this);
  }

  int _selectedIndex = 0;

  _buildClearButton() {
    return new Container(
        margin: const EdgeInsets.only(right: 5.0),
        child: new Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new Container(
              width: 50.0,
              height: 30.0,
              decoration: new BoxDecoration(
                  shape: BoxShape.rectangle,
                  color: Colors.black,
                  borderRadius: new BorderRadius.circular(15.0)),
              child: new GestureDetector(
                onTap: _clearEvent,
                child: new Text(
                  'Clear',
                  style: new TextStyle(color: Colors.white),
                ),
              ),
              alignment: Alignment.center,
            )
          ],
        ));
  }

  void _clearEvent() {
    setState(() {
      print('Clear Data');
    });
  }

  void _onChanged(bool value, int index) {
    setState(() {
      categoryList[index].isSelected = value;
    });
  }

  _continueClick(BuildContext context) {
    if (selectedLit.isNotEmpty) {
      List<int> catList = List<int>();
      for (int i = 0; i < selectedLit.length; i++) {
        catList.add(selectedLit[i].id);
      }
      widget.filterListener.onChooseFilters(catList);
    } else {
      widget.filterListener.onChooseFilters(null);
    }
    Navigator.pop(context);
  }

  _contentTypeClick(int id) {
    setState(() {});
  }

  Widget _categoryBuilder(BuildContext context, int index) {
    Category category = categoryList[index];
    final alreadyChecked = category.isSelected;
    return new Container(
        child: new Column(children: <Widget>[
      new ListTile(
        title: new Text(category.name),
        trailing: new Icon(
          alreadyChecked ? Icons.check_circle : Icons.radio_button_unchecked,
          color: alreadyChecked ? MyStyle.colorGreen : MyStyle.colorGrey,
        ),
        onTap: () {
          setState(() {
            categoryList[index].isSelected = !alreadyChecked;
            selectedLit.add(categoryList[index]);
          });
        },
      ),
      new Divider(color: Colors.grey, height: 0.5)
    ]));
  }

  Widget _buildContentTypeButton(String title, int id) {
    if (id != 2) {
      return new Container(
          child: new Row(
        children: <Widget>[
          new FlatButton(
              onPressed: () => _contentTypeClick(id),
              child:
                  new Text(title, style: new TextStyle(color: Colors.green))),
          new VerticalDivider(
              color: Colors.green,
              height: 40.0,
              left_margin: 0.0,
              right_margin: 0.0)
        ],
      ));
    } else {
      return new Container(
          child: new Row(
        children: <Widget>[
          new FlatButton(
            onPressed: () => _contentTypeClick(id),
            child: new Text(
              title,
              style: new TextStyle(color: Colors.green),
            ),
          ),
        ],
      ));
    }
  }

  @override
  void initState() {
    super.initState();
    mPresenter.getCategory(Configs.TEST_CODE);
  }

  @override
  Widget build(BuildContext context) {
    TextStyle titleStyle = new TextStyle(
        fontSize: MyStyle.xlarge_fontSize,
        color: Colors.black,
        fontWeight: FontWeight.normal);
    return new Scaffold(
      appBar: new AppBar(
        leading: new IconButton(
          onPressed: () {
            Navigator.pop(context, true);
          },
          icon: new Icon(Icons.clear),
        ),
        backgroundColor: Colors.white,
        title: const Text(
          'Filter',
          style: const TextStyle(fontSize: 12.0, color: Colors.black),
        ),
        iconTheme: new IconThemeData(color: Colors.black),
        actions: <Widget>[_buildClearButton()],
      ),
      body: new Center(
        child: new Container(
            child: new Stack(
          children: <Widget>[
            new Column(
              children: <Widget>[
                //new FilterHealthEducation(),
                new Row(
                  children: <Widget>[
                    new Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: new Text(
                        'Content Type',
                        style: titleStyle,
                        textAlign: TextAlign.start,
                      ),
                    ),
                  ],
                ),
                new Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: new Container(
                    child: new Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          _buildContentTypeButton('Show All', 0),
                          _buildContentTypeButton('Article Only', 1),
                          _buildContentTypeButton('Video Only', 2),
                          //  _buildContentTypeButton('Button3', 2),
                        ]),
                    height: 40.0,
                    decoration: new BoxDecoration(
                        border: new Border.all(
                            color: Colors.green,
                            width: 1.0,
                            style: BorderStyle.solid),
                        borderRadius: new BorderRadius.circular(5.0)),
                  ),
                ),

                new Row(
                  children: <Widget>[
                    new Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: new Text(
                        'Category',
                        style: titleStyle,
                        textAlign: TextAlign.start,
                      ),
                    ),
                  ],
                ),
                new Container(
                    child: new ListView.builder(
                  controller: new ScrollController(),
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  padding: const EdgeInsets.only(bottom: 8.0),
                  itemCount: categoryList.length,
                  itemBuilder: _categoryBuilder,
                )),
              ],
            ),
            new Align(
                alignment: FractionalOffset.bottomCenter,
                child: new Row(children: <Widget>[
                  new Expanded(
                      child: new MaterialButton(
                    padding: const EdgeInsets.only(top: 15.0, bottom: 15.0),
                    child: new Text(
                      'Continue',
                      style: new TextStyle(color: Colors.white, fontSize: 14.0),
                    ),
                    onPressed: () => _continueClick(context),
                    color: Colors.green,
                  )),
                ]))
          ],
        )),
      ),
    );
  }

  @override
  void showContentType(int contentType) {}

  @override
  void showCategoryList(List<Category> c) {
    setState(() {
      categoryList = c;
    });
  }
}

abstract class FilterListener {
  void onChooseFilters(List<int> roleList);
}
