import 'package:lyc_clinic/base/model/pagination.dart';
import 'package:lyc_clinic/ui/chat/model/message.dart';
class Chat{
  Pagination pagination;
  List<Message> data;

  Chat(this.pagination, this.data);

}