import 'package:flutter/material.dart';
import 'package:lyc_clinic/ui/article/data/article.dart';
import 'package:lyc_clinic/ui/article/page/article_details_page.dart';

class CreateArticleItems extends StatelessWidget {
  CreateArticleItems(this.article);

  final Article article;

  _hideShowPlayIcon(int type) {
    if (type == 1) {
      return new Center(child: null,);
    }
    else {
      return new Container(
        alignment: FractionalOffset.center,
        child: new Icon(
          Icons.play_circle_filled, color: Colors.white, size: 50.0,),
      );
    }
  }

  void _navigateToArticleDetails(BuildContext context) {
    Navigator.push(context,
        new MaterialPageRoute(builder: (_) => new ArticleDetailsPage(article.id)));
  }

  @override
  Widget build(BuildContext context) {
    return new Container(
      height: 360.0,
      child: new InkWell(
        onTap: () => _navigateToArticleDetails(context),
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
                      new Positioned(child: _hideShowPlayIcon(article.type),
                        bottom: 0.0,
                        left: 0.0,
                        right: 0.0,
                        top: 0.0,)

                    ],
                  ),
                  new Text(article.title,
                    style: new TextStyle(
                        fontSize: 18.0, fontWeight: FontWeight.bold),),
                  new Text(
                    article.content, style: new TextStyle(fontSize: 12.0),
                    maxLines: 2),
                  new Container(
                      child: new Padding(
                          padding: const EdgeInsets.only(top: 20.0))
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }


}