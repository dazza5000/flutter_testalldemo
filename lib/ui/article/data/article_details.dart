import 'package:lyc_clinic/ui/article/data/article.dart';
import 'package:lyc_clinic/ui/comment/data/comment.dart';
import 'package:json_annotation/json_annotation.dart';

part 'article_details.g.dart';

@JsonSerializable()
class ArticleDetails extends Object with _$ArticleDetailsSerializerMixin{
  Article article;
  Comment comment;

  ArticleDetails(this.article, this.comment);

  factory ArticleDetails.fromJson(Map<String, dynamic> json) => _$ArticleDetailsFromJson(json);

}