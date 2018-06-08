import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:lyc_clinic/utils/configs.dart';
import 'package:lyc_clinic/ui/doctors/repository/doctor_booking_repository.dart';
import 'package:lyc_clinic/ui/doctors/data/active_booking.dart';
import 'package:lyc_clinic/ui/doctors/data/booking_request.dart';
import 'package:lyc_clinic/ui/doctors/data/schedule.dart';

class DoctorBookingDataRepository implements DoctorBookingRepository {
  JsonDecoder _decoder = new JsonDecoder();
  String URL = Configs.LYC_URL + Configs.VERSION_NO + "/";

  @override
  Future<ActiveBooking> getBookingDetail(
      String accessCode, int doctorId) async {
    http.Response response = await http.get(
        URL + accessCode + '/doctor/' + doctorId.toString() + '/checkbooking');
    final jsonBody = response.body;
    final statusCode = response.statusCode;
    if (statusCode < 200 || statusCode >= 300 || jsonBody == null) {
      //throw new FetchDataException("Error while getting contacts [StatusCode:$statusCode, Error:${response.error}]");
      print('Doctor Status code$statusCode');
    }
    final responseBody = _decoder.convert(jsonBody);
    var activeBooking = new ActiveBooking.fromJson(responseBody);
    return activeBooking;
  }

  @override
  Future<ActiveBooking> checkBooking(String accessCode, int doctorId,
      DateTime date, List<Schedule> scheduleList) async {
    http.Response response = await http.get(
        URL + accessCode + '/doctor/' + doctorId.toString() + '/checkbooking');
    final jsonBody = response.body;
    final statusCode = response.statusCode;
    if (statusCode < 200 || statusCode >= 300 || jsonBody == null) {
      //throw new FetchDataException("Error while getting contacts [StatusCode:$statusCode, Error:${response.error}]");
      print('Doctor Status code$statusCode');
    }
    final responseBody = _decoder.convert(jsonBody);
    var activeBooking = new ActiveBooking.fromJson(responseBody);
    return activeBooking;
  }

  @override
  Future<BookingRequest> requestBooking(
      String accessCode, int doctorId, int schedule, String date) {
    return null;
  }

  @override
  void cancelBooking(String accessCode, int doctorId, int bookingId) {}

  @override
  void setActiveBooking(ActiveBooking activeBooking) {}

  @override
  void setAvailableDates(List<Schedule> scheduleList) {}
}
