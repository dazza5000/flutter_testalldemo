import 'package:json_annotation/json_annotation.dart';

part 'service.g.dart';

@JsonSerializable()
class Service extends Object with _$ServiceSerializerMixin {
  int id;
  String name;
  String image;

  Service(this.id, this.name, this.image);

  Service.fromMap(Map<String, dynamic> map)
      : id = map['id'],
        name = map['name'],
        image = map['image'];

  factory Service.fromJson(Map<String, dynamic> json) =>
      _$ServiceFromJson(json);
}
