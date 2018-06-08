import 'dart:async';
import 'package:lyc_clinic/ui/article/data/article.dart';

abstract class FeatureArticlesRepository {
  Future<List<Article>> getFeaturedArticles(String accessCode);
}
