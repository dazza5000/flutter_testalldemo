import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:lyc_clinic/utils/configs.dart';
import 'package:lyc_clinic/ui/doctors/repository/doctor_profile_repository.dart';
import 'package:lyc_clinic/ui/doctors/data/doctor.dart';
import 'package:lyc_clinic/ui/doctors/data/doctor_profile.dart';
import 'package:lyc_clinic/ui/comment/data/comment.dart';


class DoctorProfileDataRepository implements DoctorProfileRepository {
  JsonDecoder _decoder = new JsonDecoder();
  String URL = Configs.LYC_URL + Configs.VERSION_NO + "/";

  @override
  Future<DoctorProfile> getDoctorProfile(String accessCode, int doctorId) async {
    http.Response response = await http.get(
        URL + accessCode + '/doctor/$doctorId');
    print('Doctor Profile URL ${URL+accessCode+'/doctor/$doctorId'}');
    final jsonBody = response.body;
    final statusCode = response.statusCode;
    if (statusCode < 200 || statusCode >= 300 || jsonBody == null) {
      //throw new FetchDataException("Error while getting contacts [StatusCode:$statusCode, Error:${response.error}]");
      print('Doctor Status code$statusCode');
    }
    final responseBody=_decoder.convert(jsonBody);
    print('Response Doctor Profile$responseBody');
    print ('Data${responseBody.map((dp) => DoctorProfile.fromJson(dp))}');
    return responseBody.map((dp) => DoctorProfile.fromJson(dp));
  }

  @override
  void getComments(String accessCode, int doctorID, int perPage) {

  }

  @override
  void setShareClick(String accessCode, int doctorid) {

  }

  @override
  void deleteReview(String accessCode, int doctorID, int reviewid) {

  }

  @override
  void cancelBooking(String accessCode, int doctorId, int bookingId) {

  }

  @override
  void save(String accessCode, int doctorId) {

  }

  @override
  void setFavorite(String accessCode, int doctorId) {

  }
}