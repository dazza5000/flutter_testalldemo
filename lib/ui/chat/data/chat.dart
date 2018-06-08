import 'package:lyc_clinic/base/data/pagination.dart';
import 'package:lyc_clinic/ui/chat/data/message.dart';
import 'package:json_annotation/json_annotation.dart';

part 'chat.g.dart';

@JsonSerializable()
class Chat extends Object with _$ChatSerializerMixin{
  Pagination pagination;
  List<Message> data;

  Chat(this.pagination, this.data);

  factory Chat.fromJson(Map<String, dynamic> json) => _$ChatFromJson(json);
}