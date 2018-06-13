import 'package:flutter/material.dart';
import 'package:lyc_clinic/base/mystyle.dart';
import 'package:lyc_clinic/ui/home/data/user_saved.dart';
import 'package:lyc_clinic/ui/home/data/save.dart';
import 'package:lyc_clinic/ui/home/data/saved_article.dart';
import 'package:lyc_clinic/ui/home/data/saved_doctor.dart';
import 'package:lyc_clinic/base/data/pagination.dart';
import 'package:lyc_clinic/ui/doctors/data/doctor.dart';
import 'package:lyc_clinic/ui/doctors/data/schedule.dart';
import 'package:lyc_clinic/ui/article/data/article.dart';
import 'package:lyc_clinic/ui/doctors/widget/create_doctor_buttons.dart';
import 'package:lyc_clinic/ui/article/widget/create_article_items.dart';
import 'package:lyc_clinic/ui/doctors/widget/create_doctor_item.dart';
import 'package:lyc_clinic/ui/home/widget/create_article_buttons.dart';
import 'package:lyc_clinic/ui/otheruser/presenter/other_user_presenter.dart';
import 'package:lyc_clinic/ui/otheruser/contract/other_user_contract.dart';
import 'package:lyc_clinic/utils/configs.dart';

class OtherUserPage extends StatefulWidget {
  int userId;

  OtherUserPage(this.userId);

  @override
  OtherUserPageState createState() {
    return new OtherUserPageState();
  }
}

class OtherUserPageState extends State<OtherUserPage>
    implements OtherUserContract, DoctorClickListener, ArticleClickListener {
  OtherUserPresenter mPresenter;
  List<Save> saveList=new List<Save>();

  OtherUserPageState() {
    mPresenter = new OtherUserPresenter(this);
  }

  @override
  void initState() {
    super.initState();
    mPresenter.getUserActivities(Configs.TEST_CODE, widget.userId);
  }

  Widget _buildOtherUserActivityItem(BuildContext context, int index) {
    if (saveList[index].doctor != null) {
      return new Container(
          child: new Stack(
        children: <Widget>[
          //Doctor Item Card
          new CreateDoctorItem(saveList[index].doctor.data),
          //Floating Action Button
          new Positioned(
            child: new CreateDoctorButton(saveList[index].doctor.data, this),
          )
        ],
      ));
    } else if (saveList[index].article != null) {
      return Container(
        child: new Stack(
          children: <Widget>[
            new CreateArticleItems(saveList[index].article.data),
            new Positioned(
              child:
                  new CreateArticleButton(saveList[index].article.data, this),
              bottom: 20.0,
              right: 10.0,
              top: 0.0,
              left: 20.0,
            ),
          ],
        ),
      );
    } else {
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          backgroundColor: MyStyle.colorWhite,
          leading: new IconButton(
              icon: new Icon(Icons.arrow_back, color: MyStyle.colorBlack),
              onPressed: () => Navigator.pop(context)),
          title: new Text(
            'Hnin Nway Nway Hlaing',
            style: new TextStyle(color: MyStyle.colorBlack, fontSize: 14.0),
          ),
        ),
        body: new SingleChildScrollView(
            padding: const EdgeInsets.only(left: 5.0, right: 5.0, top: 10.0),
            controller: new ScrollController(),
            scrollDirection: Axis.vertical,
            child: new Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  new ListView.builder(
                      itemBuilder: _buildOtherUserActivityItem,
                      itemCount: saveList.length,
                      scrollDirection: Axis.vertical,
                      controller: new ScrollController(),
                      shrinkWrap: true)
                ])));
  }

  @override
  void onDoctorShareClick(Doctor doctor) {
    print('Other User Doctor Share Click');
  }

  @override
  void onDoctorFavClick(Doctor doctor) {
    print('Other User Doctor Fav Click');
    mPresenter.setFavoriteDoctor(Configs.TEST_CODE, doctor.id);
  }

  @override
  void onDoctorSaveClick(Doctor doctor) {
    print('Other User Doctor Save Click');
    mPresenter.saveDoctor(Configs.TEST_CODE, doctor.id);
  }

  @override
  void onDoctorItemClick(Doctor doctor) {}

  @override
  void onArticleShareClick(Article article) {
    print('Other User Article Share Click');
  }

  @override
  void onArticleFavClick(Article article) {
    print('Other User Article Fav Click');
    mPresenter.setFavoriteArticle(Configs.TEST_CODE, article.id);
  }

  @override
  void onArticleCommentClick(Article article) {
    //print('Other User Article Save Click');
  }

  @override
  void onArticleSaveClick(Article article) {
    print('Other User Aritcle Save Click');
    mPresenter.saveArticle(Configs.TEST_CODE, article.id);
  }

  @override
  void showUserActivities(List<Save> s) {
    setState(() {
      saveList.clear();
      saveList = s;
    });
  }

  @override
  void showMoreUserActivities(List<Save> s) {
    setState(() {
      saveList.addAll(s);
    });
  }

  @override
  void pagination(Pagination p) {
    setState(() {

    });
  }

  @override
  void showErrorMessage(String message) {}

  @override
  void showMessage(String message) {}

  @override
  void hideDialog() {}

  @override
  void showDialog() {}
}
