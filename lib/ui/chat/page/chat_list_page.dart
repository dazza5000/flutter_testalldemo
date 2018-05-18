import 'package:flutter/material.dart';
import 'package:lyc_clinic/base/mystyle.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'dart:async';

class ChatListPage extends StatefulWidget {
  @override
  ChatListPageState createState() {
    return new ChatListPageState();
  }
}

class ChatListPageState extends State<ChatListPage> {
  TextEditingController _textController = new TextEditingController();
  List<String> messages = ['hello', 'hi', 'how are you'];
  Future<File> _imageFile;

  _clickPhone(BuildContext context) {
    _callPhone();
  }

  _callPhone() async {
    print('Custom Bottom Nav Phone call');
    const phoneNo = 'tel://09421234567';
    if (await canLaunch(phoneNo)) {
      await launch(phoneNo);
    }
    else {
      throw 'Colud not call $phoneNo';
    }
  }

  _sendClick() {

  }

  void _onImageButtonPressed(ImageSource source) {
    setState(() {
      _imageFile = ImagePicker.pickImage(source: source);
    });
  }

  Widget _showSendAndSend() {
    return new IconButton(icon: new Icon(Icons.send),
      onPressed: _sendClick,
      color: Colors.green,);
  }

  void _submitMessage(String text) {
    _textController.clear();
    setState(() {
      //_isComposing = false;
    });
  }

  void _handleMessageChanged(String text) {
    setState(() {
      //_isComposing = text.length > 0;
    });
  }

  Widget _buildChartItem(BuildContext context, int index) {
    String msg = messages[index];
    return new ListTile(
      title: new Text(msg, style: MyStyle.listItemTextStyle(),),
    );
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        backgroundColor: MyStyle.colorWhite,
        leading: new IconButton(
            icon: new Icon(Icons.arrow_back, color: MyStyle.colorBlack),
            onPressed: () => Navigator.pop(context)),
        title: new Text('Chat Box',
          style: new TextStyle(color: MyStyle.colorBlack, fontSize: 14.0),),
        actions: <Widget>[
          new IconButton(
              icon: new Icon(Icons.phone, color: MyStyle.colorAccent),
              onPressed: () => _clickPhone(context))
        ],
      ),
      body: new Container(
          color: MyStyle.layoutBackground,
          child: new Column(
            children: <Widget>[
              new Flexible(
                child: new ListView.builder(
                  itemBuilder: _buildChartItem,
                  itemCount: messages.length,
                  controller: new ScrollController(),
                  scrollDirection: Axis.vertical,),
              ),
              new Divider(height: 1.0,),
              new Container(
                child: new Row(
                  children: <Widget>[
                    new IconButton(
                        icon: new Icon(
                          Icons.camera_alt, color: MyStyle.colorGrey,),
                        onPressed: () =>
                            _onImageButtonPressed(ImageSource.camera)),
                    new IconButton(
                        icon: new Icon(
                            Icons.photo_library, color: MyStyle.colorGrey),
                        onPressed: () =>
                            _onImageButtonPressed(ImageSource.gallery)),
                    new Flexible(
                        child: new TextField(
                          style: MyStyle.listItemTextStyle(),
                          controller: _textController,
                          decoration: new InputDecoration(
                              hintText: 'Type Your Message',
                              contentPadding: const EdgeInsets.all(10.0),
                              border: new OutlineInputBorder(
                                  borderRadius: new BorderRadius.circular(30.0),
                                  borderSide: new BorderSide(
                                      color: MyStyle.defaultGrey, width: 1.0),
                                  gapPadding: 1.0
                              )
                          ),
                        )
                    ),
                    _showSendAndSend()
                  ],
                ),
              ),


            ],
          )
      ),
    );
  }
}