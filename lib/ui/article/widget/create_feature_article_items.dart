import 'package:flutter/material.dart';
import 'package:lyc_clinic/ui/article/widget/dot_indicator.dart';
import 'package:lyc_clinic/ui/home/contract/feature_articles_contract.dart';
import 'package:lyc_clinic/ui/home/presenter/feature_articles_presenter.dart';
import 'package:lyc_clinic/ui/article/data/article.dart';
import 'package:lyc_clinic/utils/configs.dart';
import 'package:lyc_clinic/base/mystyle.dart';
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
  List<Article> featureArticleList = new List<Article>();
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
    return new Container(
      decoration: new BoxDecoration(
        shape: BoxShape.rectangle,
        color: MyStyle.colorWhite,
      ),
      child: new InkWell(
        onTap: () => _goToFeatureArticle(context, article),
        child: new Column(
          children: <Widget>[
            new Container(
                child: new Column(
              crossAxisAlignment: CrossAxisAlignment.start,
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
                new Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: new Text(
                    article.title,
                    textAlign: TextAlign.left,
                    style: new TextStyle(fontSize: MyStyle.xlarge_fontSize),
                  ),
                ),
                new Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: new Text(article.content,
                      textAlign: TextAlign.left,
                      style: new TextStyle(
                          fontSize: MyStyle.medium_fontSize,
                          color: MyStyle.colorGrey),
                      maxLines: 2),
                ),
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

  Widget loadingIndicator = new Container(
      child: new CircularProgressIndicator(
    strokeWidth: 2.0,
  ));

  Widget showFeatureArticle() {
    if (featureArticleList.length > 0) {
      return new Stack(children: <Widget>[
        new PageView.builder(
            physics:new BouncingScrollPhysics(),
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
      ]);
    } else {
      return new Container(
        child: new Center(
          child: loadingIndicator,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return new SizedBox.fromSize(
      size: const Size.fromHeight(350.0),
      child: showFeatureArticle(),
    );
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
