import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:lyc_clinic/ui/home/repository/home_repository.dart';
import 'package:lyc_clinic/ui/doctors/data/doctor.dart';
import 'package:lyc_clinic/ui/home/repository/health_repository.dart';
import 'package:lyc_clinic/ui/service/data/service.dart';
import 'package:lyc_clinic/ui/home/data/banner_data.dart';
import 'package:lyc_clinic/utils/configs.dart';

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
    //print('service items${data.toList().toString()}}');
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
    return responseDoctor.map((d) => new Doctor.fromMap(d)).toList();
  }

  @override
  void saveDoctor(String accessCode, int doctorId) {
    // TODO: implement saveDoctor
  }


  @override
  void setDoctorAsFavorite(String accessCode, int doctorId) {
    // TODO: implement setDoctorAsFavorite
  }

  @override
  void setBannerLink(String accessCode, int bannerid) {
    // TODO: implement setBannerLink
  }

  @override
  void setShareClick(String accessCode, int doctorid) {
    // TODO: implement setShareClick
  }

/*@override
  Future<List<SubServiceDetails>> getServiceDetail(String accessCode,
      int serviceId, int subServiceId) {
    return http.get(Configs.LYC_URL + '/' + accessCode).then((
        http.Response response) {
      final jsonBody = response.body;
      final statusCode = response.statusCode;

      if (statusCode < 200 || statusCode >= 300 || jsonBody == null) {
        //throw new FetchDataException("Error while getting contacts [StatusCode:$statusCode, Error:${response.error}]");
      }

      final servicesContainer = _decoder.convert(jsonBody);
      final List servicesItems = servicesContainer['results'];
      print('service items${servicesItems.toList().toString()}servicesItems}');
      //return servicesItems.map((servicesdata) => new Service.fromMap(servicedata) ).toList();

    });
  }*/


}