import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:lyc_clinic/utils/configs.dart';
import 'package:lyc_clinic/ui/home/repository/user_activity_repository.dart';
import 'package:lyc_clinic/ui/home/data/user_saved.dart';

class UserActivityDataRepository implements UserActivityRepository {
  String URL = Configs.LYC_URL + Configs.VERSION_NO + "/";
  JsonDecoder _decoder = new JsonDecoder();


  @override
  Future<UserSaved> getUserActivities(String accessCode) async{
    http.Response response =
        await http.get(URL + accessCode + '/account/activity');
    final jsonBody = response.body;
    final statusCode = response.statusCode;
    if (statusCode < 200 || statusCode >= 300 || jsonBody == null) {
      //throw new FetchDataException("Error while getting contacts [StatusCode:$statusCode, Error:${response.error}]");
      print('Doctor Status code$statusCode');
    }
    final responseBody = _decoder.convert(jsonBody);
    var userSaved = new UserSaved.fromJson(responseBody);
    return userSaved;
  }

  @override
  Future<UserSaved> getMoreUserActivities(String accessCode, int page) async {
    http.Response response =
        await http.get(URL + accessCode + '/account/activity?page=${page}');
    final jsonBody = response.body;
    final statusCode = response.statusCode;
    if (statusCode < 200 || statusCode >= 300 || jsonBody == null) {
      //throw new FetchDataException("Error while getting contacts [StatusCode:$statusCode, Error:${response.error}]");
      print('Doctor Status code$statusCode');
    }
    final responseBody = _decoder.convert(jsonBody);
    var userSaved = new UserSaved.fromJson(responseBody);
    return userSaved;
  }

  @override
  void setFavoriteDocotr(String accessCode, int doctorId) async{
    http.Response response = await http
        .post(URL + accessCode + '/doctor/' + doctorId.toString() + '/favorite');
    final responseBody = response.body;
    final statusCode = response.statusCode;

    if (statusCode < 200 || statusCode >= 300 || responseBody == null) {
      //throw new FetchDataException("Error while getting contacts [StatusCode:$statusCode, Error:${response.error}]");
      print(statusCode);
      return;
    }
    print('User Activity Doctor Fav Response' + responseBody);
  }

  @override
  void saveDoctor(String accessCode, int doctorId) async{
    http.Response response = await http
        .post(URL + accessCode + '/doctor/' + doctorId.toString() + '/save');
    final responseBody = response.body;
    final statusCode = response.statusCode;

    if (statusCode < 200 || statusCode >= 300 || responseBody == null) {
      //throw new FetchDataException("Error while getting contacts [StatusCode:$statusCode, Error:${response.error}]");
      print(statusCode);
      return;
    }
    print('User Activity Doctor Save Response' + responseBody);
  }

  @override
  void setFavoriteArticle(String accessCode, int articleId) async{
    http.Response response = await http
        .post(URL + accessCode + '/article/' + articleId.toString() + '/favorite');
    final responseBody = response.body;
    final statusCode = response.statusCode;

    if (statusCode < 200 || statusCode >= 300 || responseBody == null) {
      //throw new FetchDataException("Error while getting contacts [StatusCode:$statusCode, Error:${response.error}]");
      print(statusCode);
      return;
    }
    print('User Activity Article Fav Response' + responseBody);
  }

  @override
  void saveArticle(String accessCode, int articleId) async{
    http.Response response = await http
        .post(URL + accessCode + '/article/' + articleId.toString() + '/save');
    final responseBody = response.body;
    final statusCode = response.statusCode;

    if (statusCode < 200 || statusCode >= 300 || responseBody == null) {
      //throw new FetchDataException("Error while getting contacts [StatusCode:$statusCode, Error:${response.error}]");
      print(statusCode);
      return;
    }
    print('User Activity Article Save Response' + responseBody);
  }
}
