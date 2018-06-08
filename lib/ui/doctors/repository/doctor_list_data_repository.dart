import 'dart:convert';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'package:lyc_clinic/utils/configs.dart';
import 'package:lyc_clinic/ui/doctors/data/doctors.dart';
import 'package:lyc_clinic/ui/doctors/repository/doctor_list_repository.dart';

class DoctorListDataRepository implements DoctorListRepository {
  JsonDecoder _decoder = new JsonDecoder();
  String URL = Configs.LYC_URL + Configs.VERSION_NO + "/";

  @override
  Future<Doctors> getDoctorList(
      String accessCode, List<int> roles, int perpage, String keyword) async {
    http.Response response = await http.get(URL + accessCode + '/doctor');
    final jsonBody = response.body;
    final statusCode = response.statusCode;
    if (statusCode < 200 || statusCode >= 300 || jsonBody == null) {
      //throw new FetchDataException("Error while getting contacts [StatusCode:$statusCode, Error:${response.error}]");
      print('Doctor Status code$statusCode');
    }
    final responseBody = _decoder.convert(jsonBody);
    print('json String$responseBody');
    var ds = new Doctors.fromJson(responseBody);
    print('Doctro List${ds.toString()}');
    return ds;
  }

  @override
  Future<Doctors> loadMoreDoctorList(String accessCode, List<int> roles,
      int perpage, int page, String keyword) async {
    print("Load More");
    http.Response response = await http.get(URL + accessCode + '/doctor');
    final jsonBody = response.body;
    final statusCode = response.statusCode;
    if (statusCode < 200 || statusCode >= 300 || jsonBody == null) {
      //throw new FetchDataException("Error while getting contacts [StatusCode:$statusCode, Error:${response.error}]");
      print('Doctor Status code$statusCode');
    }
    final responseBody = _decoder.convert(jsonBody);
    //return responseBody.map((d) => new Doctors.fromJson(d)).toList();
    var ds = new Doctors.fromJson(responseBody);
    return ds;
  }

  @override
  void saveDoctor(String accessCode, int doctorId) {
    Future<http.Response> postResponse = http
        .post(URL + accessCode + '/doctor/' + doctorId.toString() + '/save');
    /*final responseBody = postResponse.whenComplete(action);
    final statusCode = postResponse.statusCode;

    if (statusCode < 200 || statusCode >= 300 || responseBody == null) {
      //throw new FetchDataException("Error while getting contacts [StatusCode:$statusCode, Error:${response.error}]");
      print(statusCode);
      return;
    }
    print('Article Share Response' + responseBody);*/
  }

  @override
  void setDoctorAsFavorite(String accessCode, int doctorId) {}

  @override
  Future<Doctors> getMostRecentActiveDoctorList(
      String accessCode, List<int> roles, int perpage) {
    return null;
  }

  @override
  void searchDoctor(String accessCode, String keyword) {}

  @override
  void setShareClick(String accessCode, int doctorid) {

  }
}
