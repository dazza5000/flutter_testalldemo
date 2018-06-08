import 'package:lyc_clinic/ui/home/data/saved_article.dart';
import 'package:lyc_clinic/ui/home/data/saved_doctor.dart';
import 'package:json_annotation/json_annotation.dart';

part 'save.g.dart';

@JsonSerializable()
class Save extends Object with _$SaveSerializerMixin{
  SavedArticle article;
  SavedDoctor doctor;

  Save(this.article, this.doctor);

factory Save.fromJson(Map<String, dynamic> json) =>
_$SaveFromJson(json);

  @override
  String toString() {
    return 'Save{article: $article, doctor: $doctor}';
  }


}