import 'package:flutter/material.dart';
import 'package:lyc_clinic/ui/comment/data/review.dart';
import 'package:lyc_clinic/ui/comment/data/comment.dart';
import 'package:lyc_clinic/base/data/pagination.dart';
import 'package:lyc_clinic/ui/comment/widget/comment_item_widget.dart';

class CommentItem extends StatefulWidget {
  static final List<Review> review = [new Review(
      47,
      "http://api.linyaungchi.com/storage/images/user/tmpphpdsuolp-20180202061947.jpg",
      903,
      "Hnin Nway Nway Hlaing",
      null,
      2,
      "test comment",
      true,
      false,
      0,
      1517988565,
      7350086),

  new Review(
      39,
      "http://api.linyaungchi.com/storage/images/user/tmpphpdsuolp-20180202061947.jpg",
      903,
      "Hnin Nway Nway Hlaing",
      null,
      2,
      "test comment1",
      true,
      false,
      0,
      1517574565,
      7764086),
  ];

  Comment comment = new Comment(new Pagination(1, 5, 1, 2), review);

  //CommentItem(this.comments);

  @override
  CommentItemState createState() {
    return new CommentItemState();
  }
}

class CommentItemState extends State<CommentItem> {


  List<Widget> widgets;

  Widget _buildCommentItem(BuildContext context, int index) {
    Review c = widget.comment.data[index];
    int commentCount = widget.comment.pagination.total;
    return new CommentItemWidget(c,commentCount);
  }


  Widget _showSeeCommentWidget(int commentCount) {
    if (commentCount > 0) {
      return new Padding(
          padding: const EdgeInsets.only(left: 10.0, right: 10.0),
          child: new Column(
            children: <Widget>[
              new Divider(color: Colors.grey,
                  height: 2.0),
              new Padding(
                padding: const EdgeInsets.all(15.0),
                child: commentCount > 2
                    ? new Text('See all $commentCount comments',
                  style: new TextStyle(color: Colors.black, fontSize: 14.0),)
                    : new Text(""),),
            ],
          ));
    }
    else {
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return new Container(
      //padding: const EdgeInsets.all(0.0),
      color: const Color(0xFFF5F5F5),
      child: new Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          new ListView.builder(
              padding: const EdgeInsets.all(0.0),
              itemBuilder: _buildCommentItem,
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              itemCount: widget.comment.data.length
          ),
          _showSeeCommentWidget(widget.comment.pagination.total),
        ],
      ),
    );
  }
}