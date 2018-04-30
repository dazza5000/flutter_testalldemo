import 'package:flutter/material.dart';

class CreateButton extends StatefulWidget {

  @override
  _CreateButtonState createState() {
    return new _CreateButtonState();
  }

}

class _CreateButtonState extends State<CreateButton> {
  bool _isFavourite = false;
  bool _isBookMark = false;
  int _favCount = 0;
  bool _isCommented = false;
  int _commentCount = 0;

  @override
  void initState() {

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
    /*return new RaisedButton.icon(
      shape: new CircleBorder(
          side: new BorderSide(
              color: Colors.white
          )
      ),
      color: Colors.white,
      onPressed: _clickLikeButton,
      icon: new Icon(Icons.add),
      label: new Text(""),);*/
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
  }

  _clickShareButton() {
    setState(() {

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

            new InkWell(
              child: new Padding(
                padding: const EdgeInsets.only(
                    top: 10.0, left: 10.0, right: 0.0),
                child: _getFloatButton(
                    _commentIcon, _commentbgcolor, _commenticColor),
                /*new FloatingActionButton(
                    onPressed: _clickCommentButton,
                    child: new Icon(
                        _commentIcon, size: 20.0, color: _commenticColor),
                    mini: true,
                    backgroundColor: _commentbgcolor,)*/
              ),
              onTap: _clickCommentButton,
            ),

            new InkWell(
              child: new Padding(
                  padding: const EdgeInsets.only(
                      top: 10.0, left: 10.0, right: 0.0),
                  child: _getFloatButton(Icons.share, Colors.white, Colors.grey)
                /*new FloatingActionButton(
                    onPressed: _clickShareButton,
                    child: new Icon(
                        Icons.share, size: 20.0, color: Colors.grey),
                    mini: true,
                    backgroundColor: Colors.white,)*/
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