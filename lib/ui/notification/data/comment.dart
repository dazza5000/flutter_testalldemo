import 'package:json_annotation/json_annotation.dart';

part 'comment.g.dart';

@JsonSerializable()
class Comment {
  int id;
  String user;
  int userId;
  String image;
  String mesg;
  int type;
  String article;
  int articleId;
  var createDate;
  var timeAgo;

  Comment(this.id, this.user, this.userId, this.image, this.mesg, this.type,
      this.article, this.articleId, this.createDate, this.timeAgo);

  factory Comment.fromJson(Map<String, dynamic> json) => _$CommentFromJson(json);
}