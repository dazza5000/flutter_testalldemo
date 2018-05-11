import 'package:flutter/material.dart';
import 'package:lyc_clinic/ui/comment/model/review.dart';
import 'package:lyc_clinic/ui/comment/model/comment.dart';

class CommentItemWidget extends StatefulWidget{
  Review review;
  int commentCount;

  CommentItemWidget(this.review, this.commentCount);

  @override
  CommentItemWidgetState createState() {
    return new CommentItemWidgetState();
  }
}

class CommentItemWidgetState extends State<CommentItemWidget>{

  Widget _showReplyCountDesc(Review c) {
    if (c.hasReply) {
      return new Text('ပီးခဲ့ေသာ Replies ${c.replyCount}ခုကို ၾကည့္ရန္');
    }
    return null;
  }

  _clickReply(BuildContext context) {

  }

  _moreInfoClick(BuildContext context) {

  }

  @override
  Widget build(BuildContext context) {
    return new Padding(
        padding: const EdgeInsets.all(10.0),
        child: new Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            new CircleAvatar(
              backgroundImage: new NetworkImage(widget.review.image), radius: 20.0,),
            new Padding(
                padding: const EdgeInsets.only(left: 5.0), child: new Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                new Padding(
                  padding: const EdgeInsets.all(3.0),
                  child: new Text(widget.review.username),),
                new Padding(
                  padding: const EdgeInsets.all(3.0),
                  child: new Text(widget.review.mesg),),
                new Padding(
                  padding: const EdgeInsets.all(3.0),
                  child: new Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      new Text('22:00 '),
                      new Padding(
                          padding: const EdgeInsets.only(
                              left: 5.0, right: 5.0),
                          child: new Text('.', style: new TextStyle(
                              fontSize: 18.0,
                              color: Colors.grey,
                              fontWeight: FontWeight.bold))),
                      new GestureDetector(
                        child: new Text('Reply'),
                        onTap: () => _clickReply(context),
                      )
                    ],
                  ),
                ),
                new Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: _showReplyCountDesc(widget.review),
                )
              ],
            )),
            new Expanded(
              child: new Row(children: <Widget>[],),),
            new GestureDetector(
              child: new Icon(Icons.more_horiz, color: Colors.grey,),
              onTap: () => _moreInfoClick(context),
            ),
          ],
        )
    );
  }
}