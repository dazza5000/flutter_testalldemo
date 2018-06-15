import 'package:flutter/material.dart';
import 'package:lyc_clinic/ui/article/widget/create_article_items.dart';
import 'package:lyc_clinic/ui/home/widget/create_article_buttons.dart';
import 'package:lyc_clinic/ui/article/data/article.dart';
import 'package:lyc_clinic/base/mystyle.dart';

class ArticleLists extends StatelessWidget {
  ArticleLists(this.articles, this.listener);

  final List<Article> articles;
  ArticleClickListener listener;

  Widget _buildArticleList(BuildContext context, int index) {
    var article = articles[index];
    return new Stack(children: <Widget>[
      new Container(
        color: MyStyle.layoutBackground,
        margin: const EdgeInsets.only(top: 15.0, bottom: 15.0),
        child: new Container(
          height: 330.0,
          child: new CreateArticleItems(article),
          decoration: new BoxDecoration(
              shape: BoxShape.rectangle,
              color: MyStyle.colorWhite,
              borderRadius: new BorderRadius.circular(5.0)),
        ),
      ),
      new Positioned(
        child: new CreateArticleButton(article, listener),
        bottom: 0.0,
        right: 10.0,
        left: 20.0,
      ),
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return new Container(
      margin: const EdgeInsets.only(top: 20.0),
      child: new ListView.builder(
          padding: const EdgeInsets.all(0.0),
          itemBuilder: _buildArticleList,
          itemCount: articles.length,
          shrinkWrap: true,
          controller: new ScrollController(),
          scrollDirection: Axis.vertical),
    );
  }
}
