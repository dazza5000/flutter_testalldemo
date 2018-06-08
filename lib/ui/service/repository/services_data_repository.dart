import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:lyc_clinic/utils/configs.dart';
import 'package:lyc_clinic/ui/service/repository/services_repository.dart';
import 'package:lyc_clinic/ui/service/data/health_service.dart';

class ServicesDataRepository implements ServicesRepository {
  JsonDecoder _decoder = new JsonDecoder();
  String URL = Configs.LYC_URL + Configs.VERSION_NO + "/";

  @override
  Future<HealthService> getSubServices(String accessCode,int catId) async {
    http.Response response = await http
        .get(URL + accessCode + '/service/' + catId.toString());
    print('Service URL ${URL + accessCode + '/service/' +
        catId.toString()}');
    final responseBody = response.body;
    final statusCode = response.statusCode;

    if (statusCode < 200 || statusCode >= 300 || responseBody == null) {
      //throw new FetchDataException("Error while getting contacts [StatusCode:$statusCode, Error:${response.error}]");
      print(statusCode);
    }

    final jsonBody = _decoder.convert(responseBody);
    //List subService=jsonBody['subservice'];
    return new HealthService.fromJson(jsonBody);
  }
}
