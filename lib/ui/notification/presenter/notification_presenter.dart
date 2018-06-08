import 'package:lyc_clinic/ui/notification/contract/notification_contract.dart';
import 'package:lyc_clinic/ui/notification/repository/notification_repository.dart';
import 'package:lyc_clinic/injector.dart';

class NotificationPresenter {
  NotificationContract _view;
  NotificationRepository _repository;

  NotificationPresenter(this._view) {
    _repository = new Injector().notificationRepository;
  }

  void getNoti(String accessCode) {
    _repository
        .getNotifications(accessCode)
        .then((n) => _view.showNotifications(n.data))
        .catchError((e) => print(e.toString()));
  }

  void getMoreNoti(String accessCode,int page) {
    _repository
        .getMoreNotifications(accessCode,page)
        .then((n) => _view.showNotifications(n.data))
        .catchError((e) => print(e.toString()));
  }
}
