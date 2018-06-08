import 'package:json_annotation/json_annotation.dart';
part 'schedule.g.dart';

@JsonSerializable()
class Schedule extends Object with _$ScheduleSerializerMixin{
  int id;
  String time;
  var rawTime;
  int range;
  String day;

  Schedule(this.id, this.time, this.rawTime, this.range, this.day);

  factory Schedule.fromJson(Map<String, dynamic> json) => _$ScheduleFromJson(json);

  @override
  String toString() {
    return 'Schedule{id: $id, time: $time, rawTime: $rawTime, range: $range, day: $day}';
  }


}