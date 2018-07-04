import 'package:flutter/material.dart';
import 'dart:io';
import 'package:url_launcher/url_launcher.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pusher_flutter/pusher_flutter.dart';
import 'package:lyc_clinic/base/mystyle.dart';
import 'package:lyc_clinic/base/data/pagination.dart';
import 'package:lyc_clinic/base/widget/base_widget.dart';
import 'package:lyc_clinic/utils/mySharedPreferences.dart';
import 'package:lyc_clinic/utils/configs.dart';
import 'package:lyc_clinic/ui/chat/contract/chat_contract.dart';
import 'package:lyc_clinic/ui/chat/presenter/chat_presenter.dart';
import 'package:lyc_clinic/ui/chat/data/message.dart';

class ChatListPage extends StatefulWidget {
  @override
  ChatListPageState createState() {
    return new ChatListPageState();
  }
}

class ChatListPageState extends State<ChatListPage>
    with TickerProviderStateMixin
    implements ChatContract {
  final mController = new TextEditingController();
  File _imageFile;
  int mArticleId;
  int mServiceId;
  int mDoctorId;
  String message;
  bool isLogin = false;
  bool isGuest = true;
  String accessCode;
  ChatContract mView;
  ChatPresenter mPresenter;
  AnimationController animationController;
  MySharedPreferences mySharedPreferences = new MySharedPreferences();
  ScrollController controller = new ScrollController();
  Map _latestMessage;
  PusherError _lastError;
  PusherConnectionState pusherConnectionState;
  PusherFlutter pusher = new PusherFlutter(Configs.PUSHER_KEY);


  List<Message> messageList = new List<Message>();
  Pagination pagination;

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
    message = mController.text;
    mPresenter.sendMessage(
        accessCode, message, mArticleId, mDoctorId, mServiceId);
  }

  void _onImageButtonPressed(ImageSource source) {
    setState(() async {
      _imageFile = await ImagePicker.pickImage(source: source);
      mPresenter.sendImage(accessCode, _imageFile.path, null, null, null);
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
    message = text;
    print('Message is$message');
  }

  Widget getChatImageAndChatView(Message m, int type) {
    var bgColor =
        type == 0 ? MyStyle.defaultGrey : MyStyle.chatRespondBackground;
    //var logo = type == 0 ? 'assets/images/lyc.png' : 'assets/images/lyc.png';
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
    //var bgColor =
    //  type == 0 ? MyStyle.defaultGrey : MyStyle.chatRespondBackground;
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
    if (index == messageList.length) {
      if (pagination.currentPage == pagination.lastPage) {
        return new Container(
          child: null,
        );
      } else {
        return new Container(
          padding: const EdgeInsets.symmetric(vertical: 5.0),
          child: new Center(
            child: BaseWidgets.loadingIndicator,
          ),
        );
      }
    } else {
      Message msg = messageList[index];
      int type = msg.reply ? 1 : 0;
      return new SizeTransition(
          sizeFactor: new CurvedAnimation(
              parent: animationController, curve: Curves.elasticIn),
          child: new Container(
            child: getChatView(msg, type),
          ));
    }
  }

  @override
  void initState() {
    super.initState();
    mView = this;

    /*pusher.onConnectivityChanged.listen((s) {
      //pusherConnectionState =  s;

      if (s == PusherConnectionState.connected) {
        _lastError = null;
      }
    });
    pusher.onError.listen((err) => _lastError = err);
    pusherConnectionState = PusherConnectionState.disconnected;*/

    mySharedPreferences
        .getBooleanData(Configs.PREF_USER_LOGIN)
        .then((val) => setState(() {
              isLogin = val != null ? val : false;
              getAccessCode(isLogin);
            }));

    controller.addListener(() {
      if (controller.position.pixels == controller.position.maxScrollExtent) {
        if (pagination.currentPage < pagination.lastPage)
          mPresenter.getMoreChatHistory(accessCode, pagination.currentPage + 1);
      }
    });

    animationController = new AnimationController(
        duration: new Duration(microseconds: 200), vsync: this);

    animationController.forward();
  }

  void connect() {
    pusher.connect();
    pusher.subscribe("notification$accessCode", "message");
    //pusher.subscribeAll("notification$accessCode", ["message"]);

    pusher.onMessage.listen((m) => print(m.toString()));

      /*setState(() {
        _latestMessage = pusher.body;
        print('Last Message$_latestMessage');
      });*/
    //});
  }

  void disconnect() {
    pusher.unsubscribe("test_channel");
    pusher.unsubscribe("test_channel2");
    pusher.disconnect();
  }

  void getAccessCode(bool login) {
    if (login) {
      isGuest = false;
      mySharedPreferences.getStringData(Configs.PREF_USER_ACCESSCODE).then((v) {
        accessCode = v;
        connect();
        mPresenter.getChatHistory(accessCode);
      });

    } else {
      isGuest = true;
      accessCode = Configs.GUEST_CODE;
      mPresenter.getChatHistory(accessCode);
    }
  }

  Widget _showLoadingOrData() {
    if (messageList != null || messageList.length > 0) {
      return new Container(
          color: MyStyle.layoutBackground,
          child: new Column(
            children: <Widget>[
              new Flexible(
                child: new ListView.builder(
                  reverse: true,
                  itemBuilder: _buildChartItem,
                  itemCount: pagination != null
                      ? messageList.length + 1
                      : messageList.length,
                  controller: controller,
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
          ));
    } else {
      return new Container(
        child: new Center(child: BaseWidgets.loadingIndicator),
      );
    }
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
        body: _showLoadingOrData());
  }

  @override
  void setPagination(Pagination p) {
    setState(() {
      pagination = p;
    });
    print(pagination.toString());
  }

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
      //messageList.add(m);
      messageList.insert(0, m);
      print("New Message");
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
