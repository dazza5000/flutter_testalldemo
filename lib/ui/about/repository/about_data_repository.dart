import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:lyc_clinic/utils/configs.dart';
import 'package:lyc_clinic/ui/about/repository/about_repository.dart';
import 'package:lyc_clinic/ui/about/data/about.dart';
class AboutDataRepository implements AboutRepository{
  String URL = Configs.LYC_URL + Configs.VERSION_NO + "/";
  JsonDecoder _decoder = new JsonDecoder();
  
  @override
  Future<About> getContent(String accessCode) async {
    http.Response response=await http.get(URL+accessCode+'/about');
    final responseBody=response.body;
    final statusCode=response.statusCode;
    if (statusCode < 200 || statusCode >= 300 || responseBody == null) {
      //throw new FetchDataException("Error while getting contacts [StatusCode:$statusCode, Error:${response.error}]");
      print(statusCode);
    }
    final jsonBody=_decoder.convert(responseBody);
    return new About.fromMap(jsonBody);
  }
}