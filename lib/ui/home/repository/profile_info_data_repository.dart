import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:lyc_clinic/utils/configs.dart';
import 'package:lyc_clinic/ui/home/repository/profile_info_repository.dart';
import 'package:lyc_clinic/ui/home/data/profile_info.dart';
import 'package:lyc_clinic/ui/home/contract/profile_info_contract.dart';
import 'package:lyc_clinic/utils/mySharedPreferences.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfileInfoDataRepository implements ProfileInfoRepository {
  JsonDecoder _decoder = new JsonDecoder();
  String URL = Configs.LYC_URL + Configs.VERSION_NO + "/";
   ProfileInfoContract mView ;
   //SharedPreferences prefs=MySharedPreferences.getPrefs();


  ProfileInfoDataRepository([this.mView]);

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
  Future<ProfileInfo> updateProfileInfo(String accessCode, ProfileInfo profileInfo) async {
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
    var jsonBody=_decoder.convert(responseBody);
    print('Update Profile Image $responseBody');
    return new ProfileInfo.fromMap(jsonBody);
  }

  @override
  Future<ProfileInfo> uploadProfilePhoto(String accessCode, String filePath) async {
    http.Response response =
        await http.post(URL + accessCode + '/account/image');
    final responseBody = response.body;
    final statusCode = response.statusCode;

    if (statusCode < 200 || statusCode >= 300 || responseBody == null) {
      //throw new FetchDataException("Error while getting contacts [StatusCode:$statusCode, Error:${response.error}]");
      print(statusCode);
    }
    var jsonBody=_decoder.convert(responseBody);
    print('Update Profile Image $responseBody');
    return new ProfileInfo.fromMap(jsonBody);
  }

  @override
  void removeAllData() {
    MySharedPreferences.clear();
  }
}
