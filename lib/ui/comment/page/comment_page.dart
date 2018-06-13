import 'package:flutter/material.dart';
import 'package:lyc_clinic/ui/comment/widget/comment_item_widget.dart';
import 'package:lyc_clinic/ui/comment/data/review.dart';
import 'package:lyc_clinic/ui/comment/data/comment.dart';
import 'package:lyc_clinic/base/data/pagination.dart';
import 'package:lyc_clinic/ui/comment/presenter/comment_presenter.dart';
import 'package:lyc_clinic/ui/comment/contract/comment_contract.dart';
import 'package:lyc_clinic/utils/configs.dart';
import 'package:lyc_clinic/ui/comment/data/review.dart';
import 'package:lyc_clinic/ui/comment/data/reply.dart';
import 'package:lyc_clinic/ui/comment/page/comment_edit_dialog_page.dart';
import 'package:lyc_clinic/base/mystyle.dart';

class CommentPage extends StatefulWidget {
  int articleId;
  bool isArticle;
  int doctorId;

  CommentPage(this.articleId, this.isArticle, this.doctorId);

  @override
  CommentPageState createState() {
    return new CommentPageState();
  }
}

class CommentPageState extends State<CommentPage>
    with TickerProviderStateMixin
    implements CommentContract, CommentListener {
  CommentPresenter mPresenter;
  bool isWriting = false;
  List<Review> reviewList = new List<Review>();
  Pagination _pagination;
  String message;
  final _textEditingController = new TextEditingController();
  AnimationController aniController;

  CommentPageState() {
    mPresenter = new CommentPresenter(this);
  }

  void _sendClick() {
    print('Messages is $message');
    if (message != null && message.length >0) {
      if (widget.isArticle) {
        mPresenter.submitArticleComment(
            Configs.TEST_CODE, widget.articleId, message);
      } else {
        mPresenter.submitReview(Configs.TEST_CODE, widget.doctorId, message);
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

  Widget _buildCommentItem(BuildContext context, int index) {
    Review c = reviewList[index];
    int commentCount = _pagination.total;
    return new CommentItemWidget(c, commentCount, index, aniController, this);
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
                      onSubmitted: _submitMessage,
                      decoration: new InputDecoration.collapsed(
                          hintText: "Comment ေပးရန္"))),
              new Container(
                  child: new IconButton(
                      icon: new Icon(
                        Icons.send,
                        color: MyStyle.colorGreen,
                      ),
                      onPressed: _sendClick))
            ])));
  }

  @override
  void initState() {
    super.initState();
    aniController = new AnimationController(
        duration: new Duration(microseconds: 500), vsync: this);
    if (widget.isArticle) {
      print('Article');
      mPresenter.getArticleComments(Configs.TEST_CODE, widget.articleId);
    } else {
      mPresenter.getComments(Configs.TEST_CODE, widget.doctorId);
    }
  }

  /*@override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: new AppBar(
          backgroundColor: Colors.white,
          title: new Text(
            'Comments',
            style: new TextStyle(color: Colors.black, fontSize: 16.0),
          ),
          leading: new IconButton(
            icon: new Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context, true);
            },
            color: Colors.black,
          ),
        ),
        body: new Column(
            children: <Widget>[
          new Flexible(
            child: new ListView.builder(
              itemBuilder: _buildCommentItem,
              shrinkWrap: true,
              itemCount: reviewList.length,
              scrollDirection: Axis.vertical,
              controller: new ScrollController(),
            ),
          ),
          new Divider(
            height: 2.0,
            color: MyStyle.colorBlack,
          ),
          new Container(
              decoration: new BoxDecoration(color: MyStyle.layoutBackground),
              child: _buildTextComposer())
        ]));

    */ /*new Align(
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
                              contentPadding: const EdgeInsets.only(left: 10.0),
                              hintText: 'Please enter a search term'),
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
              )))*/ /*
  }*/

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          backgroundColor: Colors.white,
          title: new Text(
            'Comments',
            style: new TextStyle(color: Colors.black, fontSize: 16.0),
          ),
          leading: new IconButton(
            icon: new Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context, true);
            },
            color: Colors.black,
          ),
        ),
        body: new Column(children: <Widget>[
          new Flexible(
            child: new ListView.builder(
              itemBuilder: _buildCommentItem,
              itemCount: reviewList.length,
              scrollDirection: Axis.vertical,
              controller: new ScrollController(),
            ),
          ),
          new Divider(
            height: 2.0,
            color: MyStyle.colorBlack,
          ),
          new Container(
              decoration: new BoxDecoration(color: MyStyle.layoutBackground),
              child: _buildTextComposer())
        ]));
  }

  @override
  void insertNewReply(Reply r) {
    print('Insert New Comment Reply${r.toString()}');
  }

  @override
  void insertNewComment(Review r) {
    _textEditingController.clear();
    message = "";
    print('Insert New Comment${r.toString()}');
    setState(() {
      reviewList.add(r);
    });
    aniController.forward();
  }

  @override
  void updateReview(int position, Review review) {
    print('Update Review${review.toString()}');
  }

  @override
  void pagination(Pagination p) {
    setState(() {
      _pagination = p;
    });
  }

  @override
  void showMoreCommensts(List<Review> r) {
    print('Show More Comment${r.toString()}');
    setState(() {
      reviewList.addAll(r);
    });
  }

  @override
  void showComments(List<Review> r) {
    setState(() {
      reviewList.clear();
      reviewList = r;
    });
  }

  @override
  void onCommentEditClick(Review r, int pos) {}

  @override
  void onCommentDeleteClick(Review r, int post) {
    print("Comment Delete");
    mPresenter.deleteArticleComment(Configs.TEST_CODE, r.article, r.id);
    setState(() {
      reviewList.removeAt(post);
    });
  }
}
