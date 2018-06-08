import 'package:lyc_clinic/ui/doctors/data/doctor.dart';
import 'package:json_annotation/json_annotation.dart';

part 'saved_doctor.g.dart';

@JsonSerializable()
class SavedDoctor extends Object with _$SavedDoctorSerializerMixin{
  bool fav;
  bool save;
  bool comment;
  Doctor data;

  SavedDoctor(this.fav, this.save, this.comment, this.data);

  factory SavedDoctor.fromJson(Map<String, dynamic> json) =>
      _$SavedDoctorFromJson(json);
}