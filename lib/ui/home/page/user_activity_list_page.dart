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
import 'package:lyc_clinic/utils/configs.dart';
import 'package:lyc_clinic/ui/home/contract/user_activity_contract.dart';
import 'package:lyc_clinic/ui/home/presenter/user_activity_presenter.dart';
import 'package:lyc_clinic/base/data/pagination.dart';
import 'package:lyc_clinic/ui/home/data/save.dart';

class UserActivityListPage extends StatefulWidget {
  @override
  UserActivityListPageState createState() {
    return new UserActivityListPageState();
  }
}

class UserActivityListPageState extends State<UserActivityListPage>
    implements UserActivityContract,DoctorClickListener,ArticleClickListener{
  UserActivityPresenter mPresenter;
  List<Save> saveList = new List<Save>();

  UserActivityListPageState() {
    mPresenter = new UserActivityPresenter(this);
  }

  @override
  void initState() {
    super.initState();
    mPresenter.getUserActivity(Configs.TEST_CODE);
  }

  Widget _buildUserActivityItem(BuildContext context, int index) {
    if (saveList[index].doctor != null) {
      return new Container(
          child: new Stack(
        children: <Widget>[
          //Doctor Item Card
          new CreateDoctorItem(saveList[index].doctor.data),
          //Floating Action Button
          new Positioned(
            child: new CreateDoctorButton(saveList[index].doctor.data,this),
          )
        ],
      ));
    } else if (saveList[index].article != null) {
      return Container(
        child: new Stack(
          children: <Widget>[
            new CreateArticleItems(saveList[index].article.data),
            new Positioned(
              child: new CreateArticleButton(saveList[index].article.data,this),
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
    return new SingleChildScrollView(
        controller: new ScrollController(),
        scrollDirection: Axis.vertical,
        child: new Container(
          color: MyStyle.layoutBackground,
          child: new Column(
            children: <Widget>[
              new ListView.builder(
                  itemBuilder: _buildUserActivityItem,
                  itemCount: saveList.length,
                  scrollDirection: Axis.vertical,
                  controller: new ScrollController(),
                  shrinkWrap: true)
            ],
          ),
        ));
  }

  @override
  void pagination(Pagination p) {}

  @override
  void showMoreUserActivities(List<Save> s) {}

  @override
  void showUserActivities(List<Save> s) {
    setState(() {
      saveList.clear();
      saveList = s;
    });
    print('Save List Data${saveList.toString()}');
  }

  @override
  void loadError(String e) {}

  @override
  void onDoctorShareClick(Doctor doctor) {

  }

  @override
  void onDoctorFavClick(Doctor doctor) {
    print('Doctor Fav Click ');
    mPresenter.setDoctorFav(Configs.TEST_CODE, doctor.id);
  }

  @override
  void onDoctorSaveClick(Doctor doctor) {
    print('Doctor Save Click ');
    mPresenter.saveDoctor(Configs.TEST_CODE, doctor.id);
  }

  @override
  void onDoctorItemClick(Doctor doctor) {
    print('Article Fav Click ');
    mPresenter.setDoctorFav(Configs.TEST_CODE, doctor.id);
  }

  @override
  void onArticleShareClick(Article article) {
    print('Article Share Click ');
  }

  @override
  void onArticleFavClick(Article article) {
    print('Article Fav Click ');
    mPresenter.setArticleFav(Configs.TEST_CODE, article.id);
  }

  @override
  void onArticleSaveClick(Article article) {
    print('Article Save Click ');
    mPresenter.saveArticle(Configs.TEST_CODE, article.id);
  }

  @override
  void onArticleCommentClick(Article article) {
    print('Article Comment Click ');
  }


}
