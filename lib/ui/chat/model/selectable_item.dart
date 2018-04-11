import 'package:lyc_clinic/ui/chat/model/image.dart';
import 'package:lyc_clinic/ui/chat/model/message.dart';

class SelectableItem extends Message {
  bool isSelected = false;

  SelectableItem(int id, String mesg, String mesgType, Image image,
      String adminIcon, bool reply, String date, String time, int rawTime,
      int timeAgo, bool isSelected) : super(
      id,
      mesg,
      mesgType,
      image,
      adminIcon,
      reply,
      date,
      time,
      rawTime,
      timeAgo) {
    this.isSelected = isSelected;
  }


}