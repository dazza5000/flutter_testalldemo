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
import 'package:lyc_clinic/utils/mySharedPreferences.dart';

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

class CommentPageState extends State<CommentPage> with SingleTickerProviderStateMixin
    implements CommentContract, CommentListener{
  CommentPresenter mPresenter;
  bool isWriting = false;
  List<Review> reviewList = new List<Review>();
  Pagination _pagination;
  String message;
  String accessCode;
  bool isGuest = false;
  bool isLogin = false;
  bool isLoading = true;
  final _textEditingController = new TextEditingController();
  MySharedPreferences mySharedPreferences = new MySharedPreferences();
  AnimationController aniController;

  CommentPageState() {
    mPresenter = new CommentPresenter(this);
    mySharedPreferences
        .getBooleanData(Configs.PREF_USER_LOGIN)
        .then((val) => setState(() {
              isLogin = val != null ? val : false;
            }));
  }

  void _sendClick() {
    print('Messages is $message');
    if (message != null && message.length > 0) {
      if (widget.isArticle) {
        mPresenter.submitArticleComment(accessCode, widget.articleId, message);
      } else {
        mPresenter.submitReview(accessCode, widget.doctorId, message);
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

  @override
  void initState() {
    super.initState();
    aniController = new AnimationController(vsync: this,
        duration:new Duration(microseconds: 500));
        //new Duration(microseconds: 500), vsync: this);

    if (isLogin) {
      isGuest = false;
      mySharedPreferences
          .getStringData(Configs.PREF_USER_ACCESSCODE)
          .then((val) => setState(() {
                accessCode = val;
              }));
    } else {
      isGuest = true;
      accessCode = Configs.GUEST_CODE;
    }
    if (widget.isArticle) {
      mPresenter.getArticleComments(accessCode, widget.articleId);
    } else {
      mPresenter.getComments(accessCode, widget.doctorId);
    }
  }

  showLoadingOrData() {
    if (isLoading) {
      new Center(
        child: new CircularProgressIndicator(
          strokeWidth: 2.0,
        ),
      );
    } else {
      return new Flexible(
        child: new ListView.builder(
          itemBuilder: _buildCommentItem,
          itemCount: reviewList.length,
          scrollDirection: Axis.vertical,
          controller: new ScrollController(),
        ),
      );
    }
  }

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
        body: new Container(
            color: MyStyle.colorWhite,
            child: new Column(children: <Widget>[
              new Container(
                child: showLoadingOrData(),
              ),
              new Opacity(
                opacity: isLogin ? 1.0 : 0.0,
                child: new Divider(
                  height: 2.0,
                  color: MyStyle.colorBlack,
                ),
              ),
              new Opacity(
                  opacity: isLogin ? 1.0 : 0.0,
                  child: new Container(
                      decoration:
                          new BoxDecoration(color: MyStyle.layoutBackground),
                      child: new IconTheme(
                          data: new IconThemeData(
                              color: Theme.of(context).accentColor),
                          child: new Container(
                              margin:
                                  const EdgeInsets.symmetric(horizontal: 8.0),
                              child: new Row(children: <Widget>[
                                new Flexible(
                                    child: new TextField(
                                        style: MyStyle.titleTextStyle(),
                                        controller: _textEditingController,
                                        onSubmitted: _submitMessage,
                                        decoration:
                                            new InputDecoration.collapsed(
                                                hintText: "Comment ေပးရန္"))),
                                new Container(
                                    child: new IconButton(
                                        icon: new Icon(
                                          Icons.send,
                                          color: MyStyle.colorGreen,
                                        ),
                                        onPressed: _sendClick))
                              ])))))
            ])));
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
      isLoading = false;
    });
  }

  @override
  void showComments(List<Review> r) {
    setState(() {
      reviewList.clear();
      reviewList = r;
      isLoading = false;
    });
  }

  @override
  void onCommentEditClick(Review r, int pos) {}

  @override
  void onCommentDeleteClick(Review r, int post) {
    print("Comment Delete");
    mPresenter.deleteArticleComment(accessCode, r.article, r.id);
    setState(() {
      reviewList.removeAt(post);
    });
  }
}
