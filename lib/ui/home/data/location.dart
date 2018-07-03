import 'package:json_annotation/json_annotation.dart';


class Location {
  int id;
  String name;

  Location(this.id, this.name);

  Location.fromMap(Map<String, dynamic> map)
      : id = map['id'],
        name = map['name'];

  /*factory Location.fromJson(Map<String, dynamic> json) =>
      _$LocationFromJson(json);*/
}
