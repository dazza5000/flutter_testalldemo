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
    _repository
        .getDoctorList(accessCode, role, peraPage, keyword)
        .then((ds) {
          _view.showDoctorList(ds.doctor);
          _view.showPagination(ds.pagination);
    })
        .catchError((_) => _view.onLoadError());
  }

}
