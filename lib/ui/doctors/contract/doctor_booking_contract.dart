import 'package:lyc_clinic/ui/doctors/data/active_booking.dart';
import 'package:lyc_clinic/base/basecontract.dart';

abstract class DoctorBookingContract extends BaseContract{
  void onLoadError();

  void showBookingDetail(ActiveBooking booking);

  void removeBooking();

  void showSelectedDate(DateTime eata);

  //void showAvailabeDates( List<Calen> availableDates);
  void showAvailableWeeks(List<int> weekDayColors);

  void showBookingRequestForm(
      int schedule, DateTime date, int rawTime, String time, Stringday);
}
