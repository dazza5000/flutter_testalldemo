import 'package:lyc_clinic/ui/doctors/model/doctor.dart';
import 'package:lyc_clinic/ui/comment/model/comment.dart';
import 'package:lyc_clinic/ui/doctors/model/booking.dart';
import 'package:lyc_clinic/ui/doctors/model/active_booking.dart';

class DoctorProfile {
  Doctor doctor;
  ActiveBooking activeBooking;
  List<Booking> booking;
  Comment reviews;

  DoctorProfile(this.doctor, this.activeBooking, this.booking, this.reviews);

}