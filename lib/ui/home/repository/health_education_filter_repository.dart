import 'dart:async';
import 'package:lyc_clinic/ui/article/data/category.dart';

abstract class HealthEducationFilterRepository{
  Future<List<Category>> getCategoryList( String accessCode);
  //void getContentType(int contentType);
}