import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:lyc_clinic/utils/configs.dart';
import 'package:lyc_clinic/ui/comment/repository/comment_reply_repository.dart';
import 'package:lyc_clinic/ui/comment/data/review.dart';
import 'package:lyc_clinic/ui/comment/data/comment_reply.dart';
import 'package:lyc_clinic/ui/comment/data/reply.dart';
import 'package:lyc_clinic/base/data/message.dart';

class CommentReplyDataRepository implements CommentReplyRepository {
  JsonDecoder _decoder = new JsonDecoder();
  String URL = Configs.LYC_URL + Configs.VERSION_NO + "/";

  @override
  Future<CommentReply> getCommentReplies(
      String accessCode, int doctorId, int reviewid) async {
    http.Response response = await http.get(URL +
        accessCode +
        '/doctor/' +
        doctorId.toString() +
        '/review/' +
        reviewid.toString() +
        '?perpage=10');
    final responseBody = response.body;
    final statusCode = response.statusCode;

    final jsonBody = _decoder.convert(responseBody);
    var commentReply = new CommentReply.fromJson(jsonBody);
    return commentReply;
  }

  @override
  void setCommentHeader(Review r) {}

  @override
  Future<Reply> submiteArticleReply(String accessCode, int artilceId,
      int commentId, String mesg, int replyid) {
    return null;
  }

  @override
  Future<Message> deleteArticleReply(
      String accessCode, int artilceId, int commentId, int replyid) {
    return null;
  }

  @override
  Future<CommentReply> getMoreArticleCommmentReplies(
      String accessCode, int artilceId, int commentId, int page) {
    return null;
  }

  @override
  Future<CommentReply> getArticleCommentReplies(
      String accessCode, int artilceId, int commentId) async {
    http.Response response = await http.get(URL +
        accessCode +
        '/article/' +
        artilceId.toString() +
        '/comment/' +
        commentId.toString() +
        '?perpage=10');
    final responseBody = response.body;
    final statusCode = response.statusCode;

    final jsonBody = _decoder.convert(responseBody);
    var commentReply = new CommentReply.fromJson(jsonBody);
    return commentReply;
  }

  @override
  Future<Reply> submitReply(
      String accessCode, int doctorId, int reviewid, String mesg, int replyid) {
    return null;
  }

  @override
  Future<Message> deleteReply(
      String accessCode, int doctorId, int reviewid, int replyid) {
    return null;
  }

  @override
  Future<CommentReply> getMoreCommentReplies(
      String accessCode, int doctorId, int reviewid, int page) {
    return null;
  }
}
