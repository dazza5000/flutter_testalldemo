import 'package:lyc_clinic/base/data/pagination.dart';
import 'package:lyc_clinic/ui/home/data/save.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user_saved.g.dart';

@JsonSerializable()
class UserSaved extends Object with _$UserSavedSerializerMixin {
  Pagination pagination;
  List<Save> data;

  UserSaved(this.pagination, this.data);

  factory UserSaved.fromJson(Map<String, dynamic> json) =>
      _$UserSavedFromJson(json);
}
