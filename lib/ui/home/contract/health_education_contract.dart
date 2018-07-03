import 'package:lyc_clinic/ui/article/data/article.dart';
import 'package:lyc_clinic/base/data/pagination.dart';

abstract class HealthEducationContract{
  void onLoadError();
  void showFilter();
  void showArticles( List<Article> a);
  void showMoreArticles( List<Article> a);
  void showFeaturedArticles( List<Article> a);
  void removeFeaturedArticles();
  void setPagination( Pagination p);
}