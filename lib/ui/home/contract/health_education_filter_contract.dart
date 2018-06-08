import 'package:lyc_clinic/ui/article/data/category.dart';

abstract class HealthEducationFilterContract {
  void showCategoryList(List<Category> c);

  void showContentType(int contentType);
}
