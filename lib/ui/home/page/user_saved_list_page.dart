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
import 'package:lyc_clinic/ui/home/presenter/user_saved_presenter.dart';
import 'package:lyc_clinic/ui/home/contract/user_saved_contract.dart';
import 'package:lyc_clinic/utils/configs.dart';

class UserSavedListPage extends StatefulWidget {
  @override
  UserSavedListPageState createState() {
    return new UserSavedListPageState();
  }
}

class UserSavedListPageState extends State<UserSavedListPage>
    implements UserSavedContract,DoctorClickListener,ArticleClickListener{
  UserSavedPresenter mPresenter;
  List<Save> savedList = new List<Save>();

  UserSavedListPageState() {
    mPresenter = new UserSavedPresenter(this);
  }

  @override
  void initState() {
    super.initState();
    mPresenter.getSavedList(Configs.TEST_CODE);
  }

  Widget _buildUserSavedItem(BuildContext context, int index) {
    if (savedList[index].doctor != null) {
      return new Container(
          child: new Stack(
        children: <Widget>[
          //Doctor Item Card
          new CreateDoctorItem(savedList[index].doctor.data),
          //Floating Action Button
          new Positioned(
            child: new CreateDoctorButton(savedList[index].doctor.data,this),
          )
        ],
      ));
    } else if (savedList[index].article != null) {
      return Container(
        child: new Stack(
          children: <Widget>[
            new CreateArticleItems(savedList[index].article.data),
            new Positioned(
              child: new CreateArticleButton(savedList[index].article.data,this),
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
          child: new ListView.builder(
              itemBuilder: _buildUserSavedItem,
              itemCount: savedList.length,
              shrinkWrap: true,
              reverse: true,
              controller: new ScrollController(),
              scrollDirection: Axis.vertical)),
    );
  }

  @override
  void pagination(Pagination p) {}

  @override
  void showMoreSavedList(List<Save> s) {}

  @override
  void showSavedList(List<Save> s) {
    setState(() {
      savedList.clear();
      savedList = s;
    });
    print('Save ist data${savedList.toString()}');
  }

  @override
  void onLoadError(String err) {}

  @override
  void onDoctorShareClick(Doctor doctor) {

  }

  @override
  void onDoctorFavClick(Doctor doctor) {
    print('Doctor Fav Click');
    mPresenter.setDoctorFav(Configs.TEST_CODE, doctor.id);
  }

  @override
  void onDoctorSaveClick(Doctor doctor) {
    print('Doctor Save Click');
    mPresenter.saveDoctor(Configs.TEST_CODE, doctor.id);
  }

  @override
  void onDoctorItemClick(Doctor doctor) {

  }

  @override
  void onArticleShareClick(Article article) {

  }

  @override
  void onArticleFavClick(Article article) {
    print('Article Fav Click');
    mPresenter.setArticleFav(Configs.TEST_CODE, article.id);
  }

  @override
  void onArticleSaveClick(Article article) {
    print('Article Save Click');
    mPresenter.saveArticle(Configs.TEST_CODE, article.id);
  }

  @override
  void onArticleCommentClick(Article article) {

  }


}
