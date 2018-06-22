import 'package:flutter/material.dart';
import 'package:lyc_clinic/ui/home/page/health_education_page.dart';
import 'package:lyc_clinic/ui/article/widget/create_feature_article_items.dart';
import 'package:lyc_clinic/ui/home/widget/article_lists.dart';
import 'package:lyc_clinic/ui/article/data/article.dart';
import 'package:lyc_clinic/ui/home/page/article_filter_dialog_page.dart';
import 'package:lyc_clinic/ui/home/presenter/health_education_presenter.dart';
import 'package:lyc_clinic/ui/home/contract/health_education_contract.dart';
import 'package:lyc_clinic/base/data/pagination.dart';
import 'package:lyc_clinic/utils/configs.dart';
import 'package:lyc_clinic/base/mystyle.dart';
import 'package:lyc_clinic/ui/home/widget/create_article_buttons.dart';
import 'package:lyc_clinic/utils/mySharedPreferences.dart';

class HealthEducationPage extends StatefulWidget {
  @override
  HealthEducationPageState createState() {
    return new HealthEducationPageState();
  }
}

class HealthEducationPageState extends State<HealthEducationPage>
    implements HealthEducationContract, FilterListener, ArticleClickListener {
  HealthEducationPresenter mPresenter;
  List<Article> articles = new List<Article>();
  String accessCode;
  bool isGuest = false;
  bool isLogin = false;
  MySharedPreferences mySharedPreferences = new MySharedPreferences();

  HealthEducationPageState() {
    mPresenter = new HealthEducationPresenter(this);
  }

  @override
  void initState() {
    super.initState();
    mySharedPreferences
        .getBooleanData(Configs.PREF_USER_LOGIN)
        .then((val) => setState(() {
              isLogin = val;
              _getAccessCode(isLogin);
            }));
  }

  _getAccessCode(bool login) {
    if (login) {
      isGuest = false;
      mySharedPreferences
          .getStringData(Configs.PREF_USER_ACCESSCODE)
          .then((val) => setState(() {
                isGuest = false;
                accessCode = val;
                mPresenter.getArticles(accessCode, 1, null, 2);
              }));
    } else {
      isGuest = true;
      accessCode = Configs.GUEST_CODE;
      mPresenter.getArticles(accessCode, 1, null, 2);
    }
    print('islogin>>$isLogin And isGuest>>$isGuest');
  }

  Widget loadingIndicator = new Container(
      child: new CircularProgressIndicator(
    strokeWidth: 2.0,
  ));

  _clickFilterButton(BuildContext context) {}

  Widget showArticleList() {
    if (articles.length > 0) {
      return new ArticleLists(articles, this);
    } else {
      return new Container(
        child: Center(child: loadingIndicator),
        height: 100.0,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new Container(
        color: MyStyle.layoutBackground,
        padding: const EdgeInsets.all(10.0),
        child: new Stack(
          children: <Widget>[
            new SingleChildScrollView(
              controller: new ScrollController(),
              scrollDirection: Axis.vertical,
              child: new Container(
                margin: const EdgeInsets.only(top: 30.0),
                child: new Column(
                  children: <Widget>[
                    new CreateFeatureArticles(),
                    showArticleList()
                  ],
                ),
              ),
            ),
            new Align(
              alignment: FractionalOffset.topRight,
              child: new Padding(
                padding: const EdgeInsets.all(10.0),
                child: new Row(
                  children: <Widget>[
                    new Text('Featured'),
                    new Expanded(
                        child: new Row(
                      children: <Widget>[],
                    )),
                    new RaisedButton.icon(
                        color: Colors.white,
                        onPressed: () {
                          Navigator.push(
                              context,
                              new MaterialPageRoute(
                                  builder: (_) =>
                                      new FilterHealthEducationDialogFragment(
                                          this)));
                        },
                        icon: new Icon(
                          Icons.filter_list,
                          color: Colors.grey,
                        ),
                        label: new Text(
                          "FILTER",
                          style:
                              new TextStyle(fontSize: 14.0, color: Colors.grey),
                        ),
                        shape: new RoundedRectangleBorder(
                            borderRadius: new BorderRadius.circular(30.0))),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  @override
  void pagination(Pagination p) {}

  @override
  void removeFeaturedArticles() {}

  @override
  void showFeaturedArticles(List<Article> a) {}

  @override
  void showMoreArticles(List<Article> a) {}

  @override
  void showArticles(List<Article> a) {
    setState(() {
      articles = a;
    });
    print('Article List${a.toString()}');
  }

  @override
  void showFilter() {}

  @override
  void onLoadError() {
    // TODO: implement onLoadError
  }

  @override
  void onChooseFilters(List<int> roleList) {
    print('Filter Health & Education$roleList ');
  }

  @override
  void onArticleShareClick(Article article) {
    print('Article Share Click');
    mPresenter.setShare(accessCode, article.id);
  }

  @override
  void onArticleFavClick(Article article) {
    print('Article Fav Click');
    mPresenter.setFavourite(accessCode, article.id);
  }

  @override
  void onArticleSaveClick(Article article) {
    print('Article Save Click');
    mPresenter.saveArticle(accessCode, article.id);
  }

  @override
  void onArticleCommentClick(Article article) {}
}
