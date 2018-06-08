import 'package:lyc_clinic/ui/article/data/article.dart';
import 'package:json_annotation/json_annotation.dart';

part 'saved_article.g.dart';

@JsonSerializable()
class SavedArticle extends Object with _$SavedArticleSerializerMixin {
  bool fav;
  bool save;
  bool comment;
  Article data;

  SavedArticle(this.fav, this.save, this.comment, this.data);

  factory SavedArticle.fromJson(Map<String, dynamic> json) =>
      _$SavedArticleFromJson(json);
}
