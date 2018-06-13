import 'package:flutter/material.dart';
import 'package:lyc_clinic/base/mystyle.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'dart:async';
import 'package:lyc_clinic/ui/chat/contract/chat_contract.dart';
import 'package:lyc_clinic/ui/chat/presenter/chat_presenter.dart';
import 'package:lyc_clinic/utils/configs.dart';
import 'package:lyc_clinic/base/data/pagination.dart';
import 'package:lyc_clinic/base/mystyle.dart';
import 'package:lyc_clinic/ui/chat/data/message.dart';

class ChatListPage extends StatefulWidget {
  @override
  ChatListPageState createState() {
    return new ChatListPageState();
  }
}

class ChatListPageState extends State<ChatListPage> implements ChatContract {
  final mController = new TextEditingController();
  Future<File> _imageFile;
  ChatPresenter mPresenter;
  int mArticleId;
  int mServiceId;
  int mDoctorId;
  List<Message> messageList = new List<Message>();
  String message;
  ChatContract mView;

  ChatListPageState() {
    mPresenter = new ChatPresenter(this);
  }

  _clickPhone(BuildContext context) {
    _callPhone();
  }

  _callPhone() async {
    print('Custom Bottom Nav Phone call');
    const phoneNo = 'tel://09421234567';
    if (await canLaunch(phoneNo)) {
      await launch(phoneNo);
    } else {
      throw 'Colud not call $phoneNo';
    }
  }

  _sendClick() {
    mPresenter.sendMessage(
        Configs.TEST_CODE, message, mArticleId, mDoctorId, mServiceId);
  }

  void _onImageButtonPressed(ImageSource source) {
    setState(() {
      _imageFile = ImagePicker.pickImage(source: source);
    });
  }

  Widget _showSendAndSend() {
    return new IconButton(
      icon: new Icon(Icons.send),
      onPressed: _sendClick,
      color: Colors.green,
    );
  }

  void _submitMessage(String text) {
    //mController.clear();
    setState(() {
      message = text;
    });
    print('Message is$message');
  }

  void _handleMessageChanged(String text) {
    setState(() {
      //_isComposing = text.length > 0;
    });
  }

  Widget getChatImageAndChatView(Message m, int type) {
    var bgColor =
        type == 0 ? MyStyle.defaultGrey : MyStyle.chatRespondBackground;
    var logo = type == 0 ? 'assets/images/lyc.png' : 'assets/images/lyc.png';

    if (m.image.small != '' && m.image.thumb != '' && m.mesg == '') {
      return new Container(
          margin: const EdgeInsets.only(left: 5.0, right: 5.0),
          child: new Image.network(m.image.small, width: 200.0));
    } else {
      return new Container(
        margin: const EdgeInsets.only(left: 5.0, right: 5.0),
        width: 200.0,
        padding: const EdgeInsets.all(5.0),
        decoration: new BoxDecoration(
            shape: BoxShape.rectangle,
            color: bgColor,
            borderRadius: new BorderRadius.circular(5.0)),
        child: new GestureDetector(
          onTap: null,
          child: new Text(
            m.mesg,
            style: new TextStyle(color: MyStyle.colorBlack),
          ),
        ),
        alignment: Alignment.center,
      );
    }
  }

