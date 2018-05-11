import 'package:flutter/material.dart';
import 'package:lyc_clinic/ui/article/widget/create_article_items.dart';
import 'package:lyc_clinic/ui/home/widget/create_buttons.dart';
import 'package:lyc_clinic/ui/article/model/article.dart';

class ArticleLists extends StatelessWidget {
  ArticleLists(this.articles);

  final List<Article> articles;


  Widget _buildArticleList(BuildContext context, int index) {
    var article = articles[index];
    return new Stack(
      children: <Widget>[
        new CreateArticleItems(article),
        new Positioned(
          child: new CreateButton(),
          bottom: 20.0,
          right: 10.0,
          top: 0.0,
          left: 20.0,
        ),

      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return new Container(
      child: new Padding(
        padding: new EdgeInsets.only(top: 20.0),
        child: new ListView.builder(
            itemBuilder: _buildArticleList,
            itemCount: articles.length,
            shrinkWrap: true,
            controller: new ScrollController(),
            scrollDirection: Axis.vertical
        ),
      ),
    );
  }

}