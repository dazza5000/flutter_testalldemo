import 'package:flutter/material.dart';
import 'package:lyc_clinic/ui/comment/data/reply.dart';
import 'package:lyc_clinic/ui/comment/data/review.dart';
import 'package:lyc_clinic/ui/otheruser/page/other_user_page.dart';
import 'package:lyc_clinic/utils/configs.dart';
import 'package:lyc_clinic/ui/comment/page/comment_edit_dialog_page.dart';
import 'package:lyc_clinic/ui/utils/time_utils.dart';

enum popupValue { Edit, Delete }

class CommentReplyItemWidget extends StatefulWidget {
  Reply reply;
  int pos;
  Review mReview;

  CommentReplyListener replyListener;

  CommentReplyItemWidget(this.reply, this.pos, this.mReview,
      [this.replyListener]);

  @override
  CommentReplyItemWidgetState createState() {
    return new CommentReplyItemWidgetState();
  }
}

class CommentReplyItemWidgetState extends State<CommentReplyItemWidget>
    implements OnCommentUpdateListener {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  int mReplyId;
  String userName;
  TextSpan span;
  String timeStr;

  Widget _getSpannableString(BuildContext context, String spanVal) {
    TextSpan span =
        new TextSpan(style: new TextStyle(color: Colors.cyan), text: spanVal);
    return new RichText(
      text: new TextSpan(
        style: new TextStyle(
          fontSize: 14.0,
          color: Colors.black,
        ),
        children: <TextSpan>[
          new TextSpan(text: spanVal),
        ],
      ),
    );
  }

  Widget _showPopupMenu() {
    print('Widget${widget.reply}');
    if (widget.reply.canDelete) {
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
                          mReply: widget.reply,
                          mArticleId: widget.mReview.article,
                          mDoctorId: widget.mReview.doctor,
                          mReviewId: widget.mReview.id,
                        )));
          } else {
            widget.replyListener
                .onCommentReplyDeleteClick(widget.reply, widget.pos);
          }
        },
      );
    } else {
      return new Container(
        child: null,
      );
    }
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

  _clickReply(BuildContext context, String spanVal) {
    mReplyId = widget.reply.id;
    if (widget.reply.username == null)
      userName = Configs.ADMIN_NAME;
    else
      userName = widget.reply.username;

    span =
        new TextSpan(style: new TextStyle(color: Colors.cyan), text: spanVal);
    setState(() {});
  }

  _moreInfoClick(BuildContext context) {}

  _goToOtherUserPage(BuildContext context) {
    Navigator.push(
        context,
        new MaterialPageRoute(
            builder: (_) => new OtherUserPage(widget.reply.user)));
  }

  @override
  void initState() {
    super.initState();
    timeStr = (widget.reply.timeAgo > 86400)
        ? TimeUtils.getDate(widget.reply.createDate)
        : TimeUtils.getTime(widget.reply.timeAgo);
  }

  @override
  Widget build(BuildContext context) {
    return new Container(
        margin: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 0.0),
        child: new Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            new InkWell(
              child: new CircleAvatar(
                backgroundImage: new NetworkImage(widget.reply.image),
                radius: 20.0,
              ),
              onTap: () => _goToOtherUserPage(context),
            ),
            new Container(
                padding: const EdgeInsets.only(left: 5.0),
                child: new Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    new InkWell(
                      child: new Padding(
                        padding: const EdgeInsets.all(3.0),
                        child: new Text(widget.reply.username),
                      ),
                      onTap: () => _goToOtherUserPage(context),
                    ),
                    new Text(
                      widget.reply.mesg,
                      maxLines: 5,
                    ),
                    new Padding(
                      padding: const EdgeInsets.all(3.0),
                      child: new Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          new Text(timeStr),
                          new Padding(
                              padding:
                                  const EdgeInsets.only(left: 5.0, right: 5.0),
                              child: new Text('.',
                                  style: new TextStyle(
                                      fontSize: 18.0,
                                      color: Colors.grey,
                                      fontWeight: FontWeight.bold))),
                          new GestureDetector(
                            child: new Text('Reply'),
                            onTap: () =>
                                _clickReply(context, 'Hnin Nway Nway Hlaing'),
                          )
                        ],
                      ),
                    ),
                  ],
                )),
            new Expanded(
              child: new Row(
                children: <Widget>[],
              ),
            ),
            _showPopupMenu()
          ],
        ));
  }

  @override
  void onSuccess(String comment) {
    print('SUCCESS Reply Update');
    setState(() {
      widget.reply.mesg=comment;
    });
  }
}

abstract class CommentReplyListener {
  void onCommentReplyDeleteClick(Reply r, int post);

  void onCommentReplyEditClick(Reply r, int pos);
}
