import 'package:flutter/material.dart';
import 'package:lyc_clinic/ui/article/data/article.dart';
import 'package:lyc_clinic/ui/article/page/article_details_page.dart';
import 'package:lyc_clinic/ui/article/page/video_details_page.dart';
import 'package:lyc_clinic/base/mystyle.dart';

class CreateArticleItems extends StatelessWidget {
  CreateArticleItems(this.article);

  final Article article;

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

  void _navigateToArticleDetails(BuildContext context, int type) {
    print('Type >>$type');
    if (type == 1) {
      Navigator.push(
          context,
          new MaterialPageRoute(
              builder: (_) => new ArticleDetailsPage(article.id)));
    } else {
      Navigator.push(
          context,
          new MaterialPageRoute(
              builder: (_) => new VideoDetailsPage(article.id)));
    }
  }

  @override
  Widget build(BuildContext context) {
    return new Container(
      child: new InkWell(
        onTap: () => _navigateToArticleDetails(context, article.type),
        child: new Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            new Stack(
              children: <Widget>[
                new Image.network(
                  article.image,
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
              padding: const EdgeInsets.only(top: 10.0, left: 5.0),
              child: new Text(
                article.title,
                textAlign: TextAlign.left,
                style: new TextStyle(
                  fontSize: MyStyle.xmedium_fontSize,
                  fontWeight: FontWeight.bold,
                ),
                maxLines: 2,
              ),
            ),
            new Padding(
              padding: const EdgeInsets.only(top: 5.0, left: 5.0),
              child: new Text(article.content,
                  textAlign: TextAlign.left,
                  style: new TextStyle(
                      fontSize: MyStyle.medium_fontSize,
                      color: MyStyle.colorGrey),
                  maxLines: 2),
            ),
          ],
        ), /*),*/
      ),
    );
  }
}
