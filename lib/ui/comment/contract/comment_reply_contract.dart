import 'package:lyc_clinic/ui/comment/data/reply.dart';
import 'package:lyc_clinic/base/data/pagination.dart';
import 'package:lyc_clinic/ui/comment/data/review.dart';

abstract class CommentReplyContract {
  void showReplies(List<Reply> replies);

  void showMoreReplies(List<Reply> replies);

  void pagination(Pagination p);

  void insertNewComment(Reply r);

  void updateCommentReply(int position, Reply commentReply);

  void showCommentHeader(Review r, String dateTime);
}
