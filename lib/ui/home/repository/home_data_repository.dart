import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:lyc_clinic/ui/home/repository/home_repository.dart';
import 'package:lyc_clinic/ui/doctors/data/doctor.dart';
import 'package:lyc_clinic/ui/home/repository/health_repository.dart';
import 'package:lyc_clinic/ui/service/data/service.dart';
import 'package:lyc_clinic/ui/home/data/banner_data.dart';
import 'package:lyc_clinic/utils/configs.dart';
import 'package:lyc_clinic/base/data/message.dart';

class HomeDataRepository implements HomeContractRepository {
  JsonDecoder _decoder = new JsonDecoder();
  HealthRepository healthRepository;
  String URL = Configs.LYC_URL + Configs.VERSION_NO + "/";

  @override
  Future<List<Service>> getServices(String accessCode) async {
    print('Get Data$URL');
    http.Response response = await http.get(URL + accessCode + '/service');
    final jsonBody = response.body;
    final statusCode = response.statusCode;

    if (statusCode < 200 || statusCode >= 300 || jsonBody == null) {
      //throw new FetchDataException("Error while getting contacts [StatusCode:$statusCode, Error:${response.error}]");
      print(statusCode);
    }

    List responseBody = _decoder.convert(jsonBody);
    print("Service Response Data $responseBody");
    //final List servicesItems = data[''];
    print('Service Reslut Data Response${responseBody.map((s) => new Service.fromMap(s)).toList()}');
    return responseBody.map((s) => new Service.fromMap(s)).toList();
  }

  @override
  Future<List<BannerData>> getBanner(String accessCode) async {
    http.Response response = await http.get(URL + accessCode + '/banner');
    final jsonBody = response.body;
    final statusCode = response.statusCode;
    if (statusCode < 200 || statusCode >= 300 || jsonBody == null) {
      //throw new FetchDataException("Error while getting contacts [StatusCode:$statusCode, Error:${response.error}]");
      print('Doctor Status code$statusCode');
    }
    List responseBody = _decoder.convert(jsonBody);
    print('Banner Response Data $responseBody');
    return responseBody.map((b) => new BannerData.fromMap(b)).toList();
  }

  @override
  Future<List<Doctor>> getDoctors(String accessCode, int perpage) async {
    http.Response response = await http.get(
        URL + accessCode + '/doctor?perpage=$perpage');
    final jsonBody = response.body;
    final statusCode = response.statusCode;
    if (statusCode < 200 || statusCode >= 300 || jsonBody == null) {
      //throw new FetchDataException("Error while getting contacts [StatusCode:$statusCode, Error:${response.error}]");
      print('Doctor Status code$statusCode');
    }
    final responseBody = _decoder.convert(jsonBody);
    final List responseDoctor = responseBody['data'];
    print('Doctor Response Data $responseDoctor');
    return responseDoctor.map((d) => new Doctor.fromJson(d)).toList();
  }

  @override
  Future<Message> saveDoctor(String accessCode, int doctorId) async{
    http.Response response=await http.post(URL+accessCode+'/doctor/'+doctorId.toString()+'/save');
    final responseBody=response.body;
    final statusCode=response.statusCode;

    if (statusCode < 200 || statusCode >= 300 || responseBody == null) {
      //throw new FetchDataException("Error while getting contacts [StatusCode:$statusCode, Error:${response.error}]");
      print('Doctor Status code$statusCode');
    }
    print('Save Doctor Response $responseBody');
    final jsonBody=_decoder.convert(responseBody);
    return new Message.fromMap(jsonBody);
  }


  @override
  Future<Message> setDoctorAsFavorite(String accessCode, int doctorId) async{
    http.Response response=await http.post(URL+accessCode+'/doctor/'+doctorId.toString()+'/favorite');
    final responseBody=response.body;
    final statusCode=response.statusCode;

    if (statusCode < 200 || statusCode >= 300 || responseBody == null) {
      //throw new FetchDataException("Error while getting contacts [StatusCode:$statusCode, Error:${response.error}]");
      print('Doctor Status code$statusCode');
    }
    print('Favourite Doctor Response $responseBody');
    final jsonBody=_decoder.convert(responseBody);
    return new Message.fromMap(jsonBody);
  }

  @override
  void setBannerLink(String accessCode, int bannerid) async{
    http.Response response=await http.post(URL+accessCode+'/banner/'+bannerid.toString());
    final responseBody=response.body;
    final statusCode=response.statusCode;

    if (statusCode < 200 || statusCode >= 300 || responseBody == null) {
      //throw new FetchDataException("Error while getting contacts [StatusCode:$statusCode, Error:${response.error}]");
      print('Banner Status code$statusCode');
    }
    print('Banner Click Response $responseBody');
  }

  @override
  Future<Message> setShareClick(String accessCode, int doctorid) async{
    http.Response response=await http.post(URL+accessCode+'/doctor/'+doctorid.toString()+'/share');
    final responseBody=response.body;
    final statusCode=response.statusCode;

    if (statusCode < 200 || statusCode >= 300 || responseBody == null) {
      //throw new FetchDataException("Error while getting contacts [StatusCode:$statusCode, Error:${response.error}]");
      print('Doctor Status code$statusCode');
    }
    print('Share Doctor Response $responseBody');
    final jsonBody=_decoder.convert(responseBody);
    return new Message.fromMap(jsonBody);
  }

}