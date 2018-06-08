import 'package:json_annotation/json_annotation.dart';
part 'booking.g.dart';
@JsonSerializable(includeIfNull: false)
class Booking extends Object with _$BookingSerializerMixin{
  int id;
  int doctor;
  String doctorName;
  int status;
  String customMesg;
  String time;
  bool rawTime;

  Booking(this.id, this.doctor, this.doctorName, this.status, this.customMesg,
      this.time, this.rawTime);

  factory Booking.fromJson(Map<String, dynamic> json) => _$BookingFromJson(json);

  Booking.fromMap(Map<String, dynamic> map)
      :id=map['id'],
        doctor=map['doctor'],
        doctorName =map['doctorName'],
        status =map['status'],
        customMesg =map['customMesg'],
        time =map['time'],
        rawTime =map['rawTime'];

  @override
  String toString() {
    return 'Booking{id: $id, doctor: $doctor, doctorName: $doctorName, status: $status, customMesg: $customMesg, time: $time, rawTime: $rawTime}';
  }


}