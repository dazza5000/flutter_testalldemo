import 'dart:async';
import 'package:lyc_clinic/ui/doctors/data/doctor_role.dart';

abstract class DoctorFilterRepository{
  Future<List<DoctorRole>> getRoles(String accessCode);
}