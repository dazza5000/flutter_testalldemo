import 'dart:async';
import 'package:lyc_clinic/ui/service/data/service.dart';
import 'package:lyc_clinic/ui/service/data/health_service.dart';
import 'package:lyc_clinic/ui/service/data/sub_service_details.dart';

abstract class HealthRepository {
  Future<List<Service>> getServices(String accessCode);
  Future<List<HealthService>> getSubServices(String accessCode,int serviceId);
  Future<List<SubServiceDetails>> getServiceDetail(String accessCode,int serviceId,int subServiceId);
}
