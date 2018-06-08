import 'package:json_annotation/json_annotation.dart';

part 'about.g.dart';

@JsonSerializable()
class About{
  String featureImage;
  String content;

  About(this.featureImage, this.content);

  About.fromMap(Map<String, dynamic> map):
        featureImage = map['featureImage'],
        content = map['content'];

  factory About.fromJson(Map<String, dynamic> json) => _$AboutFromJson(json);

}