import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:lyc_clinic/ui/service/repository/sub_services_details_repository.dart';
import 'package:lyc_clinic/utils/configs.dart';
import 'package:lyc_clinic/ui/service/data/sub_service_details.dart';
import 'package:lyc_clinic/ui/service/data/service.dart';

class SubServicesDetailsDataRepository implements SubServicesDetailsRepository {
  JsonDecoder _decoder = new JsonDecoder();
  String URL = Configs.LYC_URL + Configs.VERSION_NO + "/";

  @override
  Future<SubServiceDetails> getServiceDetail(
      String accessCode, int serviceId, int subServiceId) async {
    http.Response response = await http.get(URL +
        accessCode +
        '/service/' +
        serviceId.toString() +
        '/' +
        subServiceId.toString());
    final jsonBody = response.body;
    final statusCode = response.statusCode;

    if (statusCode < 200 || statusCode >= 300 || jsonBody == null) {
      //throw new FetchDataException("Error while getting contacts [StatusCode:$statusCode, Error:${response.error}]");
      print(statusCode);
    }
    final responseBody = _decoder.convert(jsonBody);
    print('Response body$responseBody');
    return new SubServiceDetails.fromJson(responseBody);
  }

  @override
  Future<List<Service>> getServices(String accessCode) async {
    http.Response response = await http.get(URL + accessCode + '/service');
    final jsonBody = response.body;
    final statusCode = response.statusCode;

    if (statusCode < 200 || statusCode >= 300 || jsonBody == null) {
      //throw new FetchDataException("Error while getting contacts [StatusCode:$statusCode, Error:${response.error}]");
      print(statusCode);
    }
    List responseBody = _decoder.convert(jsonBody);
    return responseBody.map((s) => new Service.fromMap(s)).toList();
  }
}
