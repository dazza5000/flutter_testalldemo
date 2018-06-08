import 'dart:async';
import 'package:lyc_clinic/ui/notification/data/noti.dart';

abstract class NotificationRepository {
  Future<Noti> getNotifications(String accessCode);

  Future<Noti> getMoreNotifications(String accessCode, int page);
}
