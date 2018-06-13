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
      String accessCode, int doctorId, int reviewId) async {
    http.Response response = await http.get(URL +
        accessCode +
        '/doctor/' +
        doctorId.toString() +
        '/review/' +
        reviewId.toString() +
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
  Future<Reply> submitArticleReply(String accessCode, int articleId,
      int commentId, String mesg, int replyId) async {
    http.Response response = await http.post(URL +
        accessCode +
        '/article/' +
        articleId.toString() +
        '/comment/' +
        commentId.toString() +
        '/reply?replyid=' +
        replyId.toString() +
        '&mesg=' +
        mesg);
    final responseBody = response.body;
    final statusCode = response.statusCode;

    if (statusCode < 200 || statusCode >= 300 || responseBody == null) {
      //throw new FetchDataException("Error while getting contacts [StatusCode:$statusCode, Error:${response.error}]");
      print(statusCode);
    }

    final jsonBody = _decoder.convert(responseBody);
    var reply = new Reply.fromJson(jsonBody);
    print('Article Submit $jsonBody');
    return reply;
  }

  @override
  Future<Message> deleteArticleReply(
      String accessCode, int articleId, int commentId, int replyId) async {
    http.Response response = await http.delete(URL +
        accessCode +
        '/article/' +
        articleId.toString() +
        '/comment/' +
        commentId.toString() +
        '/reply/' +
        replyId.toString());
    final responseBody = response.body;
    final statusCode = response.statusCode;

    if (statusCode < 200 || statusCode >= 300 || responseBody == null) {
      //throw new FetchDataException("Error while getting contacts [StatusCode:$statusCode, Error:${response.error}]");
      print(statusCode);
    }

    final jsonBody = _decoder.convert(responseBody);
    var message = new Message.fromMap(jsonBody);
    print('Article Delete $jsonBody');
    return message;
  }

  @override
  Future<CommentReply> getMoreArticleCommmentReplies(
      String accessCode, int articleId, int commentId, int page) async {
    http.Response response = await http.get(URL +
        accessCode +
        '/article/' +
        articleId.toString() +
        '/comment/' +
        commentId.toString() +
        '?perpage=' +
        page.toString());
    final responseBody = response.body;
    final statusCode = response.statusCode;

    if (statusCode < 200 || statusCode >= 300 || responseBody == null) {
      //throw new FetchDataException("Error while getting contacts [StatusCode:$statusCode, Error:${response.error}]");
      print(statusCode);
    }

    final jsonBody = _decoder.convert(responseBody);
    var commentReply = new CommentReply.fromJson(jsonBody);
    return commentReply;
  }

  @override
  Future<CommentReply> getArticleCommentReplies(
      String accessCode, int articleId, int commentId) async {
    http.Response response = await http.get(URL +
        accessCode +
        '/article/' +
        articleId.toString() +
        '/comment/' +
        commentId.toString() +
        '?perpage=10');
    final responseBody = response.body;
    final statusCode = response.statusCode;

    if (statusCode < 200 || statusCode >= 300 || responseBody == null) {
      //throw new FetchDataException("Error while getting contacts [StatusCode:$statusCode, Error:${response.error}]");
      print(statusCode);
    }

    final jsonBody = _decoder.convert(responseBody);
    var commentReply = new CommentReply.fromJson(jsonBody);
    return commentReply;
  }

  @override
  Future<Reply> submitReply(String accessCode, int doctorId, int reviewId,
      String mesg, int replyId) async {
    http.Response response = await http.post(URL +
        accessCode +
        '/doctor/' +
        doctorId.toString() +
        '/review/' +
        reviewId.toString() +
        '/reply?replyid=' +
        replyId.toString() +
        '&mesg=' +
        mesg);
    final responseBody = response.body;
    final statusCode = response.statusCode;

    if (statusCode < 200 || statusCode >= 300 || responseBody == null) {
      //throw new FetchDataException("Error while getting contacts [StatusCode:$statusCode, Error:${response.error}]");
      print(statusCode);
    }

    final jsonBody = _decoder.convert(responseBody);
    var reply = new Reply.fromJson(jsonBody);
    print('Doctor Submit $jsonBody');
    return reply;
  }

  @override
  Future<Message> deleteReply(
      String accessCode, int doctorId, int reviewId, int replyId) async {
    http.Response response = await http.delete(URL +
        accessCode +
        '/doctor/' +
        doctorId.toString() +
        '/review/' +
        reviewId.toString() +
        '/reply/' +
        replyId.toString());
    final responseBody = response.body;
    final statusCode = response.statusCode;

    if (statusCode < 200 || statusCode >= 300 || responseBody == null) {
      //throw new FetchDataException("Error while getting contacts [StatusCode:$statusCode, Error:${response.error}]");
      print(statusCode);
    }

    final jsonBody = _decoder.convert(responseBody);
    var message = new Message.fromMap(jsonBody);
    return message;
  }

  @override
  Future<CommentReply> getMoreCommentReplies(
      String accessCode, int doctorId, int reviewId, int page) async {
    http.Response response = await http.get(URL +
        accessCode +
        '/doctor/' +
        doctorId.toString() +
        '/review/' +
        reviewId.toString() +
        '?perpage=' +
        page.toString());
    final responseBody = response.body;
    final statusCode = response.statusCode;

    if (statusCode < 200 || statusCode >= 300 || responseBody == null) {
      //throw new FetchDataException("Error while getting contacts [StatusCode:$statusCode, Error:${response.error}]");
      print(statusCode);
    }

    final jsonBody = _decoder.convert(responseBody);
    var commentReply = new CommentReply.fromJson(jsonBody);
    return commentReply;
  }
}
