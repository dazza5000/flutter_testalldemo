import 'package:json_annotation/json_annotation.dart';

part 'sub_service_details.g.dart';

@JsonSerializable()
class SubServiceDetails extends Object with _$SubServiceDetailsSerializerMixin{
  int id;
  String name;
  String desc;
  String image;
  String shareUrl;

  SubServiceDetails(this.id, this.name, this.desc, this.image, this.shareUrl);

  SubServiceDetails.fromMap(Map<String, dynamic> map)
      : id = map['id'],
        name = map['name'],
        desc = map['desc'],
        image = map['image'],
        shareUrl = map['shareUrl'];

  factory SubServiceDetails.fromJson(Map<String, dynamic> json) =>
      _$SubServiceDetailsFromJson(json);
}
