import 'package:flutter/material.dart';
import 'package:lyc_clinic/base/mystyle.dart';
import 'package:lyc_clinic/ui/comment/data/comment_reply.dart';
import 'package:lyc_clinic/base/data/pagination.dart';
import 'package:lyc_clinic/ui/comment/data/reply.dart';
import 'package:lyc_clinic/ui/comment/widget/comment_reply_item_widget.dart';
import 'package:lyc_clinic/ui/comment/data/review.dart';
import 'package:lyc_clinic/ui/otheruser/page/other_user_page.dart';
import 'package:lyc_clinic/ui/comment/contract/comment_reply_contract.dart';
import 'package:lyc_clinic/ui/comment/presenter/comment_reply_presenter.dart';
import 'package:lyc_clinic/utils/configs.dart';

class CommentReplyDialogPage extends StatefulWidget {
  Review review;
  String headerTime;

  CommentReplyDialogPage(this.review,this.headerTime);

  @override
  CommentReplyDialogPageState createState() {
    return new CommentReplyDialogPageState();
  }
}

class CommentReplyDialogPageState extends State<CommentReplyDialogPage>
    implements CommentReplyContract, CommentReplyListener {
  final _textEditingController = new TextEditingController();
  CommentReplyPresenter mPresenter;
  bool isWriting = false;
  int mReplyId = 0;
  String message;
  List<Reply> replyList = new List<Reply>();

  CommentReplyDialogPageState() {
    mPresenter = new CommentReplyPresenter(this);
  }

  _sendReplyClick() {
    if (message != null && message.length > 0) {
      if (widget.review.doctor != null) {
        print('Doctor Reply Messages is $message');
        mPresenter.submitReply(Configs.TEST_CODE, widget.review.doctor,
            widget.review.id, message, mReplyId);
      } else {
        print('ArticleReply Messages is ${message} Article Id${widget.review.article}');
        mPresenter.submitArticleReply(Configs.TEST_CODE, widget.review.article,
            widget.review.id, message, mReplyId);
      }
    } else {}
  }

  void _submitMessage(String text) {
    setState(() {
      isWriting = false;
      message = text;
    });
    print(message);
  }

  Widget _buildReplyItem(BuildContext context, int index) {
    Reply reply = replyList[index];
    return new CommentReplyItemWidget(reply, index,widget.review, this);
  }

  Widget _getReplyHeader(Review review) {
    return new Padding(
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
              onTap: () => _goToOtherUserActivity(context),
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
                      onTap: () => _goToOtherUserActivity(context),
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
                          new Text(widget.headerTime),
                          new Padding(
                              padding:
                                  const EdgeInsets.only(left: 5.0, right: 5.0),
                              child: new Text('.',
                                  style: new TextStyle(
                                      fontSize: 18.0,
                                      color: Colors.grey,
                                      fontWeight: FontWeight.bold))),
                        ],
                      ),
                    ),
                  ],
                )),
          ],
        ));
  }

  Widget _buildTextComposer() {
    return new IconTheme(
        data: new IconThemeData(color: Theme.of(context).accentColor),
        child: new Container(
            margin: const EdgeInsets.symmetric(horizontal: 8.0),
            child: new Row(children: <Widget>[
              new Flexible(
                  child: new TextField(
                      style: MyStyle.captionTextStyle(),
                      controller: _textEditingController,
                      onChanged: _submitMessage,
                      onSubmitted: _submitMessage,
                      decoration: new InputDecoration.collapsed(
                          hintText: "Comment ေပးရန္"))),
              new Container(
                  child: new IconButton(
                      icon: new Icon(
                        Icons.send,
                        color: MyStyle.colorGreen,
                      ),
                      onPressed: _sendReplyClick))
            ])));
  }

  _goToOtherUserActivity(BuildContext context) {
    Navigator.push(
        context,
        new MaterialPageRoute(
            builder: (_) => new OtherUserPage(widget.review.user)));
  }

  @override
  void initState() {
    super.initState();
    if (widget.review.article != null) {
      print('Article');
      mPresenter.getArticleCommentReply(
          Configs.TEST_CODE, widget.review.article, widget.review.id);
    } else {
      mPresenter.getCommentReply(
          Configs.TEST_CODE, widget.review.doctor, widget.review.id);
    }
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          backgroundColor: MyStyle.colorWhite,
          leading: new IconButton(
              icon: new Icon(Icons.clear, color: MyStyle.colorBlack),
              onPressed: () => Navigator.pop(context)),
          centerTitle: true,
          title: new Text(
            'Replies',
            style: new TextStyle(
                color: MyStyle.colorBlack, fontSize: MyStyle.xmedium_fontSize),
          ),
        ),
        body: new Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              _getReplyHeader(widget.review),
              new Flexible(
                child: new ListView.builder(
                  padding: const EdgeInsets.only(left: 25.0),
                  itemBuilder: _buildReplyItem,
                  itemCount: replyList.length,
                  scrollDirection: Axis.vertical,
                  controller: new ScrollController(),
                ),
              ),
              new Divider(
                height: 2.0,
                color: MyStyle.colorBlack,
              ),
              new Container(
                  decoration:
                      new BoxDecoration(color: MyStyle.layoutBackground),
                  child: _buildTextComposer())
            ]));
  }

  @override
  void showCommentHeader(Review r, String dateTime) {}

  @override
  void updateCommentReply(int position, Reply commentReply) {
    print('Update Comment Reply');
  }

  @override
  void insertNewComment(Reply r) {
    _textEditingController.clear();
    message = "";
    print('Insert New Comment${r.toString()}');
    setState(() {
      replyList.add(r);
    });
    //aniController.forward();
  }

  @override
  void pagination(Pagination p) {}

  @override
  void showMoreReplies(List<Reply> replies) {}

  @override
  void showReplies(List<Reply> replies) {
    setState(() {
      replyList = replies;
    });
  }

  @override
  void onCommentReplyEditClick(Reply r, int pos) {
    print('Comment Reply Edit');
  }

  @override
  void onCommentReplyDeleteClick(Reply r, int post) {
    print('Comment Reply Delete');
  }
}
