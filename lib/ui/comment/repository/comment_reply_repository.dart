import 'dart:async';
import 'package:lyc_clinic/ui/comment/data/review.dart';
import 'package:lyc_clinic/ui/comment/data/comment_reply.dart';
import 'package:lyc_clinic/ui/comment/data/reply.dart';
import 'package:lyc_clinic/base/data/message.dart';

abstract class CommentReplyRepository {
  Future<CommentReply> getCommentReplies(String accessCode, int doctorId, int reviewId);

  Future<CommentReply> getMoreCommentReplies(
      String accessCode, int doctorId, int reviewid, int page);

  Future<Message> deleteReply(String accessCode, int doctorId, int reviewid, int replyId);

  Future<Reply> submitReply(
      String accessCode, int doctorId, int reviewid, String mesg, int replyId);

  Future<CommentReply> getArticleCommentReplies(
      String accessCode, int articleId, int commentId);

  Future<CommentReply> getMoreArticleCommmentReplies(
      String accessCode, int replyId, int commentId, int page);

  Future<Message> deleteArticleReply(
      String accessCode, int articleId, int commentId, int replyId);

  Future<Reply> submitArticleReply(String accessCode, int articleId, int commentId,
      String mesg, int replyId);

  void setCommentHeader(Review r);
}
