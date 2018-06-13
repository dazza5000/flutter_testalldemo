import 'package:flutter/material.dart';
import 'package:lyc_clinic/ui/doctors/widget/create_doctor_buttons.dart';
import 'package:lyc_clinic/ui/comment/page/comment_page.dart';
import 'package:lyc_clinic/base/mystyle.dart';
import 'package:lyc_clinic/test/test_page.dart';
import 'package:lyc_clinic/ui/comment/data/comment.dart';
import 'package:lyc_clinic/ui/comment/data/review.dart';
import 'package:lyc_clinic/ui/comment/widget/comment_item_widget.dart';

class ReviewListItem extends StatefulWidget {
  Comment comment;
  int doctorId;
  bool isArticle;
  AnimationController aniController;

  ReviewListItem(this.comment, this.doctorId, this.isArticle);

  @override
  ReviewListItemState createState() {
    return new ReviewListItemState();
  }
}

class ReviewListItemState extends State<ReviewListItem>
    with TickerProviderStateMixin {
  int reviewCount = 0;
  List<Review> reviewList = new List<Review>();
  AnimationController aniController;

  @override
  void initState() {
    super.initState();
    aniController = new AnimationController(
        duration: new Duration(microseconds: 500), vsync: this);
    reviewCount = widget.comment.pagination.total;
    reviewList = widget.comment.data;
  }

  _clickReview(BuildContext context) {
    Navigator.push(
        context,
        new MaterialPageRoute(
            builder: (_) =>
                new CommentPage(null, widget.isArticle, widget.doctorId)));
  }

  _clickCommentCount(BuildContext context) {
    Navigator.push(
        context,
        new MaterialPageRoute(
            builder: (_) =>
                new CommentPage(null, widget.isArticle, widget.doctorId)));
  }

  Widget _getFloatButton(IconData ic, Color bgColor, Color icColor) {
    return new Container(
      width: 40.0,
      height: 40.0,
      decoration:
          new BoxDecoration(shape: BoxShape.circle, color: bgColor, boxShadow: [
        new BoxShadow(
            color: MyStyle.defaultGrey,
            blurRadius: 4.0,
            offset: new Offset(1.0, 4.0)),
      ]),
      child: new Icon(
        ic,
        color: icColor,
      ),
    );
  }

  Widget _roundButton(BuildContext context) {
    return new RaisedButton(
        color: MyStyle.colorGrey,
        onPressed: () => _clickReview(context),
        child: new Text(
          "Review ေပးရန္",
          style: new TextStyle(fontSize: 14.0, color: MyStyle.colorWhite),
        ),
        shape: new RoundedRectangleBorder(
            borderRadius: new BorderRadius.circular(30.0)));
  }

  Widget _buildReviewItem(BuildContext context, int index) {
    Review c = reviewList[index];
    return new CommentItemWidget(c, reviewCount, index, aniController);
  }

  Widget _showSeeCommentWidget(int commentCount) {
    if (commentCount > 0) {
      return new InkWell(
        onTap: () => _clickCommentCount(context),
        child: new Padding(
          padding: const EdgeInsets.all(5.0),
          child: commentCount > 2
              ? new Text(
                  'See all $commentCount comments',
                  style: new TextStyle(color: Colors.black, fontSize: 14.0),
                )
              : new Text(""),
        ),
      );
    } else {
      return null;
    }
  }

  Widget _showSeeCommentItems() {
    if (widget.comment.data.length > 0) {
      return new Padding(
        padding: const EdgeInsets.only(top: 30.0),
        child: new Card(
          child: new Column(
            children: <Widget>[
              new ListView.builder(
                  padding: const EdgeInsets.only(top: 20.0),
                  itemBuilder: _buildReviewItem,
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  itemCount: reviewCount > 3 ? 3 : reviewList.length,
                  controller: new ScrollController()),
              new Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 5.0, horizontal: 5.0),
                child: new Divider(
                  color: MyStyle.colorBlack,
                  height: 2.0,
                ),
              ),
              _showSeeCommentWidget(reviewCount),
            ],
          ),
        ),
      );
    } else {
      return new Padding(
          padding: const EdgeInsets.only(top: 30.0),
          child: new Card(
              child: new Column(
            children: <Widget>[
              new SizedBox.fromSize(
                child: null,
                size: new Size.fromHeight(50.0),
              )
            ],
          )));
    }
  }

  @override
  Widget build(BuildContext context) {
    return new Container(
      margin: const EdgeInsets.only(top: 15.0),
      child: new Stack(
        children: <Widget>[
          _showSeeCommentItems(),
          new Align(
              alignment: FractionalOffset.topLeft,
              child: new Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5.0),
                child: new Row(
                  children: <Widget>[
                    new InkWell(
                      child: new Padding(
                        padding: const EdgeInsets.only(
                            top: 10.0, left: 10.0, right: 0.0),
                        child: _getFloatButton(Icons.rate_review, Colors.white,
                            MyStyle.defaultGrey),
                      ),
                      onTap: () => _clickReview(context),
                    ),
                    new Expanded(
                        child: new Row(
                      children: <Widget>[],
                    )),
                    _roundButton(context)
                  ],
                ),
              ))
        ],
      ),
    );
  }
}
