import 'dart:async';

import 'package:flutter/material.dart';
import 'package:lyc_clinic/ui/article/widget/article_details_item.dart';
import 'package:lyc_clinic/ui/comment/page/comment_page.dart';

//import 'package:lyc_clinic/ui/article/widget/video_details_activity.dart';
import 'package:lyc_clinic/ui/comment/widget/create_comment_items.dart';
import 'package:lyc_clinic/base/widget/custom_bottom_navigation_bar.dart';
import 'package:lyc_clinic/ui/article/contract/article_details_contract.dart';
import 'package:lyc_clinic/ui/article/presenter/article_details_presenter.dart';
import 'package:lyc_clinic/utils/configs.dart';
import 'package:lyc_clinic/ui/article/data/article.dart';
import 'package:lyc_clinic/ui/comment/data/comment.dart';
import 'package:lyc_clinic/base/mystyle.dart';
import 'package:lyc_clinic/utils/mySharedPreferences.dart';
import 'package:lyc_clinic/ui/login/login_dialog_page.dart';
import 'package:share/share.dart';
import 'package:lyc_clinic/base/widget/base_widget.dart';

class ArticleDetailsPage extends StatefulWidget {
  final int id;
  final bool isFeature;

  ArticleDetailsPage(this.id, {this.isFeature = false});

  @override
  ArticleDetailsPageState createState() {
    return new ArticleDetailsPageState();
  }
}

