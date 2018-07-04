import 'package:lyc_clinic/base/data/pagination.dart';
import 'package:lyc_clinic/ui/home/data/save.dart';
import 'package:lyc_clinic/base/contract/basecontract.dart';

abstract class OtherUserContract extends BaseContract{
  void showUserActivities(  List<Save> s);
  void showMoreUserActivities(  List<Save> s);
  void pagination(  Pagination p);
}