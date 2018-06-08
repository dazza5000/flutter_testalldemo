import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:lyc_clinic/utils/configs.dart';
import 'package:lyc_clinic/ui/comment/repository/comment_eidt_repository.dart';
import 'package:lyc_clinic/base/data/message.dart';

class CommentEditDataRepository implements CommentEditRepository {
  JsonDecoder _decoder = new JsonDecoder();
  String URL = Configs.LYC_URL + Configs.VERSION_NO + "/";

  @override
  Future<Message> updateComment(
      String accessCode, int doctorId, int reviewId, String mesg) async {
    http.Response response = await http.post(URL +
        accessCode +
        '/doctor/' +
        doctorId.toString() +
        '/review/' +
        reviewId.toString() +
        '?mesg=' +
        mesg);
    final responseBody = response.body;
    final statusCode = response.statusCode;
    if (statusCode < 200 || statusCode >= 300 || responseBody == null) {
      //throw new FetchDataException("Error while getting contacts [StatusCode:$statusCode, Error:${response.error}]");
      print(statusCode);
    }
    final jsonBody = _decoder.convert(responseBody);
    return new Message.fromMap(jsonBody);
  }

  @override
  Future<Message> updateArticleCommentReply(String accessCode, int articleId,
      int commentId, int replyid, String mesg) async {
    http.Response response = await http.post(URL +
        accessCode +
        '/article/' +
        articleId.toString() +
        '/comment/' +
        commentId.toString() +
        '/reply/' +
        replyid.toString() +
        '?mesg=' +
        mesg);
    final responseBody = response.body;
    final statusCode = response.statusCode;
    print('Response Body$responseBody');
    if (statusCode < 200 || statusCode >= 300 || responseBody == null) {
      //throw new FetchDataException("Error while getting contacts [StatusCode:$statusCode, Error:${response.error}]");
      print(statusCode);
    }
    final jsonBody = _decoder.convert(responseBody);
    return new Message.fromMap(jsonBody);
  }

  @override
  Future<Message> updateArticleComment(
      String accessCode, int articleId, int commentId, String mesg) async {
    http.Response response = await http.post(URL +
        accessCode +
        '/article/' +
        articleId.toString() +
        '/comment/' +
        commentId.toString() +
        '?mesg=' +
        mesg);
    final responseBody = response.body;
    final statusCode = response.statusCode;
    if (statusCode < 200 || statusCode >= 300 || responseBody == null) {
      //throw new FetchDataException("Error while getting contacts [StatusCode:$statusCode, Error:${response.error}]");
      print(statusCode);
    }
    final jsonBody = _decoder.convert(responseBody);
    return new Message.fromMap(jsonBody);
  }

  @override
  Future<Message> updateCommentReply(String accessCode, int doctorId,
      int reviewId, String mesg, int replyid) async {
    http.Response response = await http.post(URL +
        accessCode +
        '/doctor/' +
        doctorId.toString() +
        '/review/' +
        reviewId.toString() +
        '/reply/' +
        replyid.toString() +
        '?mesg=' +
        mesg);
    final responseBody = response.body;
    final statusCode = response.statusCode;
    if (statusCode < 200 || statusCode >= 300 || responseBody == null) {
      //throw new FetchDataException("Error while getting contacts [StatusCode:$statusCode, Error:${response.error}]");
      print(statusCode);
    }
    final jsonBody = _decoder.convert(responseBody);
    return new Message.fromMap(jsonBody);
  }
}
