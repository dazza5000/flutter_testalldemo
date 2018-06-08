import 'dart:async';
import 'package:lyc_clinic/ui/doctors/data/active_booking.dart';
import 'package:lyc_clinic/ui/doctors/data/booking_request.dart';
import 'package:lyc_clinic/ui/doctors/data/schedule.dart';

abstract class DoctorBookingRepository {
  Future<ActiveBooking> getBookingDetail(String accessCode, int doctorId);

  Future<ActiveBooking> checkBooking(String accessCode, int doctorId, DateTime date,
      List<Schedule> scheduleList);

  Future<BookingRequest> requestBooking(String accessCode, int doctorId, int schedule,
      String date);

  void cancelBooking(String accessCode, int doctorId, int bookingId);

  void setActiveBooking(ActiveBooking activeBooking);

  void setAvailableDates(List<Schedule>scheduleList);
}