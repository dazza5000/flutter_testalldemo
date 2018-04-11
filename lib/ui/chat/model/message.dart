import 'package:lyc_clinic/ui/chat/model/image.dart';

class Message {
  int id;
  String mesg;
  String mesgType;
  Image image;
  String adminIcon;
  bool reply;
  String date;
  String time;
  var rawTime;
  var timeAgo;

  Message(this.id, this.mesg, this.mesgType, this.image, this.adminIcon,
      this.reply, this.date, this.time, this.rawTime, this.timeAgo);


}