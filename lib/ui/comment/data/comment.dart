import 'package:lyc_clinic/base/data/pagination.dart';
import 'package:lyc_clinic/ui/comment/data/review.dart';
import 'package:json_annotation/json_annotation.dart';

part 'comment.g.dart';
@JsonSerializable()
class Comment extends Object with _$CommentSerializerMixin{
  Pagination pagination;
  List<Review> data;

  Comment(this.pagination, this.data);

  factory Comment.fromJson(Map<String, dynamic> json) => _$CommentFromJson(json);

  @override
  String toString() {
    return 'Comment{pagination: $pagination, data: $data}';
  }


}