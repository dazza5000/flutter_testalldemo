import 'package:lyc_clinic/ui/home/data/save.dart';
import 'package:lyc_clinic/base/data/pagination.dart';

abstract class UserActivityContract{
  void loadError(String e);
  void showUserActivities( List<Save> s);
  void showMoreUserActivities( List<Save> s);
  void pagination( Pagination p);
}