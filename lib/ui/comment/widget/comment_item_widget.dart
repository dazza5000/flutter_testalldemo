import 'package:flutter/material.dart';
import 'package:lyc_clinic/ui/comment/data/review.dart';
import 'package:lyc_clinic/ui/otheruser/page/other_user_page.dart';
import 'package:lyc_clinic/ui/comment/page/comment_edit_dialog_page.dart';
import 'package:lyc_clinic/ui/comment/page/comment_reply_dialog_page.dart';
import 'package:lyc_clinic/base/mystyle.dart';
import 'package:lyc_clinic/ui/utils/time_utils.dart';

enum popupValue { Edit, Delete }

class CommentItemWidget extends StatefulWidget {
  Review review;
  int commentCount;
  int pos;
  CommentListener listener;
  AnimationController animationController;

  CommentItemWidget(
      this.review, this.commentCount, this.pos, this.animationController,
      [this.listener]);

  @override
  CommentItemWidgetState createState() {
    return new CommentItemWidgetState();
  }
}

class CommentItemWidgetState extends State<CommentItemWidget>
    implements OnCommentUpdateListener {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  String timeStr;

  Widget _showReplyCountDesc(Review c) {
    if (c.hasReply) {
      return new Text('ပီးခဲ့ေသာ Replies ${c.replyCount}ခုကို ၾကည့္ရန္',
          style: MyStyle.pastRepliesDescStyle());
    }
    return null;
  }

  _clickReply(BuildContext context) {
    Navigator.push(
        context,
        new MaterialPageRoute(
            builder: (_) =>
                new CommentReplyDialogPage(widget.review, timeStr)));
  }

  _moreInfoClick(BuildContext context) {}

  _goToOtherUserPage(BuildContext context) {
    Navigator.push(
        context,
        new MaterialPageRoute(
            builder: (_) => new OtherUserPage(widget.review.user)));
  }

  _goToReplyPage(BuildContext context) {
    Navigator.push(
        context,
        new MaterialPageRoute(
            builder: (_) =>
                new CommentReplyDialogPage(widget.review, timeStr)));
  }

  _buildMenuItem(IconData icon, String label, popupValue val) {
    return new PopupMenuItem<popupValue>(
      child: new Row(
        children: <Widget>[
          new Padding(
              padding: const EdgeInsets.only(right: 24.0),
              child: new Icon(icon, color: Colors.black54)),
          new Text(label),
        ],
      ),
      value: val,
    );
  }

  Widget _showPopupMenu() {
    if (widget.review.canDelete) {
      return new PopupMenuButton<popupValue>(
        icon: new Icon(
          Icons.more_horiz,
          color: Colors.grey,
        ),
        itemBuilder: (BuildContext context) => <PopupMenuItem<popupValue>>[
              _buildMenuItem(Icons.edit, "Edit", popupValue.Edit),
              _buildMenuItem(Icons.delete, "Delete", popupValue.Delete)
            ],
        onSelected: (popupValue value) {
          if (value == popupValue.Edit) {
            Navigator.push(
                context,
                new MaterialPageRoute(
                    builder: (_) => new CommentEditDialogPage(
                          this,
                          mReview: widget.review,
                        )));
          } else {
            widget.listener.onCommentDeleteClick(widget.review, widget.pos);
          }
        },
      );
    } else {
      return new Container(
        child: null,
      );
    }
  }

  @override
  void initState() {
    super.initState();
    timeStr = (widget.review.timeAgo > 86400)
        ? TimeUtils.getDate(widget.review.createDate)
        : TimeUtils.getTime(widget.review.timeAgo);
  }

  @override
  Widget build(BuildContext context) {
    return new InkWell(
        onTap: () => _goToReplyPage(context),
        child: new Padding(
            padding: const EdgeInsets.all(10.0),
            child: new Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                new InkWell(
                  child: new CircleAvatar(
                    backgroundImage: new NetworkImage(widget.review.image),
                    radius: 20.0,
                  ),
                  onTap: () => _goToOtherUserPage(context),
                ),
                new Padding(
                    padding: const EdgeInsets.only(left: 5.0),
                    child: new Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        new InkWell(
                          child: new Padding(
                            padding: const EdgeInsets.all(3.0),
                            child: new Text(widget.review.username),
                          ),
                          onTap: () => _goToOtherUserPage(context),
                        ),
                        new Padding(
                          padding: const EdgeInsets.all(3.0),
                          child: new Text(widget.review.mesg),
                        ),
                        new Padding(
                          padding: const EdgeInsets.all(3.0),
                          child: new Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[
                              new Text(timeStr),
                              new Padding(
                                  padding: const EdgeInsets.only(
                                      left: 5.0, right: 5.0),
                                  child: new Text('.',
                                      style: new TextStyle(
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
                        new InkWell(
                            onTap: () => _clickReply(context),
                            child: new Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: _showReplyCountDesc(widget.review),
                            ))
                      ],
                    )),
                new Expanded(
                  child: new Row(
                    children: <Widget>[],
                  ),
                ),
                _showPopupMenu()
              ],
            )));
  }

  @override
  void onSuccess(String comment) {
    print('ON SUCCESS ITEM WIDGET$comment');
    setState(() {
      widget.review.mesg = comment;
    });
  }
}

abstract class CommentListener {
  void onCommentDeleteClick(Review r, int post);

  void onCommentEditClick(Review r, int pos);
}
