import 'package:lyc_clinic/injector.dart';
import 'package:lyc_clinic/ui/doctors/contract/doctor_filter_contract.dart';
import 'package:lyc_clinic/ui/doctors/repository/doctor_filter_repository.dart';

class DoctorFilterPresenter {
  DoctorFilterContract _view;
  DoctorFilterRepository _repository;

  DoctorFilterPresenter(this._view) {
    _repository = new Injector().doctorFilterRepository;
  }

  void getDoctorRole(String accessCode) {
    _repository
        .getRoles(accessCode)
        .then((dr) => _view.showRoles(dr))
        .catchError((e) => print(e.toString()));
  }
}
