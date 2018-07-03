import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:path/path.dart';
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
    print('Get Profile Info >>$responseBody');
    return new ProfileInfo.fromMap(responseBody);
  }

  @override
  Future<ProfileInfo> updateProfileInfo(
      String accessCode, ProfileInfo profileInfo) async {
    Map lmap = {
      "name": profileInfo.name,
      "phone": profileInfo.phone,
      "location": profileInfo.locationId.toString(),
      "subLocation": profileInfo.subLocationId.toString(),
      "gender": profileInfo.gender.toString(),
      "birthday": profileInfo.dob
    };
    String bodyData = JSON.encode(lmap);

    http.Response response = await http.post(
      URL + accessCode + '/account/update',
      body: lmap,
    );
    final responseBody = response.body;
    final statusCode = response.statusCode;

    if (statusCode < 200 || statusCode >= 300 || responseBody == null) {
      //throw new FetchDataException("Error while getting contacts [StatusCode:$statusCode, Error:${response.error}]");
      print(statusCode);
    }
    var jsonBody = _decoder.convert(responseBody);
    print('Update Profile Image $responseBody');
    return new ProfileInfo.fromMap(jsonBody);
  }

  @override
  Future<ProfileInfo> uploadProfilePhoto(
      String accessCode, String filePath) async {
    bool complete = false;
    var profileInfo;
    if (!complete) {
      var responseBody;
      File imageFile = new File(filePath);
      String strUrl = URL + accessCode + '/account/image';
      var uri = Uri.parse(strUrl);
      var request = new http.MultipartRequest("POST", uri);
      var multipartFile = await http.MultipartFile.fromPath("image", filePath);
      request.files.add(multipartFile);
      http.StreamedResponse response = await request.send();
      response.stream.transform(utf8.decoder).listen((value) {
        print(value);
        responseBody = _decoder.convert(value);
        profileInfo = new ProfileInfo.fromMap(responseBody);
        complete=true;
        return profileInfo;
      });
    } else {
      return profileInfo;
    }

    /*http.MultipartFile.fromPath("image", filePath).then((m) {
      request.files.add(m);
      request.send().then((res) {
        http.StreamedResponse response =res;
        response.stream.transform(utf8.decoder).listen((value) {
          print(value);
          responseBody = _decoder.convert(value);
          return new ProfileInfo.fromMap(responseBody);
        });
      });
    });*/
  }

  @override
  void removeAllData() {
    //MySharedPreferences.clear();
  }
}
