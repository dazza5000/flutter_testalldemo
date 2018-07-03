import 'package:json_annotation/json_annotation.dart';

part 'sublocation.g.dart';

@JsonSerializable()
class SubLocation {
  int id;
  String name;
  int location;
  int order;

  SubLocation(this.id, this.name, this.location, this.order);

  SubLocation.fromMap(Map<String, dynamic> map)
      : id = map['id'],
        name = map['name'],
        location = map['location'],
        order = map['order'];

  factory SubLocation.fromJson(Map<String, dynamic> json) =>
      _$SubLocationFromJson(json);
}
