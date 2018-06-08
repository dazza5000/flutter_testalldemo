import 'package:json_annotation/json_annotation.dart';

part 'review.g.dart';

@JsonSerializable()
class Review {
  int id;
  String user;
  int userId;
  String image;
  String mesg;
  String doctor;
  int doctorId;
  var createDate;
  var timeAgo;

  Review(this.id, this.user, this.userId, this.image, this.mesg, this.doctor,
      this.doctorId, this.createDate, this.timeAgo);

  factory Review.fromJson(Map<String, dynamic> json) => _$ReviewFromJson(json);


}