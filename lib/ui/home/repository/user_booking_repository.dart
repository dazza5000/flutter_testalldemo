import 'dart:async';
import 'package:lyc_clinic/ui/home/data/user_booking.dart';


abstract class UserBookingRepository {
  Future<UserBooking> getBookingList(String accessCode, int status, int page);

  Future<UserBooking> getMoreBookingList(
      String accessCode, int status, int page);
}
