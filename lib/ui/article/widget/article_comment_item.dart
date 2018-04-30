import 'package:flutter/material.dart';

class ArticleCommentItem extends StatefulWidget {

  @override
  ArticleCommentItemState createState() {
    return new ArticleCommentItemState();
  }
}

class ArticleCommentItemState extends State<ArticleCommentItem> {
  _showReplyCountDesc() {

  }

  @override
  Widget build(BuildContext context) {
    return new Container(
      child: new Row(
        children: <Widget>[
          new Image.network(''),
          new Column(
            children: <Widget>[
              new Padding(padding: const EdgeInsets.all(3.0),
                child: new Text('Hnin Nway Nway Hlaing'),),
              new Padding(padding: const EdgeInsets.all(3.0),
                child: new Text('Comment Test'),),
              new Padding(padding: const EdgeInsets.all(5.0), child: new Row(
                children: <Widget>[
                  new Text('22:00 '),
                  new Text('Reply')
                ],
              ),
              ),
            ],
          )
        ],
      ),
    );
  }
}