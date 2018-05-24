import 'package:flutter/material.dart';
import 'package:lyc_clinic/ui/comment/widget/comment_item_widget.dart';
import 'package:lyc_clinic/ui/comment/data/review.dart';
import 'package:lyc_clinic/ui/comment/data/comment.dart';
import 'package:lyc_clinic/base/data/pagination.dart';

class CommentPage extends StatefulWidget {
  static final List<Review> review = [new Review(
      47,
      "http://api.linyaungchi.com/storage/images/user/tmpphpdsuolp-20180202061947.jpg",
      903,
      "Hnin Nway Nway Hlaing",
      null,
      2,
      "test comment",
      true,
      false,
      0,
      1517988565,
      7350086),

  new Review(
      39,
      "http://api.linyaungchi.com/storage/images/user/tmpphpdsuolp-20180202061947.jpg",
      903,
      "Hnin Nway Nway Hlaing",
      null,
      2,
      "test comment1",
      true,
      false,
      0,
      1517574565,
      7764086),
  ];

  Comment comment = new Comment(new Pagination(1, 5, 1, 2), review);

  @override
  CommentPageState createState() {
    return new CommentPageState();
  }
}


class CommentPageState extends State<CommentPage> {
  TextEditingController _textController = new TextEditingController();
  bool isWriting = false;

  _sendClick() {

  }

  void _submitMessage(String text) {
    _textController.clear();
    setState(() {
      isWriting = false;
    });
  }

  Widget _buildCommentItem(BuildContext context, int index) {
    Review c = widget.comment.data[index];
    int commentCount = widget.comment.pagination.total;
    return new CommentItemWidget(c, commentCount);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: new AppBar(
          backgroundColor: Colors.white,
          title: new Text('Comments',
            style: new TextStyle(color: Colors.black, fontSize: 16.0),),
          leading: new IconButton(icon: new Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context, true);
            },
            color: Colors.black,),
        ),
        body: new Container(
            child: new Stack(
                children: <Widget>[
                  new Center(
                      child: new Column(children: <Widget>[
                        new ListView.builder(
                          itemBuilder: _buildCommentItem,
                          shrinkWrap: true,
                          itemCount: widget.comment.data.length,
                          scrollDirection: Axis.vertical,
                          controller: new ScrollController(),),
                      ]

                      )
                  ),
                  new Align(
                      alignment: FractionalOffset.bottomCenter,
                      child: new Container(
                          child: new Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: <Widget>[
                              new Divider(height: 2.0, color: Colors.black,),
                              new Row(
                                children: <Widget>[
                                  new Expanded(
                                    child: new TextField(
                                      controller: _textController,
                                      onChanged: (String text) {
                                        setState(() {

                                        });
                                      },
                                      onSubmitted: _submitMessage,
                                      decoration: new InputDecoration(
                                          border: InputBorder.none,
                                          contentPadding: const EdgeInsets.only(
                                              left: 10.0),
                                          hintText: 'Please enter a search term'
                                      ),),),
                                  new IconButton(icon: new Icon(Icons.send),
                                    onPressed: _sendClick,
                                    color: Colors.green,)
                                ],
                              ),
                            ],
                          )
                      )
                  )
                ]
            )

        )
    );
  }
}