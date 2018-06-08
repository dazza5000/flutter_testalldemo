import 'package:lyc_clinic/base/data/pagination.dart';
import 'package:lyc_clinic/ui/comment/data/review.dart';
import 'package:lyc_clinic/ui/comment/data/reply.dart';

abstract class CommentContract {
  void showComments(List<Review> r);

  void showMoreCommensts(List<Review> r);

  void pagination(Pagination p);

  void updateReview(int position, Review review);

  void insertNewComment(Review r);

  void insertNewReply(Reply r);
}
