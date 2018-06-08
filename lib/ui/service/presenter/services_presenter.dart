import 'package:lyc_clinic/injector.dart';
import 'package:lyc_clinic/ui/service/contract/services_contract.dart';
import 'package:lyc_clinic/ui/service/repository/services_repository.dart';

class ServicePresenter {
  ServicesContract _view;
  ServicesRepository _repository;

  ServicePresenter(this._view) {
    _repository = new Injector().servicesRepository;
  }

  void getSubServices(String accessCode,int catId) {
    _repository
        .getSubServices(accessCode,catId)
        .then((s) => _view.showServices(s.subservice))
        .catchError((e) => print(e.toString()));
  }
}
