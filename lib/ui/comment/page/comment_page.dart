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

class CommentPageState extends State<CommentPage> implements CommentContract {
  CommentPresenter mPresenter;
  TextEditingController _textController = new TextEditingController();
  bool isWriting = false;
  List<Review> reviewList = new List<Review>();
  Pagination _pagination;

  CommentPageState() {
    mPresenter = new CommentPresenter(this);
  }

  _sendClick() {}

  void _submitMessage(String text) {
    _textController.clear();
    setState(() {
      isWriting = false;
    });
  }

  Widget _buildCommentItem(BuildContext context, int index) {
    Review c = reviewList[index];
    int commentCount = _pagination.total;
    return new CommentItemWidget(c, commentCount);
  }

  @override
  void initState() {
    super.initState();
    if (widget.isArticle) {
      print('Article');
      mPresenter.getArticleComments(Configs.TEST_CODE, widget.articleId);
    } else {
      mPresenter.getComments(Configs.TEST_CODE, widget.doctorId);
    }
  }

  @override
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
        body: new Container(
            child: new Stack(children: <Widget>[
          new Center(
              child: new Column(children: <Widget>[
            new ListView.builder(
              itemBuilder: _buildCommentItem,
              shrinkWrap: true,
              itemCount: reviewList.length,
              scrollDirection: Axis.vertical,
              controller: new ScrollController(),
            ),
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
              )))
        ])));
  }

  @override
  void insertNewReply(Reply r) {}

  @override
  void insertNewComment(Review r) {}

  @override
  void updateReview(int position, Review review) {}

  @override
  void pagination(Pagination p) {
    setState(() {
      _pagination = p;
    });
  }

  @override
  void showMoreCommensts(List<Review> r) {}

  @override
  void showComments(List<Review> r) {
    setState(() {
      reviewList.clear();
      reviewList = r;
    });
  }
}
