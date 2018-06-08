import 'dart:async';
import 'package:lyc_clinic/ui/comment/data/review.dart';
import 'package:lyc_clinic/ui/comment/data/comment_reply.dart';
import 'package:lyc_clinic/ui/comment/data/reply.dart';
import 'package:lyc_clinic/base/data/message.dart';

abstract class CommentReplyRepository {
  Future<CommentReply> getCommentReplies(String accessCode, int doctorId, int reviewId);

  Future<CommentReply> getMoreCommentReplies(
      String accessCode, int doctorId, int reviewid, int page);

  Future<Message> deleteReply(String accessCode, int doctorId, int reviewid, int replyid);

  Future<Reply> submitReply(
      String accessCode, int doctorId, int reviewid, String mesg, int replyid);

  Future<CommentReply> getArticleCommentReplies(
      String accessCode, int artilceId, int commentId);

  Future<CommentReply> getMoreArticleCommmentReplies(
      String accessCode, int artilceId, int commentId, int page);

  Future<Message> deleteArticleReply(
      String accessCode, int artilceId, int commentId, int replyid);

  Future<Reply> submiteArticleReply(String accessCode, int artilceId, int commentId,
      String mesg, int replyid);

  void setCommentHeader(Review r);
}
