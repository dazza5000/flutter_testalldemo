import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:lyc_clinic/utils/configs.dart';
import 'package:lyc_clinic/ui/home/repository/profile_info_repository.dart';
import 'package:lyc_clinic/ui/home/data/profile_info.dart';

class ProifleInfoDataRepository implements ProfileInfoRepository {
  JsonDecoder _decoder = new JsonDecoder();
  String URL = Configs.LYC_URL + Configs.VERSION_NO + "/";

  @override
  Future<ProfileInfo> getProfileInfo(String accessCode) async {
    http.Response response = await http.get(URL + accessCode + '/account/info');
    final jsonBody = response.body;
    final statusCode = response.statusCode;

    if (statusCode < 200 || statusCode >= 300 || jsonBody == null) {
      //throw new FetchDataException("Error while getting contacts [StatusCode:$statusCode, Error:${response.error}]");
      print(statusCode);
    }

    final responseBody = _decoder.convert(jsonBody);
    return new ProfileInfo.fromMap(responseBody);
  }

  @override
  void updateProfielInfo(String accessCode, ProfileInfo profileInfo) async {
    http.Response response = await http.post(URL +
        accessCode +
        '/account/update?name=' +
        profileInfo.name +
        '&phone=' +
        profileInfo.phone +
        '&location=' +
        profileInfo.location +
        '&subLocation=' +
        profileInfo.subLocation +
        '&gender=' +
        profileInfo.gender.toString() +
        '&birthday=' +
        profileInfo.dob);
    final responseBody = response.body;
    final statusCode = response.statusCode;

    if (statusCode < 200 || statusCode >= 300 || responseBody == null) {
      //throw new FetchDataException("Error while getting contacts [StatusCode:$statusCode, Error:${response.error}]");
      print(statusCode);
    }
    print('Update Profile Info $responseBody');
  }

  @override
  void uploadProfilePhoto(String accessCode, String filePath) async {
    http.Response response =
        await http.post(URL + accessCode + '/account/image');
    final responseBody = response.body;
    final statusCode = response.statusCode;

    if (statusCode < 200 || statusCode >= 300 || responseBody == null) {
      //throw new FetchDataException("Error while getting contacts [StatusCode:$statusCode, Error:${response.error}]");
      print(statusCode);
    }
    print('Update Profile Image $responseBody');
  }

  @override
  void removeAllData() {}
}
