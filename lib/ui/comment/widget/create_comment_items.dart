import 'package:flutter/material.dart';
import 'package:lyc_clinic/ui/comment/data/review.dart';
import 'package:lyc_clinic/ui/comment/data/comment.dart';
import 'package:lyc_clinic/base/data/pagination.dart';
import 'package:lyc_clinic/ui/comment/page/comment_page.dart';
import 'package:lyc_clinic/ui/comment/widget/comment_item_widget.dart';
import 'package:lyc_clinic/base/mystyle.dart';

class CommentItem extends StatefulWidget {
  Comment comment;
  int articleId;
  bool isArticle;

  CommentItem(this.comment, this.articleId, this.isArticle);

  @override
  CommentItemState createState() {
    return new CommentItemState();
  }
}

class CommentItemState extends State<CommentItem> with SingleTickerProviderStateMixin{
  List<Review> reviewList;
  AnimationController aniController;
  @override
  void initState() {
    super.initState();
    aniController = new AnimationController(vsync: this,
        duration: new Duration(microseconds: 500));
    reviewList = widget.comment.data;
  }

  List<Widget> widgets;

  Widget _buildCommentItem(BuildContext context, int index) {
    Review c = reviewList[index];
    int commentCount = widget.comment.pagination.total;
    return new CommentItemWidget(c, commentCount,index,aniController);
  }

  _clickCommentCount(BuildContext context) {
    Navigator.push(
        context,
        new MaterialPageRoute(
            builder: (_) =>
                new CommentPage(widget.articleId, widget.isArticle, null)));
  }

  Widget _showSeeCommentWidget(int commentCount) {
    if (commentCount > 0) {
      return new Padding(
          padding: const EdgeInsets.only(left: 10.0, right: 10.0),
          child: new Column(
            children: <Widget>[
              new Divider(color: Colors.grey, height: 2.0),
              new InkWell(
                onTap: () => _clickCommentCount(context),
                child: new Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: commentCount > 2
                      ? new Text(
                          'See all $commentCount comments',
                          style: new TextStyle(
                              color: Colors.black, fontSize: 14.0),
                        )
                      : new Text(""),
                ),
              )
            ],
          ));
    } else {
      return null;
    }
  }

  Widget _loadNDataError() {
    if (widget.comment.data.length > 0) {
      return new Container(
        //padding: const EdgeInsets.all(0.0),
        color: MyStyle.layoutBackground,
        child: new Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            new ListView.builder(
                padding: const EdgeInsets.only(top: 20.0, bottom: 0.0),
                itemBuilder: _buildCommentItem,
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                itemCount: widget.comment.data.length > 2
                    ? 2
                    : widget.comment.data.length),
            _showSeeCommentWidget(widget.comment.pagination.total),
          ],
        ),
      );
    } else {
      return new Container(
        color: MyStyle.colorWhite,
        child: new SizedBox.fromSize(
          size: new Size.fromHeight(50.0),
          child: null,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return new Container(child: _loadNDataError());
  }
}
