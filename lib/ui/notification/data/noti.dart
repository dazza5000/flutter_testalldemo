import 'package:lyc_clinic/ui/notification/data/data.dart';
import 'package:lyc_clinic/base/data/pagination.dart';
import 'package:json_annotation/json_annotation.dart';

part 'noti.g.dart';

@JsonSerializable()
class Noti extends Object with _$NotiSerializerMixin{
  Pagination pagination;
  List<Data> data;

  Noti(this.pagination, this.data);

  factory Noti.fromJson(Map<String, dynamic> json) => _$NotiFromJson(json);
}