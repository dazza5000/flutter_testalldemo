import 'dart:async';
import 'package:lyc_clinic/ui/home/data/location.dart';
import 'package:lyc_clinic/ui/home/data/sublocation.dart';
import 'package:lyc_clinic/ui/home/data/region.dart';

abstract class LocationRepository {
  Future<List<Location>> getRegionList(String accessCode);

  Future<List<SubLocation>> getCityList(String accessCode, List<Location> regions);

  Future<List<Region>> matchLocations(List<Location> regions, List<SubLocation> cities);
}
