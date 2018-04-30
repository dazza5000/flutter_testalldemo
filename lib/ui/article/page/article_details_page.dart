import 'package:flutter/material.dart';
import 'package:lyc_clinic/ui/article/widget/article_details_item.dart';

class ArticleDetailsPage extends StatefulWidget {

  @override
  ArticleDetailsPageState createState() {
    return new ArticleDetailsPageState();
  }
}

class ArticleDetailsPageState extends State<ArticleDetailsPage> {

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new Scrollbar(
          child: new Container(
            child: new Column(
              children: <Widget>[
                new Stack(
                  children: <Widget>[

                  ],
                ),

                new ArticleDetailsItem(),
               /* new ListView.builder(
                    itemBuilder: null,
                itemCount: 0,
                scrollDirection: Axis.vertical,)*/

              ],
            ),
          )),
      backgroundColor: Colors.white,

    );
  }
}