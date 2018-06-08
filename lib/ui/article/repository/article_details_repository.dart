import 'dart:async';
import 'package:lyc_clinic/ui/article/data/article_details.dart';
import 'package:lyc_clinic/ui/comment/data/comment.dart';

abstract class ArticleDetailsRepository {
  Future<ArticleDetails> getArticleDetail(String accessCode, int articleId);

  void saveArticle(String accessCode, int articleId);

  void setFavorite(String accessCode, int articleId);

  void deleteArticleComment(String accessCode, int articleId, int commentId);

  void setShareClick(String accessCode, int articleid);

  Future<Comment> getComments(String accessCode, int articleId, int perPage);
}
