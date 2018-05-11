import 'package:flutter/material.dart';
import 'package:lyc_clinic/ui/article/widget/article_details_item.dart';
import 'package:lyc_clinic/ui/article/widget/video_details_activity.dart';
import 'package:lyc_clinic/test/custom_bottom_navigation_bar.dart';

class ArticleDetailsPage extends StatefulWidget {
  int id;

  ArticleDetailsPage(this.id);

  @override
  ArticleDetailsPageState createState() {
    return new ArticleDetailsPageState();
  }
}

Widget _showArticleAndVideo(int type) {
  if (type == 2) {
    return new VideoDetailsActivity();
  }
  else {
    return new ArticleDetailsItem();
  }
}

class ArticleDetailsPageState extends State<ArticleDetailsPage> {

  _clickBack(BuildContext context) {
    Navigator.of(context).pop();
  }

  void _clickBookmark() {

  }

  void _clickShare() {

  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new SingleChildScrollView(
          controller: new ScrollController(),
          scrollDirection: Axis.vertical,
          child: new Center(
            child: new Column(
              children: <Widget>[
                new Padding(padding: const EdgeInsets.only(top: 20.0),
                  child: new Stack(
                    children: <Widget>[
                      new Image.network(
                          'http://linyaungchi.com/storage/images/article/2018/03/apumi-apuwpaeka-20180326084841.jpg',
                          height: 200.0,
                          fit: BoxFit.cover),
                      new Row(
                        children: <Widget>[
                          new IconButton(
                            icon: new Icon(
                                Icons.arrow_back, color: Colors.white),
                            onPressed: () => _clickBack(context),),
                          new Expanded(child: new Row(children: <Widget>[],)),
                          new IconButton(
                            icon: new Icon(
                                Icons.bookmark_border, color: Colors.white),
                            onPressed: null,),
                          new IconButton(
                            icon: new Icon(Icons.share, color: Colors.white),
                            onPressed: null,)
                        ],
                      ),
                    ],
                  ),
                ),
                _showArticleAndVideo(1)
              ],
            ),
          )
      ),
      floatingActionButton: new FloatingActionButton(
          onPressed: null,
          child: new Icon(
              Icons.favorite_border,
              color: Colors.orangeAccent),

          backgroundColor: Colors.white),
      backgroundColor: Colors.white,
      bottomNavigationBar: new Material(
          child: new CustomBottomNavigationBar()
      ),
    );
  }
}