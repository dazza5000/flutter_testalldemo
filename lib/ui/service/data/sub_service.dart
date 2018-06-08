import 'package:json_annotation/json_annotation.dart';
part 'sub_service.g.dart';
@JsonSerializable()
class SubService{
  int id;
  String name;

  SubService(this.id, this.name);

  factory SubService.fromJson(Map<String, dynamic> json) => _$SubServiceFromJson(json);
}