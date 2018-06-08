import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:lyc_clinic/utils/configs.dart';
import 'package:lyc_clinic/ui/notification/data/noti.dart';
import 'package:lyc_clinic/ui/notification/repository/notification_repository.dart';

class NotificationDataRepository implements NotificationRepository {
  JsonDecoder _decoder = new JsonDecoder();
  String URL = Configs.LYC_URL + Configs.VERSION_NO + "/";

  @override
  Future<Noti> getNotifications(String accessCode) async {
    http.Response response =
        await http.get(URL + accessCode + '/notification');
    final responseBody = response.body;
    final statusCode = response.statusCode;
    if (statusCode < 200 || statusCode >= 300 || responseBody == null) {
      //throw new FetchDataException("Error while getting contacts [StatusCode:$statusCode, Error:${response.error}]");
      print('Noti Status code$statusCode');
    }
    final jsonBody = _decoder.convert(responseBody);
    print('Noti Data$jsonBody');
    var noti = new Noti.fromJson(jsonBody);
    return noti;
  }

  @override
  Future<Noti> getMoreNotifications(String accessCode, int page) async {
    http.Response response = await http
        .get(URL + accessCode + '/notification?page=' + page.toString());
    final responseBody = response.body;
    final statusCode = response.statusCode;
    if (statusCode < 200 || statusCode >= 300 || responseBody == null) {
      //throw new FetchDataException("Error while getting contacts [StatusCode:$statusCode, Error:${response.error}]");
      print('Doctor Status code$statusCode');
    }
    final jsonBody = _decoder.convert(responseBody);
    var moreNoti = new Noti.fromJson(jsonBody);
    return moreNoti;
  }
}
