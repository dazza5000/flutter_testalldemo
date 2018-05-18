import 'package:flutter/material.dart';
import 'package:lyc_clinic/base/mystyle.dart';
import 'package:lyc_clinic/ui/comment/page/comment_page.dart';
import 'package:lyc_clinic/ui/article/model/article.dart';
import 'package:share/share.dart';

class CreateArticleButton extends StatefulWidget {
  Article article;

  CreateArticleButton(this.article);

  @override
  CreateArticleButtonState createState() {
    return new CreateArticleButtonState();
  }

}

class CreateArticleButtonState extends State<CreateArticleButton> {
  bool _isFavourite = false;
  bool _isBookMark = false;
  int _favCount = 0;
  bool _isCommented = false;
  int _commentCount = 0;

  @override
  void initState() {
    _favCount = widget.article.favCount;
    _isFavourite = widget.article.fav;
    _commentCount = widget.article.commentCount;
    _isCommented = widget.article.commentCount > 0 ? true : false;
    _isBookMark = widget.article.save;
  }

  Widget _getFloatButton(IconData ic, Color bgColor, Color icColor) {
    return new Container(
      width: 40.0,
      height: 40.0,
      decoration: new BoxDecoration(
          shape: BoxShape.circle,
          color: bgColor,
          boxShadow: [new BoxShadow(
              color: Colors.grey,
              blurRadius: 4.0,
              offset: new Offset(1.0, 4.0)
          ),
          ]
      ),
      child: new Icon(ic, color: icColor,),
    );
  }

  void _clickLikeButton() {
    setState(() {
      if (_isFavourite) {
        _isFavourite = false;
        _favCount -= 1;
      }
      else {
        _isFavourite = true;
        _favCount += 1;
      }
    });
  }

  _clickCommentButton() {
    setState(() {
      if (!_isCommented) {
        _isCommented = true;
      }
    });
    Navigator.push(
        context, new MaterialPageRoute(builder: (_) => new CommentPage()));
  }

  _clickShareButton() {
    setState(() {
      share(widget.article.shareUrl);
    });
  }

  _clickBookMarkButton() {
    setState(() {
      if (_isBookMark) {
        _isBookMark = false;
      }
      else {
        _isBookMark = true;
      }
    });
  }

  Widget _showActivityCount(String activityCount) {
    return new Text(activityCount, style: new TextStyle(
        fontSize: MyStyle.small_fontSize, color: MyStyle.colorGrey),);
  }

  @override
  Widget build(BuildContext context) {
    Color _favbgColor = _isFavourite ? Colors.orangeAccent : Colors.white;
    Color _favicColor = _isFavourite ? Colors.white : Colors.grey;
    IconData _favIcon = _isFavourite ? Icons.favorite : Icons.favorite_border;
    Color _commentbgcolor = _isCommented ? Colors.orangeAccent : Colors.white;
    Color _commenticColor = _isCommented ? Colors.white : Colors.grey;
    IconData _commentIcon = _isCommented ? Icons.chat_bubble : Icons
        .chat_bubble_outline;
    Color _bookbgColor = _isBookMark ? Colors.orangeAccent : Colors.white;
    Color _bookicColor = _isBookMark ? Colors.white : Colors.grey;
    IconData _bookMarkIcon = _isBookMark ? Icons.bookmark : Icons
        .bookmark_border;
    var favCount = _favCount > 0 ? "$_favCount" : " ";
    var commentCount = _commentCount > 0 ? '$_commentCount' : "";
    return new Container(
        alignment: FractionalOffset.bottomCenter,
        child: new Row(
          children: <Widget>[
            new InkWell(
              child: new Padding(
                padding: const EdgeInsets.only(
                    top: 10.0, left: 0.0, right: 10.0),
                child: _getFloatButton(_favIcon, _favbgColor, _favicColor),
              ),
              onTap: _clickLikeButton,
            ),

            new Padding(padding: const EdgeInsets.only(
                top: 0.0, bottom: 10.0, right: 15.0),
                child: _showActivityCount(favCount)),

            new InkWell(
              child: new Padding(
                padding: const EdgeInsets.only(
                    top: 10.0, left: 10.0, right: 0.0),
                child: _getFloatButton(
                    _commentIcon, _commentbgcolor, _commenticColor),
              ),
              onTap: _clickCommentButton,
            ),

            new Padding(padding: const EdgeInsets.only(
                top: 0.0, bottom: 10.0, right: 15.0),
                child: _showActivityCount(commentCount)),

            new InkWell(
              child: new Padding(
                  padding: const EdgeInsets.only(
                      top: 10.0, left: 10.0, right: 0.0),
                  child: _getFloatButton(Icons.share, Colors.white, Colors.grey)
              ),
              onTap: _clickShareButton,
            ),

            new Expanded(child: new Row(children: <Widget>[],)),

            new InkWell(
              child: new Padding(
                padding: const EdgeInsets.only(top: 10.0, right: 10.0),
                child: _getFloatButton(
                    _bookMarkIcon, _bookbgColor, _bookicColor),
                /*new FloatingActionButton(
                    heroTag: 'ArticleBookMark',
                    onPressed: _clickBookMarkButton,
                    child: new Icon(
                        _bookMarkIcon, size: 20.0, color: _bookicColor),
                    mini: true,
                    backgroundColor: _bookbgColor,)
              ),*/

              ),
              onTap: _clickBookMarkButton,),

          ],
        )
    );
  }


}