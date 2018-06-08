import 'package:lyc_clinic/ui/article/data/article.dart';

abstract class FeatureArticlesContract{
  void onLoadError();
  void showFeaturedArticle(List<Article> a);
  void removeFeaturedArticle();
}