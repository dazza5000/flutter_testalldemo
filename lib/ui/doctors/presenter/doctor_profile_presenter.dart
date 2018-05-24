import 'package:lyc_clinic/ui/doctors/contract/doctor_profile_contract.dart';
import 'package:lyc_clinic/ui/doctors/repository/doctor_profile_repository.dart';
import 'package:lyc_clinic/injector.dart';

class DoctorProfilePresetner {
  DoctorProfileContract _view;
  DoctorProfileRepository _repository;

  DoctorProfilePresetner(this._view) {
    _repository = new Injector().doctorProfileRepository;
  }

  void getDoctorProfile(String accessCode, int doctorId) {
    _repository.getDoctorProfile(accessCode, doctorId)
        .then((dp) {
      _view.showDoctorInfo(dp.doctor);
      _view.showBookings(dp.booking);
      _view.showDoctorSchedules(dp.doctor.schedule);
      _view.setFavoriteStatus(dp.doctor.fav, dp.doctor.favCount);
      _view.setSaveStatus(dp.doctor.save);
      _view.showReviews(dp.reviews);
    })
        .catchError((_) => _view.onLoadError());
  }


}