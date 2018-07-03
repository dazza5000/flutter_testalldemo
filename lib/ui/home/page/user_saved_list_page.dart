import 'package:flutter/material.dart';
import 'package:lyc_clinic/base/mystyle.dart';
import 'package:lyc_clinic/utils/mySharedPreferences.dart';
import 'package:lyc_clinic/ui/home/data/save.dart';
import 'package:lyc_clinic/base/widget.dart';
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
    implements UserSavedContract, DoctorClickListener, ArticleClickListener {
  UserSavedPresenter mPresenter;
  List<Save> savedList = new List<Save>();
  Pagination pagination;
  MySharedPreferences mySharedPreferences = new MySharedPreferences();
  String accessCode;
  bool isLoading = true;

  UserSavedListPageState() {
    mPresenter = new UserSavedPresenter(this);
  }

  @override
  void initState() {
    super.initState();
    _getAccessCode();
  }

  _getAccessCode() {
    mySharedPreferences
        .getStringData(Configs.PREF_USER_ACCESSCODE)
        .then((val) => setState(() {
              accessCode = val;
              mPresenter.getSavedList(accessCode);
            }));
  }

  Widget _buildUserSavedItem(BuildContext context, int index) {
    if (index == savedList.length) {
      if (pagination.currentPage == pagination.lastPage) {
        return new Container(
          child: null,
        );
      } else {
        return new Container(
          padding: const EdgeInsets.symmetric(vertical: 5.0),
          child: new Center(
            child: BaseWidgets.loadingIndicator,
          ),
        );
      }
    } else {
      if (savedList[index].doctor != null) {
        return new Container(
            child: new Stack(
          children: <Widget>[
            //Doctor Item Card
            new CreateDoctorItem(savedList[index].doctor.data),
            //Floating Action Button
            new Positioned(
              top: 0.0,
              bottom: 5.0,
              left: 10.0,
              right: 10.0,
              child: new CreateDoctorButton(savedList[index].doctor.data, this),
            )
          ],
        ));
      } else if (savedList[index].article != null) {
        return Container(
          child: new Stack(
            children: <Widget>[
              new Container(
                color: MyStyle.layoutBackground,
                margin: const EdgeInsets.only(top: 20.0, bottom: 20.0),
                child: new Container(
                  padding: const EdgeInsets.only(bottom: 30.0),
                  child: new CreateArticleItems(savedList[index].article.data),
                  decoration: new BoxDecoration(
                      shape: BoxShape.rectangle,
                      color: MyStyle.colorWhite,
                      borderRadius: new BorderRadius.circular(5.0)),
                ),
              ),
              new Positioned(
                child: new CreateArticleButton(
                    savedList[index].article.data, this),
                bottom: 0.0,
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
  }

  Widget showLoadingOrData() {
    print('SaveList >>${savedList.toString()}');
    if (!isLoading) {
      isLoading = true;
      return new SingleChildScrollView(
        controller: new ScrollController(),
        scrollDirection: Axis.vertical,
        child: new Container(
            color: MyStyle.layoutBackground,
            child: new ListView.builder(
                itemBuilder: _buildUserSavedItem,
                itemCount: pagination != null
                    ? savedList.length + 1
                    : savedList.length,
                shrinkWrap: true,
                reverse: true,
                controller: new ScrollController(),
                scrollDirection: Axis.vertical)),
      );
    } else {
      return new Container(
          child: new Center(
        child: BaseWidgets.loadingIndicator,
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return new Container(
      child: showLoadingOrData(),
    );
  }

  @override
  void setPagination(Pagination p) {
    pagination = p;
  }

  @override
  void showMoreSavedList(List<Save> s) {
    setState(() {
      isLoading = false;
      savedList.addAll(s);
    });
  }

  @override
  void showSavedList(List<Save> s) {
    setState(() {
      isLoading = false;
      savedList.clear();
      savedList = s;
    });
    print('Save ist data${savedList.toString()}');
  }

  @override
  void onLoadError(String err) {}

  @override
  void onDoctorShareClick(Doctor doctor) {}

  @override
  void onDoctorFavClick(Doctor doctor) {
    print('Doctor Fav Click');
    mPresenter.setDoctorFav(accessCode, doctor.id);
  }

  @override
  void onDoctorSaveClick(Doctor doctor) {
    print('Doctor Save Click');
    mPresenter.saveDoctor(accessCode, doctor.id);
  }

  @override
  void onDoctorItemClick(Doctor doctor) {}

  @override
  void onArticleShareClick(Article article) {}

  @override
  void onArticleFavClick(Article article) {
    print('Article Fav Click');
    mPresenter.setArticleFav(accessCode, article.id);
  }

  @override
  void onArticleSaveClick(Article article) {
    print('Article Save Click');
    mPresenter.saveArticle(accessCode, article.id);
  }

  @override
  void onArticleCommentClick(Article article) {}
}
