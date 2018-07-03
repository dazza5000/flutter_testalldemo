import 'dart:convert';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'package:lyc_clinic/ui/home/data/location.dart';
import 'package:lyc_clinic/ui/home/data/sublocation.dart';
import 'package:lyc_clinic/ui/home/data/region.dart';
import 'package:lyc_clinic/utils/configs.dart';
import 'package:lyc_clinic/ui/home/repository/location_repository.dart';
import 'package:lyc_clinic/ui/home/contract/location_contract.dart';

class LocationDataRepository implements LocationRepository {
  LocationContract _view;

  JsonDecoder _decoder = new JsonDecoder();
  String URL = Configs.LYC_URL + Configs.VERSION_NO + "/";

  @override
  Future<List<Location>> getRegionList(String accessCode) async {
    http.Response response = await http.get(URL + accessCode + "/location");
    final responseBody = response.body;
    final statusCode = response.statusCode;

    if (statusCode < 200 || statusCode >= 300 || responseBody == null) {
      //throw new FetchDataException("Error while getting contacts [StatusCode:$statusCode, Error:${response.error}]");
      print(statusCode);
    }

    print('Location Response String$responseBody');
    List jsonBody = _decoder.convert(responseBody);

    return jsonBody.map((l) => new Location.fromMap(l)).toList();
  }

  @override
  Future<List<Region>> matchLocations(List<Location> regions, List<SubLocation> cities) async{
    List<Region> list= List<Region>();
    for (int i = 0; i < regions.length; i++) {
      List<SubLocation> cityList = List<SubLocation>();
      for (int j = 0; j < cities.length; j++) {
        if (regions[i].id == cities[j].location) {
          cityList.add(cities[j]);
        }
      }
      list.add(Region(regions[i].name, cityList));
    }

    return list;
  }

  @override
  Future<List<SubLocation>> getCityList(
      String accessCode, List<Location> regions) async {
    http.Response response = await http.get(URL + accessCode + "/location/sub");
    final responseBody = response.body;
    final statusCode = response.statusCode;

    if (statusCode < 200 || statusCode >= 300 || responseBody == null) {
      //throw new FetchDataException("Error while getting contacts [StatusCode:$statusCode, Error:${response.error}]");
      print(statusCode);
    }

    print('SubLocation Response String$responseBody');
    List jsonBody = _decoder.convert(responseBody);

    return jsonBody.map((l) => new SubLocation.fromMap(l)).toList();
    return null;
  }
}
