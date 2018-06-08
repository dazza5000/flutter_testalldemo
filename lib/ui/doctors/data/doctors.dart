import 'package:lyc_clinic/ui/doctors/data/doctor.dart';
import 'package:lyc_clinic/base/data/pagination.dart';
import 'package:json_annotation/json_annotation.dart';

part 'doctors.g.dart';

@JsonSerializable()
class Doctors extends Object with _$DoctorsSerializerMixin {
  Pagination pagination;
  @JsonKey(name:'data')
  List<Doctor> doctor;

  Doctors(this.pagination, this.doctor);

  Doctors.fromMap(Map<String, dynamic> map)
      : pagination = map['pagination'],
        doctor = map['data'];

  factory Doctors.fromJson(Map<String, dynamic> json) =>
      _$DoctorsFromJson(json);

  @override
  String toString() {
    return 'Doctors{pagination: $pagination, doctor: $doctor}';
  }


}
