import 'package:lyc_clinic/ui/comment/data/comment.dart';
import 'package:lyc_clinic/ui/article/data/article.dart';

abstract class ArticleDetailsContract{
  void showArticle(Article a  ,   int commentCount);
  void showComments(Comment  c);
}