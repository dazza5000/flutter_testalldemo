import 'dart:async';
import 'package:lyc_clinic/ui/article/data/article_details.dart';
import 'package:lyc_clinic/ui/comment/data/comment.dart';
import 'package:lyc_clinic/base/data/message.dart';

abstract class VideoDetailsRepository{
  Future<ArticleDetails> getArticleDetail(String accessCode, int articleId);

  Future<Message> saveArticle(String accessCode, int articleId);

  Future<Message> setFavorite(String accessCode, int articleId);

  Future<Message> deleteArticleComment(String accessCode, int articleId, int commentId);

  Future<Message> setShareClick(String accessCode, int articleid);

  Future<Comment> getComments(String accessCode, int articleId, int perPage);
}