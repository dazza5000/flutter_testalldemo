import 'package:flutter/material.dart';
import 'package:lyc_clinic/ui/article/widget/dot_indicator.dart';
import 'package:lyc_clinic/ui/home/contract/feature_articles_contract.dart';
import 'package:lyc_clinic/ui/home/presenter/feature_articles_presenter.dart';
import 'package:lyc_clinic/ui/article/data/article.dart';
import 'package:lyc_clinic/utils/configs.dart';
import 'package:lyc_clinic/ui/article/page/article_details_page.dart';

class CreateFeatureArticles extends StatefulWidget {
  @override
  CreateFeatureArticlesState createState() {
    return new CreateFeatureArticlesState();
  }
}

class CreateFeatureArticlesState extends State<CreateFeatureArticles>
    implements FeatureArticlesContract {
  FeatureArticlesPresenter _mPresenter;
  List<Article> featureArticleList;
  final _controller = new PageController();
  final _kArrowColor = Colors.black.withOpacity(0.8);
  static const _kDuration = const Duration(milliseconds: 300);
  static const _kCurve = Curves.ease;

  CreateFeatureArticlesState() {
    _mPresenter = new FeatureArticlesPresenter(this);
  }

  @override
  void initState() {
    super.initState();
    _mPresenter.getFeatureArticles(Configs.GUEST_CODE);
  }

  _goToFeatureArticle(BuildContext context, Article article) {
    Navigator.push(
        context,
        new MaterialPageRoute(
            builder: (_) => new ArticleDetailsPage(
                  article.id,
                  isFeature: true,
                )));
  }

  Widget _createFeatureArticleItem(Article article) {
    return new ConstrainedBox(
      constraints: const BoxConstraints.expand(),
      child: new InkWell(
        onTap: () => _goToFeatureArticle(context, article),
        child: new Column(
          children: <Widget>[
            new Card(
                child: new Column(
              children: <Widget>[
                new Stack(
                  children: <Widget>[
                    new Image.network(
                      article.image,
                      height: 200.0,
                      fit: BoxFit.fill,
                    ),
                    new Positioned(
                      child: _hideShowPlayIcon(article.type),
                      bottom: 0.0,
                      left: 0.0,
                      right: 0.0,
                      top: 0.0,
                    )
                  ],
                ),
                new Text(
                  article.title,
                  style: new TextStyle(
                      fontSize: 18.0, fontWeight: FontWeight.bold),
                ),
                new Text(article.content,
                    style: new TextStyle(fontSize: 12.0), maxLines: 2),
              ],
            )),
          ],
        ),
      ),
    );
  }

  _hideShowPlayIcon(int type) {
    if (type == 1) {
      return new Center(
        child: null,
      );
    } else {
      return new Container(
        alignment: FractionalOffset.center,
        child: new Icon(
          Icons.play_circle_filled,
          color: Colors.white,
          size: 50.0,
        ),
      );
    }
  }

  Widget _buildFeatureArticle(BuildContext context, int index) {
    Article featureArticle = featureArticleList[index];
    return _createFeatureArticleItem(featureArticle);
  }

  @override
  Widget build(BuildContext context) {
    return new SizedBox.fromSize(
        size: const Size.fromHeight(300.0),
        child: new Stack(children: <Widget>[
          new PageView.builder(
              physics: new AlwaysScrollableScrollPhysics(),
              controller: _controller,
              itemBuilder: _buildFeatureArticle),
          new Positioned(
            bottom: 0.0,
            left: 0.0,
            right: 0.0,
            child: new Container(
              padding: const EdgeInsets.all(20.0),
              child: new Center(
                child: new DotsIndicator(
                    controller: _controller,
                    itemCount: featureArticleList.length,
                    onPageSelected: (int page) {
                      _controller.animateToPage(
                        page,
                        duration: _kDuration,
                        curve: _kCurve,
                      );
                    }),
              ),
            ),
          ),
        ]));
  }

  @override
  void removeFeaturedArticle() {}

  @override
  void showFeaturedArticle(List<Article> a) {
    setState(() {
      featureArticleList = a;
    });
    print('Feature Article Data $featureArticleList');
  }

  @override
  void onLoadError() {}
}
