import 'package:lyc_clinic/ui/doctors/data/schedule.dart';
import 'package:lyc_clinic/ui/comment/data/comment.dart';
import 'package:lyc_clinic/ui/home/data/booking.dart';
import 'package:lyc_clinic/ui/doctors/data/doctor.dart';
import 'package:lyc_clinic/ui/doctors/data/active_booking.dart';

abstract class DoctorProfileContract{
  void onLoadError();
  void showDoctorSchedules(List<Schedule> schedules);
  void showReviews(Comment comment);
  void showBookings(List<Booking> booking);
  void showDoctorInfo(Doctor doctor);
  void setFavoriteStatus(bool isFav,  int favCount);
  void setSaveStatus(bool isSaved);
  void showRequestedBooking( ActiveBooking activeBooking);
  void hideRequestedBooking();
}