class ArticleDetailsPageState extends State<ArticleDetailsPage>
    implements ArticleDetailsContract {
  ArticleDetailsPresenter mPresenter;
  Article article = new Article();
  Comment comment = new Comment();
  bool isBookmark = false;
  bool isFav = false;
  MySharedPreferences mySharedPreferences = new MySharedPreferences();
  var _scaffoldKey = new GlobalKey<ScaffoldState>();
  VoidCallback _showPersBottomSheetCallBack;
  bool isLoading = true;
  bool isLogin = false;
  bool isGuest = true;
  String accessCode;

  ArticleDetailsPageState() {
    mPresenter = new ArticleDetailsPresenter(this);
  }

  _clickBack(BuildContext context) {
    Navigator.of(context).pop();
  }

  void _showBottomSheet() {
    _scaffoldKey.currentState.showBottomSheet((context) {
      return new LoginDialogPage();
    });
    void _showBottomSheet() {
      setState(() {
        _showPersBottomSheetCallBack = null;
      });

      _scaffoldKey.currentState
          .showBottomSheet((context) {
            return new Container(
              height: MediaQuery.of(context).size.height - 100.0,
              color: Colors.greenAccent,
              child: new Center(
                child: new Text("Hi BottomSheet"),
              ),
            );
          })
          .closed
          .whenComplete(() {
            if (mounted) {
              setState(() {
                _showPersBottomSheetCallBack = _showBottomSheet;
              });
            }
          });
    }
  }

  /* Future<Null> _showLoginDialog() async {
    return await showModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return new Container(
              color: MyStyle.colorWhite,
              height: 150.0,
              child: new LoginDialogPage());
          //return null;
        });
  }*/

  _clickBookmark(BuildContext context) {
    if (!isGuest) {
      setState(() {
        isBookmark = !isBookmark;
      });
      mPresenter.saveArticle(accessCode, article.id);
    } else {
      BaseWidgets.showLoginDialog(context);
    }
  }

  _clickShare(BuildContext context) {
    Share.share(article.shareUrl);
  }

  _clickFloatingButton(BuildContext context) {
    if (!isGuest) {
      setState(() {
        isFav = !isFav;
      });
      mPresenter.setFavorite(accessCode, article.id);
    } else {
      BaseWidgets.showLoginDialog(context);
    }
  }

  _clickComment(BuildContext context) {
    Navigator.push(
        context,
        new MaterialPageRoute(
            builder: (_) => new CommentPage(article.id, true, null)));
  }

  @override
  void initState() {
    super.initState();
    mySharedPreferences
        .getBooleanData(Configs.PREF_USER_LOGIN)
        .then((val) => setState(() {
              isLogin = val != null ? val : false;
              getAccessCode(isLogin);
            }));

    _showPersBottomSheetCallBack = _showBottomSheet;
  }

  void getAccessCode(bool login) {
    if (login) {
      isGuest = false;
      mySharedPreferences.getStringData(Configs.PREF_USER_ACCESSCODE).then((v) {
        accessCode = v;
        getData();
      });
    } else {
      isGuest = true;
      accessCode = Configs.GUEST_CODE;
      getData();
    }
  }

  void getData() {
    print('Guest is>>$isGuest');
    mPresenter.getArticleDetail(accessCode, widget.id);
    mPresenter.getComment(accessCode, widget.id, 3);
  }

  Widget _buildAppBar(BuildContext context) {
    return new Stack(
      children: <Widget>[
        new Positioned(
          left: 0.0,
          top: 10.0,
          child: new IconButton(
            splashColor: MyStyle.colorBlack,
            color: MyStyle.colorBlack,
            highlightColor: MyStyle.colorBlack,
            icon: new Icon(
              Icons.arrow_back,
              color: MyStyle.colorBlack,
            ),
            iconSize: 30.0,
            onPressed: () => _clickBack(context),
          ),
        ),
        new Positioned(
          right: 60.0,
          top: 10.0,
          child: new IconButton(
            color: MyStyle.colorGrey,
            icon: new Icon(
              isBookmark ? Icons.bookmark : Icons.bookmark_border,
              color: MyStyle.colorBlack,
            ),
            iconSize: 30.0,
            onPressed: () => _clickBookmark(context),
          ),
        ),
        new Positioned(
          right: 0.0,
          top: 10.0,
          child: new IconButton(
            icon: new Icon(
              Icons.share,
              color: MyStyle.colorBlack,
            ),
            iconSize: 30.0,
            onPressed: () => _clickShare(context),
          ),
        ),
      ],
    );
  }

  Widget _getFloatButton(IconData ic, Color bgColor, Color icColor) {
    return new Container(
      width: 40.0,
      height: 40.0,
      decoration:
          new BoxDecoration(shape: BoxShape.circle, color: bgColor, boxShadow: [
        new BoxShadow(
            color: Colors.grey, blurRadius: 4.0, offset: new Offset(1.0, 4.0)),
      ]),
      child: new Icon(
        ic,
        color: icColor,
      ),
    );
  }

  Widget _floatingBar() {
    return new Container(
        alignment: FractionalOffset.bottomCenter,
        child: new Row(
          children: <Widget>[
            new InkWell(
              child: new Padding(
                padding:
                    const EdgeInsets.only(top: 0.0, left: 0.0, right: 10.0),
                child: _getFloatButton(
                    Icons.chat_bubble_outline, Colors.white, Colors.grey),
              ),
              onTap: null,
            ),
            new Padding(
                padding: const EdgeInsets.only(bottom: 8.0, left: 5.0),
                child: new Text(
                  '2',
                  style: new TextStyle(
                      fontSize: MyStyle.small_fontSize, color: Colors.grey),
                )),
            new Expanded(
                child: new Row(
              children: <Widget>[],
            )),
            new RaisedButton(
              onPressed: () => _clickComment(context),
              color: Colors.orange,
              child: new Text(
                'Comment  ေပးရန္',
                style: new TextStyle(
                  color: Colors.white,
                ),
              ),
              shape: new RoundedRectangleBorder(
                borderRadius: new BorderRadius.circular(30.0),
              ),
            )
          ],
        ));
  }

  _showHeaderImage() {
    if (article.id != null) {
      return new Container(
        constraints: new BoxConstraints.expand(
          height: 250.0,
        ),
        padding: new EdgeInsets.only(left: 16.0, bottom: 8.0, right: 16.0),
        decoration: new BoxDecoration(
          image: new DecorationImage(
            image: new NetworkImage(article.image),
            fit: BoxFit.cover,
          ),
        ),
      );
    } else {
      return new Container(
        child: null,
      );
    }
  }

  /*Widget loadingIndicator = new Container(
      child: new CircularProgressIndicator(
    strokeWidth: 2.0,
  ));
*/

  Widget _buildBody(BuildContext context) {
    if (!isLoading) {
      return new SingleChildScrollView(
          controller: new ScrollController(),
          scrollDirection: Axis.vertical,
          child: new Padding(
            padding: const EdgeInsets.only(top: 0.0, bottom: 5.0),
            child: new Container(
              child: new Column(
                children: <Widget>[
                  _showHeaderImage(),
                  buildTitle(context),
                  new Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: new ArticleDetailsItem(article, comment),
                  ),
                  new Stack(
                    children: <Widget>[
                      new Container(
                        margin: const EdgeInsets.only(top: 20.0),
                        //color: MyStyle.layoutBackground,
                        child: new CommentItem(comment, article.id, true),
                      ),
                      new Positioned(
                        child: _floatingBar(),
                        top: 0.0,
                        left: 5.0,
                        right: 5.0,
                      )
                    ],
                  )
                ],
              ),
            ),
          ));
    } else {
      return new Container(
        child: Center(child: BaseWidgets.loadingIndicator),
      );
    }
  }

  Widget buildTitle(BuildContext context) {
    if (article.id != null) {
      return new Container(
        padding: const EdgeInsets.only(top: 15.0),
        child: new Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            new Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: new Text(
                article.title,
                textAlign: TextAlign.start,
                style: new TextStyle(
                    fontSize: MyStyle.large_fontSize,
                    fontWeight: FontWeight.bold),
              ),
            ),
            new Padding(
              padding: const EdgeInsets.all(5.0),
              child: new Row(
                children: <Widget>[
                  new Row(
                    children: <Widget>[
                      new Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: new Icon(Icons.favorite,
                              color: MyStyle.colorGrey, size: 18.0)),
                      new Padding(
                          padding: const EdgeInsets.only(right: 5.0),
                          child: new Text(
                            article.favCount.toString(),
                            style: new TextStyle(
                                color: MyStyle.colorGrey,
                                fontSize: MyStyle.small_fontSize),
                          )),
                    ],
                  ),
                  new Row(
                    children: <Widget>[
                      new Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: new Icon(Icons.chat_bubble,
                              color: MyStyle.colorGrey, size: 18.0)),
                      new Padding(
                          padding: const EdgeInsets.only(right: 5.0),
                          child: new Text(
                            article.commentCount.toString(),
                            style: new TextStyle(
                                color: MyStyle.colorGrey,
                                fontSize: MyStyle.small_fontSize),
                          )),
                    ],
                  ),
                  new Row(children: <Widget>[
                    new Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: new Icon(Icons.share,
                            color: MyStyle.colorGrey, size: 18.0)),
                    new Padding(
                        padding: const EdgeInsets.only(right: 5.0),
                        child: new Text(
                          article.share.toString(),
                          style: new TextStyle(
                              color: MyStyle.colorGrey,
                              fontSize: MyStyle.small_fontSize),
                        )),
                  ])
                ],
              ),
            ),
          ],
        ),
      );
    } else {
      return new Container(
        child: null,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new Container(
        color: MyStyle.colorWhite,
        padding: const EdgeInsets.only(top: 25.0),
        child: new Stack(children: <Widget>[
          _buildBody(context),
          _buildAppBar(context),
        ]),
      ),
      floatingActionButton: new FloatingActionButton(
          onPressed: () => _clickFloatingButton(context),
          elevation: 10.0,
          child: new Icon(isFav ? Icons.favorite : Icons.favorite_border,
              color: isFav ? MyStyle.colorWhite : MyStyle.colorGrey),
          backgroundColor: isFav ? MyStyle.colorAccent : MyStyle.colorWhite),
      backgroundColor: MyStyle.colorWhite,
      bottomNavigationBar: new Material(child: new CustomBottomNavigationBar()),
    );
  }

  @override
  void showComments(Comment c) {
    setState(() {
      comment = c;
    });
    print('Comment List ${comment.toString}');
  }

  @override
  void showArticle(Article a, int commentCount) {
    setState(() {
      article = a;
      isBookmark = article.save;
      isFav = article.fav;
      isLoading = false;
    });
  }
}
