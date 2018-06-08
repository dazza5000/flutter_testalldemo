import 'package:json_annotation/json_annotation.dart';
part 'review.g.dart';

@JsonSerializable()
class Review {
  int id;
  String image;
  int user;
  String username;
  int doctor;
  int article;
  String mesg;
  bool canDelete;
  bool hasReply;
  int replyCount;
  var createDate;
  var timeAgo;

  Review(
      this.id,
      this.image,
      this.user,
      this.username,
      this.doctor,
      this.article,
      this.mesg,
      this.canDelete,
      this.hasReply,
      this.replyCount,
      this.createDate,
      this.timeAgo);

  factory Review.fromJson(Map<String, dynamic> json) => _$ReviewFromJson(json);
}
