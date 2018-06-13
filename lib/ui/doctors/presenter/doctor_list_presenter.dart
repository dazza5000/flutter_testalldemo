import 'package:lyc_clinic/ui/doctors/contract/doctor_list_contract.dart';
import 'package:lyc_clinic/ui/doctors/repository/doctor_list_repository.dart';
import 'package:lyc_clinic/injector.dart';

class DoctorListPresenter {
  DoctorListContract _view;
  DoctorListRepository _repository;

  DoctorListPresenter(this._view) {
    _repository = new Injector().doctorListRepository;
  }

  void getDoctorList(
      String accessCode, List<int> role, int peraPage, String keyword) {
    _repository.getDoctorList(accessCode, role, peraPage, keyword).then((ds) {
      _view.showDoctorList(ds.doctor);
      _view.showPagination(ds.pagination);
    }).catchError((_) => _view.onLoadError());
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
