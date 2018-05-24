import 'package:lyc_clinic/ui/doctors/data/doctor.dart';
import 'package:lyc_clinic/base/data/pagination.dart';
class Doctors{
  Pagination pagination;
  List<Doctor> doctor;

  Doctors(this.pagination, this.doctor);

  Doctors.fromMap(Map<String, dynamic> map):
        pagination = map['pagination'],
        doctor = map['data'];

}