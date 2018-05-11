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
    IconData _bookMarkIcon = _isBookMark ? Icons.bookmark : Icons
        .bookmark_border;
    Color _bookbgColor = _isBookMark ? Colors.orangeAccent : Colors.white;
    Color _bookicColor = _isBookMark ? Colors.white : Colors.grey;

    return new Container(
        margin: new EdgeInsets.fromLTRB(20.0, 180.0, 10.0, 10.0),
        alignment: FractionalOffset.center,
        child: new Row(
          children: <Widget>[

            new InkWell(
              child: new Padding(
                padding: const EdgeInsets.only(
                    top: 0.0, left: 0.0, right: 10.0),
                child: _getFloatButton(_favIcon, _favbgColor, _favicColor),
              ),
              onTap: _clickLikeButton,
            ),

            new InkWell(
              child: new Padding(
                padding: const EdgeInsets.only(
                    top: 0.0, left: 0.0, right: 0.0),
                child: _getFloatButton(Icons.share, Colors.white, Colors.grey),
              ),
              onTap: _clickShareButton,
            ),

            new Expanded(child: new Row(children: <Widget>[],)),

            new InkWell(
              child: new Padding(
                padding: const EdgeInsets.only(
                    top: 0.0, left: 0.0, right: 0.0),
                child: _getFloatButton(
                    _bookMarkIcon, _bookbgColor, _bookicColor),
              ),
              onTap: _clickBookMarkButton,
            ),
          ],
        )
    );
  }


}