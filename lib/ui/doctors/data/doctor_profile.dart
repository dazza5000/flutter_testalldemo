import 'package:lyc_clinic/ui/doctors/data/doctor.dart';
import 'package:lyc_clinic/ui/comment/data/comment.dart';
import 'package:lyc_clinic/ui/home/data/booking.dart';
import 'package:lyc_clinic/ui/doctors/data/active_booking.dart';
import 'package:json_annotation/json_annotation.dart';
//part 'data.g.dart';

@JsonSerializable()
class DoctorProfile extends Object with _$DoctorProfileSerializerMixin{
  @JsonKey(nullable: false)
  Doctor doctor;
  @JsonKey(nullable: false)
  ActiveBooking activeBooking;
  @JsonKey(nullable: false)
  List<Booking> booking;
  Comment reviews;

  DoctorProfile(this.doctor, this.activeBooking, this.booking, this.reviews);

  /*DoctorProfile.fromMap(Map<String,int> map):
      doctor=map['doctor'];*/
  DoctorProfile.fromJson(Map jsonMap):
      doctor=jsonMap['doctor'];

  factory DoctorProfile.fromJson(Map<String, dynamic> json) => _$DoctorProfileFromJson(json);
}


}