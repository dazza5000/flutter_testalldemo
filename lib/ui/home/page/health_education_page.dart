import 'package:flutter/material.dart';
import 'package:lyc_clinic/ui/home/page/health_education_page.dart';
import 'package:lyc_clinic/ui/article/widget/create_feature_article_items.dart';
import 'package:lyc_clinic/ui/home/widget/article_lists.dart';
import 'package:lyc_clinic/ui/article/data/article.dart';
import 'package:lyc_clinic/ui/home/page/filter_health_education_dialog_fragment.dart';
import 'package:lyc_clinic/ui/home/presenter/health_education_presenter.dart';
import 'package:lyc_clinic/ui/home/contract/health_education_contract.dart';
import 'package:lyc_clinic/base/data/pagination.dart';
import 'package:lyc_clinic/utils/configs.dart';
import 'package:lyc_clinic/ui/home/widget/create_article_buttons.dart';

class HealthEducationPage extends StatefulWidget {
  @override
  HealthEducationPageState createState() {
    return new HealthEducationPageState();
  }
}

class HealthEducationPageState extends State<HealthEducationPage>
    implements HealthEducationContract, FilterListener,ArticleClickListener{
  HealthEducationPresenter mPresenter;
  List<Article> articles;

  HealthEducationPageState() {
    mPresenter = new HealthEducationPresenter(this);
  }

  @override
  void initState() {
    super.initState();
    mPresenter.getArticles(Configs.GUEST_CODE, 1, null, 2);
  }

  _clickFilterButton(BuildContext context) {}

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new Container(
        child: new SingleChildScrollView(
          controller: new ScrollController(),
          scrollDirection: Axis.vertical,
          child: new Column(
            children: <Widget>[
              new Padding(
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
              new CreateFeatureArticles(),
              new ArticleLists(articles,this)
            ],
          ),
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
    mPresenter.setShare(Configs.TEST_CODE, article.id);
  }

  @override
  void onArticleFavClick(Article article) {
    print('Article Fav Click');
    mPresenter.setFavourite(Configs.TEST_CODE, article.id);
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
