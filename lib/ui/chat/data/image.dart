import 'package:json_annotation/json_annotation.dart';

part 'image.g.dart';

@JsonSerializable()
class Image{
  String thumb;
  String small;
  String original;

  Image(this.thumb, this.small, this.original);

  factory Image.fromJson(Map<String, dynamic> json) => _$ImageFromJson(json);
}