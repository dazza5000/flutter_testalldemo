import 'package:lyc_clinic/ui/home/contract/home_contract.dart';
import 'package:lyc_clinic/ui/home/repository/home_repository.dart';
import 'package:lyc_clinic/injector.dart';
import 'package:lyc_clinic/utils/configs.dart';
import 'package:lyc_clinic/ui/service/data/service.dart';
import 'package:lyc_clinic/ui/doctors/data/doctors.dart';

class HomePresenter {
  HomeContract _view;
  HomeContractRepository _repository;

  HomePresenter(this._view) {
    _repository = new Injector().homeContractRepository;
  }

  void getService(String accessCode) {
    _repository
        .getServices(accessCode)
        .then((s) => _view.showServices(s))
        .catchError((_) => _view.onLoadError());
  }

  void getDoctor(String accessCode, int perPage) {
    _repository
        .getDoctors(accessCode, perPage)
        .then((d) => _view.showDoctors(d))
        .catchError((_) => _view.onLoadError());
  }

  void getBanner(String accessCode) {
    _repository.getBanner(accessCode)
        .then((b) => _view.showBanner(b))
        .catchError((_) => _view.onLoadError());
  }

  void saveDoctor(String accessCode, int doctorId) {
    _repository
        .saveDoctor(accessCode, doctorId)
        .then((m) {})
        .catchError((e) => print(e.toString()));
  }

  void favDoctor(String accessCode, int doctorId) {
    _repository
        .setDoctorAsFavorite(accessCode, doctorId)
        .then((m) {})
        .catchError((e) => print(e.toString()));
  }

  void shareDoctor(String accessCode, int doctorId) {
    _repository
        .setShareClick(accessCode, doctorId)
        .then((m) {})
        .catchError((e) => print(e.to));
  }

}