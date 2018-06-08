import 'dart:async';
import 'package:lyc_clinic/ui/service/data/health_service.dart';

abstract class ServicesRepository{
  Future<HealthService> getSubServices(String accessCode,int catId);
}