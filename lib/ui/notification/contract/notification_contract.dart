import 'package:lyc_clinic/base/data/pagination.dart';
import 'package:lyc_clinic/ui/notification/data/noti.dart';
import 'package:lyc_clinic/ui/notification/data/data.dart';

abstract class NotificationContract{
  void showNotifications( List<Data> n);
  void showMoreNotifications( List<Data> n);
  void pagination( Pagination p);
}