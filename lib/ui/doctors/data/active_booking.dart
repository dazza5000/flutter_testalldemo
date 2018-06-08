import 'package:json_annotation/json_annotation.dart';
part 'active_booking.g.dart';
@JsonSerializable()
class ActiveBooking extends Object with _$ActiveBookingSerializerMixin{
  int id;
  int doctor;
  String doctorName;
  int status;
  String time;
  var rawtime;

  ActiveBooking(this.id, this.doctor, this.doctorName, this.status, this.time,
      this.rawtime); //long

  factory ActiveBooking.fromJson(Map<String, dynamic> json) => _$ActiveBookingFromJson(json);

}
