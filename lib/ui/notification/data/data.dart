import 'package:lyc_clinic/ui/notification/data/comment.dart';
import 'package:lyc_clinic/ui/notification/data/review.dart';
import 'package:lyc_clinic/ui/notification/data/booking.dart';
import 'package:json_annotation/json_annotation.dart';

part 'data.g.dart';

@JsonSerializable()
class Data extends Object with _$DataSerializerMixin{
  int id;
  Comment commentreply;
  Review reviewreply;
  Booking booking;
  String type;

  Data(this.id, this.commentreply, this.reviewreply, this.booking, this.type);

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);
}