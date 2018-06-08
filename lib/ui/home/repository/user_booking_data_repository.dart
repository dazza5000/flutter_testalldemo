import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:lyc_clinic/utils/configs.dart';
import 'package:lyc_clinic/ui/home/data/user_booking.dart';
import 'package:lyc_clinic/ui/home/repository/user_booking_repository.dart';

class UserBookingDataRepository implements UserBookingRepository {
  JsonDecoder _decoder = new JsonDecoder();
  String URL = Configs.LYC_URL + Configs.VERSION_NO + "/";

  @override
  Future<UserBooking> getBookingList(
      String accessCode, int status, int page) async {
    var _stauts = status == null ? "" : status.toString();

    print('Booking URL${URL + accessCode + '/account/booking?status=' +
        _stauts}');
    http.Response response = await http
        .get(URL + accessCode + '/account/booking?status=' + _stauts);
    final jsonBody = response.body;
    final statusCode = response.statusCode;

    final responseBody = _decoder.convert(jsonBody);
    var userBooking = new UserBooking.fromJson(responseBody);
    print('Booking Response$userBooking');
    return userBooking;
  }

  @override
  Future<UserBooking> getMoreBookingList(
      String accessCode, int status, int page) async {
    http.Response response = await http
        .get(URL + accessCode + '/account/booking?status=' + status.toString());
    final jsonBody = response.body;
    final statusCode = response.statusCode;

    List responseBody = _decoder.convert(jsonBody);
    return null;
  }
}