  Widget getChatView(Message m, int type) {
    var bgColor =
        type == 0 ? MyStyle.defaultGrey : MyStyle.chatRespondBackground;
    var imgLogo = type == 0 ? 'assets/images/lyc.png' : 'assets/images/lyc.png';

    if (type == 0) {
      return new Padding(
        padding: const EdgeInsets.symmetric(horizontal: 5.0, vertical: 10.0),
        child: new Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            new Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                getChatImageAndChatView(m, type),
                new InkWell(
                  child: new CircleAvatar(
                    backgroundImage: new AssetImage(imgLogo),
                    radius: 20.0,
                  ),
                  onTap: () => null,
                ),
              ],
            ),
            new Padding(
              padding: const EdgeInsets.only(
                  left: 5.0, top: 5.0, right: 30.0, bottom: 5.0),
              child: new Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  new Text(m.date),
                  new Padding(
                    padding: const EdgeInsets.only(left: 5.0, right: 5.0),
                    child: new Icon(
                      Icons.brightness_1,
                      color: MyStyle.defaultGrey,
                      size: 5.0,
                    ),
                  ),
                  new Text(m.time)
                ],
              ),
            )
          ],
        ),
      );
    } else {
      return new Padding(
        padding: const EdgeInsets.symmetric(horizontal: 5.0, vertical: 10.0),
        child: new Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            new Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                new InkWell(
                  child: new CircleAvatar(
                    backgroundImage: new AssetImage(imgLogo),
                    radius: 20.0,
                  ),
                  onTap: () => null,
                ),
                getChatImageAndChatView(m, type)
              ],
            ),
            new Padding(
              padding: const EdgeInsets.only(
                  left: 30.0, top: 5.0, right: 5.0, bottom: 5.0),
              child: new Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  new Text(m.date),
                  new Padding(
                    padding: const EdgeInsets.only(left: 5.0, right: 5.0),
                    child: new Icon(
                      Icons.brightness_1,
                      color: MyStyle.defaultGrey,
                      size: 5.0,
                    ),
                  ),
                  new Text(m.time)
                ],
              ),
            )
          ],
        ),
      );
    }
  }

  Widget _buildChartItem(BuildContext context, int index) {
    Message msg = messageList[index];
    int type = msg.reply ? 1 : 0;
    return new Container(
      child: getChatView(msg, type),
    );
  }

  @override
  void initState() {
    super.initState();
    mView = this;
    mPresenter.getChatHistory(Configs.TEST_CODE);
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        backgroundColor: MyStyle.colorWhite,
        leading: new IconButton(
            icon: new Icon(Icons.arrow_back, color: MyStyle.colorBlack),
            onPressed: () => Navigator.pop(context)),
        title: new Text(
          'Chat Box',
          style: new TextStyle(color: MyStyle.colorBlack, fontSize: 14.0),
        ),
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
                  itemCount: messageList.length,
                  controller: new ScrollController(),
                  scrollDirection: Axis.vertical,
                ),
              ),
              new Divider(
                height: 1.0,
              ),
              new Container(
                child: new Row(
                  children: <Widget>[
                    new IconButton(
                        icon: new Icon(
                          Icons.camera_alt,
                          color: MyStyle.defaultGrey,
                        ),
                        onPressed: () => mView.showCamera()),
                    new IconButton(
                        icon: new Icon(Icons.photo_library,
                            color: MyStyle.defaultGrey),
                        onPressed: () => mView.showGallery()),
                    new Flexible(
                        child: new TextField(
                      onSubmitted: (val) => _submitMessage(val),
                      style: MyStyle.listItemTextStyle(),
                      controller: mController,
                      decoration: new InputDecoration(
                          hintText: 'Type Your Message',
                          contentPadding: const EdgeInsets.all(10.0),
                          border: new OutlineInputBorder(
                              borderRadius: new BorderRadius.circular(30.0),
                              borderSide: new BorderSide(
                                  color: MyStyle.defaultGrey, width: 1.0),
                              gapPadding: 1.0)),
                    )),
                    _showSendAndSend()
                  ],
                ),
              ),
            ],
          )),
    );
  }

  @override
  void pagination(Pagination p) {}

  @override
  void hideDialog() {}

  @override
  void showDialog() {}

  @override
  void hideSendButton() {}

  @override
  void showSendButton() {}

  @override
  void showGallery() {
    _onImageButtonPressed(ImageSource.gallery);
  }

  @override
  void showCamera() {
    _onImageButtonPressed(ImageSource.camera);
  }

  @override
  void showMessage(String message) {}

  @override
  void showErrorChat(String mesg) {}

  @override
  void showNewMessage(Message m) {
    mController.clear();
    message = "";
    setState(() {
      messageList.add(m);
    });
  }

  @override
  void showMoreChatHistroy(List<Message> m) {
    setState(() {
      messageList.addAll(m);
    });
  }

  @override
  void showChatHistory(List<Message> m) {
    messageList.clear();
    setState(() {
      messageList = m;
    });
  }
}
