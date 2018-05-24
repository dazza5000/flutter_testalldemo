import 'package:flutter/material.dart';
import 'package:lyc_clinic/ui/comment/data/reply.dart';
import 'package:lyc_clinic/ui/otheruser/page/other_user_page.dart';
import 'package:lyc_clinic/utils/configs.dart';

class CommentReplyItemWidget extends StatefulWidget {
  Reply reply;

  CommentReplyItemWidget(this.reply);

  @override
  CommentReplyItemWidgetState createState() {
    return new CommentReplyItemWidgetState();
  }
}

class CommentReplyItemWidgetState extends State<CommentReplyItemWidget> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  int mReplyId;
  String userName;
  TextSpan span;

  Widget _getSpannableString(BuildContext context,String spanVal) {
    TextSpan span = new TextSpan(
        style: new TextStyle(color: Colors.cyan), text: spanVal);
    return new RichText(
      text: new TextSpan(
        style: new TextStyle(
          fontSize: 14.0,
          color: Colors.black,
        ),
        children: <TextSpan>[
          new TextSpan(text: spanVal),
        ],
      ),
    );
  }

  _clickReply(BuildContext context,String spanVal) {
    mReplyId = widget.reply.id;
    if (widget.reply.username == null)
      userName = Configs.ADMIN_NAME;
    else
      userName = widget.reply.username;

     span = new TextSpan(
        style: new TextStyle(color: Colors.cyan), text: spanVal);
      setState((){

      });
  }

  _moreInfoClick(BuildContext context) {

  }

  _goToOtherUserPage(BuildContext context) {
    Navigator.push(
        context, new MaterialPageRoute(builder: (_) => new OtherUserPage()));
  }


  @override
  Widget build(BuildContext context) {
    return new Container(
        margin: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 0.0),
        child: new Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            new InkWell(
              child: new CircleAvatar(
                backgroundImage: new NetworkImage(widget.reply.image),
                radius: 20.0,
              ),
              onTap: () => _goToOtherUserPage(context),
            ),

            new Container(
                padding: const EdgeInsets.only(left: 5.0),
                child: new Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    new InkWell(
                      child: new Padding(
                        padding: const EdgeInsets.all(3.0),
                        child: new Text(widget.reply.username),),
                      onTap: () => _goToOtherUserPage(context),
                    ),

                    new Text(widget.reply.mesg, maxLines: 5,),
                    new Padding(
                      padding: const EdgeInsets.all(3.0),
                      child: new Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          new Text('22:00 '),
                          new Padding(
                              padding: const EdgeInsets.only(
                                  left: 5.0, right: 5.0),
                              child: new Text('.', style: new TextStyle(
                                  fontSize: 18.0,
                                  color: Colors.grey,
                                  fontWeight: FontWeight.bold))),
                          new GestureDetector(
                            child: new Text('Reply'),
                            onTap: () => _clickReply(context,'Hnin Nway Nway Hlaing'),
                          )
                        ],
                      ),
                    ),
                  ],
                )
            ),
          ],
        )
    );
  }
}