import 'dart:convert';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'package:lyc_clinic/utils/configs.dart';
import 'package:lyc_clinic/ui/doctors/data/doctors.dart';
import 'package:lyc_clinic/ui/doctors/repository/doctor_list_repository.dart';
import 'package:lyc_clinic/base/data/message.dart';

class DoctorListDataRepository implements DoctorListRepository {
  JsonDecoder _decoder = new JsonDecoder();
  String URL = Configs.LYC_URL + Configs.VERSION_NO + "/";

  @override
  Future<Doctors> getDoctorList(
      String accessCode, List<int> roles, int perpage, String keyword) async {
    String filter="";
    String url;
    String roleName="role[]";
    if(roles!=null && roles.length>0){
      for(int i in roles){
        if(filter.length==0)
        filter+="?$roleName=${i}";
        else
          filter+="&$roleName=${i}";
      }
      print("Filter Text$filter");
    }

    url=URL+accessCode + '/doctor'+filter;
    //url=await Uri.encodeComponent(url);

    http.Response response = await http.get(url);
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
  Future<Message> saveDoctor(String accessCode, int doctorId) async {
    http.Response response = await http
        .post(URL + accessCode + '/doctor/' + doctorId.toString() + '/save');

    final responseBody = response.body;
    final statusCode = response.statusCode;

    if (statusCode < 200 || statusCode >= 300 || responseBody == null) {
      //throw new FetchDataException("Error while getting contacts [StatusCode:$statusCode, Error:${response.error}]");
      print(statusCode);
    }
    print('Doctor Save Response' + responseBody);
    final jsonBody = _decoder.convert(responseBody);

    return new Message.fromMap(jsonBody);
  }

  @override
  Future<Message> setDoctorAsFavorite(String accessCode, int doctorId) async {
    http.Response response = await http.post(
        URL + accessCode + '/doctor/' + doctorId.toString() + '/favorite');

    final responseBody = response.body;
    final statusCode = response.statusCode;

    if (statusCode < 200 || statusCode >= 300 || responseBody == null) {
      //throw new FetchDataException("Error while getting contacts [StatusCode:$statusCode, Error:${response.error}]");
      print(statusCode);
    }
    print('Doctor Favorite Response' + responseBody);
    final jsonBody = _decoder.convert(responseBody);

    return new Message.fromMap(jsonBody);
  }

  @override
  Future<Doctors> getMostRecentActiveDoctorList(
      String accessCode, List<int> roles, int perpage) {
    return null;
  }

  @override
  void searchDoctor(String accessCode, String keyword) {}

  @override
  Future<Message> setShareClick(String accessCode, int doctorId) async {
    http.Response response = await http
        .post(URL + accessCode + '/doctor/' + doctorId.toString() + '/share');

    final responseBody = response.body;
    final statusCode = response.statusCode;

    if (statusCode < 200 || statusCode >= 300 || responseBody == null) {
      //throw new FetchDataException("Error while getting contacts [StatusCode:$statusCode, Error:${response.error}]");
      print(statusCode);
    }
    print('Doctor Share Response' + responseBody);
    final jsonBody = _decoder.convert(responseBody);

    return new Message.fromMap(jsonBody);
  }
}
