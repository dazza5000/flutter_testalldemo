import 'package:json_annotation/json_annotation.dart';
import 'package:lyc_clinic/base/data/pagination.dart';
import 'package:lyc_clinic/ui/article/data/article.dart';
part 'health_edu.g.dart';

@JsonSerializable()
class HealthEducation extends Object with _$HealthEducationSerializerMixin{
  Pagination pagination;
  List<Article> data;

  HealthEducation(this.pagination, this.data);

  HealthEducation.fromMap(Map<String, dynamic> map)
      : pagination = map['pagination'],
        data = map['data'];

  factory HealthEducation.fromJson(Map<String, dynamic> json) =>
      _$HealthEducationFromJson(json);
}