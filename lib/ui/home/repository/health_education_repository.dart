import 'dart:async';
import 'package:lyc_clinic/ui/article/data/health_edu.dart';
import 'package:lyc_clinic/ui/article/data/article.dart';

abstract class HealthEducationRepository {
  Future<HealthEducation> getArticles(String accessCode, int type, List<int> category, int page);

  Future<List<Article>> getFeaturedArticles(String accessCode);

  Future<HealthEducation> getMoreArticle(
      String accessCode, int type, List<int> category, int page);

  void saveArticle(String accessCode, int articleId);

  void setFavorite(String accessCode, int articleId);

  void setShareClick(String accessCode, int articleid);
}
