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

  CommentReplyDialogPage(this.review);

  /*CommentReply commentReply = new CommentReply(
      new Pagination(1, 1, 1, 1), [
    new Reply(
        84,
        "http://api.linyaungchi.com/storage/images/user/tmpphpdsuolp-20180202061947.jpg",
        903,
        "Hnin Nway Nway Hlaing",
        "reply test reply test reply test ",
        null,
        null,
        null,
        null,
        null,
        36,
        0,
        "",
        true,
        1526891898,
        58),

    new Reply(
        84,
        "http://api.linyaungchi.com/storage/images/user/tmpphpdsuolp-20180202061947.jpg",
        903,
        "Aye Aye",
        "reply test reply test One ",
        null,
        null,
        null,
        null,
        null,
        36,
        0,
        "",
        true,
        1526891898,
        58)
  ]);*/

  @override
  CommentReplyDialogPageState createState() {
    return new CommentReplyDialogPageState();
  }
}

class CommentReplyDialogPageState extends State<CommentReplyDialogPage>
    implements CommentReplyContract {
  TextEditingController _textController = new TextEditingController();
  CommentReplyPresenter mPresenter;
  bool isWriting = false;
  List<Reply> replyList = new List<Reply>();

  CommentReplyDialogPageState() {
    mPresenter = new CommentReplyPresenter(this);
  }

  _sendClick() {}

  void _submitMessage(String text) {
    _textController.clear();
    setState(() {
      isWriting = false;
    });
  }

  Widget _buildReplyItem(BuildContext context, int index) {
    Reply reply = replyList[index];
    return new CommentReplyItemWidget(reply);
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
                          new Text('22:00 '),
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
        body: new Container(
            color: MyStyle.colorWhite,
            child: new Stack(children: <Widget>[
              new Center(
                  child: new Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                    _getReplyHeader(widget.review),
                    new Container(
                      margin: const EdgeInsets.only(left: 50.0),
                      child: new ListView.builder(
                        itemBuilder: _buildReplyItem,
                        shrinkWrap: true,
                        itemCount: replyList.length,
                        scrollDirection: Axis.vertical,
                        controller: new ScrollController(),
                      ),
                    )
                  ])),
              new Align(
                  alignment: FractionalOffset.bottomCenter,
                  child: new Container(
                      child: new Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      new Divider(
                        height: 2.0,
                        color: Colors.black,
                      ),
                      new Row(
                        children: <Widget>[
                          new Expanded(
                            child: new TextField(
                              controller: _textController,
                              onChanged: (String text) {
                                setState(() {});
                              },
                              onSubmitted: _submitMessage,
                              decoration: new InputDecoration(
                                  border: InputBorder.none,
                                  contentPadding:
                                      const EdgeInsets.only(left: 10.0),
                                  hintText: 'Comment ေပးရန္'),
                            ),
                          ),
                          new IconButton(
                            icon: new Icon(Icons.send),
                            onPressed: _sendClick,
                            color: Colors.green,
                          )
                        ],
                      ),
                    ],
                  )))
            ])));
  }

  @override
  void showCommentHeader(Review r, String dateTime) {}

  @override
  void updateCommentReply(int position, Reply commentReply) {}

  @override
  void insertNewComment(Reply r) {}

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
}
