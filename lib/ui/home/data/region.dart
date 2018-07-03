import 'package:json_annotation/json_annotation.dart';
import 'package:lyc_clinic/ui/home/data/sublocation.dart';

part 'region.g.dart';
@JsonSerializable()
class Region{
  String title ;
  List<SubLocation> items;

  Region(this.title, this.items);

  factory Region.fromJson(Map<String, dynamic> json) =>
      _$RegionFromJson(json);

}