import 'package:lyc_clinic/injector.dart';
import 'package:lyc_clinic/ui/doctors/contract/doctor_booking_contract.dart';
import 'package:lyc_clinic/ui/doctors/repository/doctor_booking_repository.dart';
import 'package:lyc_clinic/ui/doctors/data/schedule.dart';

class DoctorBookingPresenter {
  DoctorBookingContract _view;
  DoctorBookingRepository _repository;

  DoctorBookingPresenter(this._view) {
    _repository = new Injector().doctorBookingRepository;
  }

  void getBookingDetail(String accessCode, int doctorId) {
    _repository.getBookingDetail(accessCode, doctorId).then((ab) {
      _view.showBookingDetail(ab);
    }).catchError(() => _view.onLoadError());
  }

  void checkBooking(String accessCode,int doctorId,DateTime date,List<Schedule> scheduleList){
    _repository.checkBooking(accessCode, doctorId, date, scheduleList).then((ab){
      _view.showMessage('Hello Message');
    }).catchError(() => _view.onLoadError());
  }
}
