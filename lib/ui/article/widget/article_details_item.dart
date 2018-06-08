import 'package:flutter/material.dart';
import 'package:lyc_clinic/base/mystyle.dart';

import 'package:lyc_clinic/ui/article/data/article.dart';
import 'package:lyc_clinic/ui/comment/data/comment.dart';
import 'package:html2md/html2md.dart' as html2md;
import 'package:flutter_markdown/flutter_markdown.dart';

class ArticleDetailsItem extends StatefulWidget {
  Article article;
  Comment comment;
  String html =
      '<h1>This is heading 1</h1> <h2>This is heading 2</h2><h3>This is heading 3</h3><h4>This is heading 4</h4><h5>This is heading 5</h5><h6>This is heading 6</h6>';

  ArticleDetailsItem(this.article, this.comment);

  @override
  ArticleDetailsItemState createState() {
    return new ArticleDetailsItemState();
  }
}

class ArticleDetailsItemState extends State<ArticleDetailsItem> {


  /*Widget _createArticleDetailsWidgets() {
    return new Container(
      child: new Column(children: <Widget>[
        new Expanded(
          child: new Markdown(
            data: html2md.convert(widget.html),
          ),
        ),
        new Container(
          color: MyStyle.layoutBackground,
          child: new CommentItem(widget.comment, widget.article.id, true),
        )
        *//*new Container(
           color: MyStyle.colorWhite,
           child:  new Markdown(
             data: html2md.convert(widget.html),
           ),
         )*//*
      ]),
      *//*new Positioned(
          child: _floatingBar(),
          bottom: 20.0,
          left: 5.0,
          right: 5.0,
        )*//*
    );
  }*/

  @override
  Widget build(BuildContext context) {
    return new Center(
      child: new Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          new MarkdownBody(
            data: html2md.convert(widget.article.content),
          ),
          new Container(
              color: MyStyle.colorWhite,
              child: new SizedBox.fromSize(
                size: new Size.fromHeight(20.0),
                child: null,
              )),
        ],
      ),
    );
  }
}
