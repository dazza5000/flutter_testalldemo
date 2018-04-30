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
            new Padding(
              padding: const EdgeInsets.only(left: 0.0, right: 10.0),
              child: new FloatingActionButton(
                  heroTag: "DoctorLike",
                  onPressed: _clickLikeButton,
                  child: new Icon(
                      _favIcon, size: 20.0, color: _favicColor),
                  mini: true,
                  backgroundColor: _favbgColor),
            ),

            new Padding(
                padding: const EdgeInsets.only(left: 10.0, right: 0.0),
                child: new FloatingActionButton(
                  heroTag: "DoctorShare",
                  onPressed: _clickShareButton,
                  child: new Icon(
                      Icons.share, size: 20.0, color: Colors.grey),
                  mini: true,
                  backgroundColor: Colors.white,)
            ),
            new Expanded(child: new Row(children: <Widget>[],)),
            new Padding(
                padding: const EdgeInsets.only(right: 10.0),
                child: new FloatingActionButton(
                  heroTag: "DoctorBookmark",
                  onPressed: _clickBookMarkButton,
                  child: new Icon(
                      _bookMarkIcon, size: 20.0, color: _bookicColor),
                  mini: true,
                  backgroundColor: _bookbgColor,)
            ),

          ],
        )
    );
  }


}