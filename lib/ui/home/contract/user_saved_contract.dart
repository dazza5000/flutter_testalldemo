import 'package:lyc_clinic/base/data/pagination.dart';
import 'package:lyc_clinic/ui/home/data/save.dart';

abstract class UserSavedContract{
  void onLoadError(String err);
  void showSavedList(  List<Save> s);
  void showMoreSavedList(  List<Save> s);
  void pagination(  Pagination p);
}