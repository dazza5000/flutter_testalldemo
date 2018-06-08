import 'package:json_annotation/json_annotation.dart';
part 'booking.g.dart';

@JsonSerializable()
class Booking extends Object with _$BookingSerializerMixin{
  int doctor;
  String doctorName;
  String status;
  String customMesg;
  String time;
  var rawtime;

  Booking(this.doctor, this.doctorName, this.status, this.customMesg,
      this.time, this.rawtime);

}