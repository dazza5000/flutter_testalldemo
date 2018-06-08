import 'package:lyc_clinic/ui/service/data/service.dart';
import 'package:lyc_clinic/ui/service/data/sub_service.dart';
import 'package:json_annotation/json_annotation.dart';

part 'health_service.g.dart';

@JsonSerializable()
class HealthService extends Object with _$HealthServiceSerializerMixin{
  Service service;
  List<SubService> subservice;

  HealthService(this.service, this.subservice);

  factory HealthService.fromJson(Map<String, dynamic> json) => _$HealthServiceFromJson(json);

}