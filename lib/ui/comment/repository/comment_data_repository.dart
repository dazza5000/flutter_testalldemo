import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:lyc_clinic/utils/configs.dart';
import 'package:lyc_clinic/ui/comment/repository/comment_repository.dart';
import 'package:lyc_clinic/ui/comment/data/comment.dart';
import 'package:lyc_clinic/base/data/message.dart';
import 'package:lyc_clinic/ui/comment/data/reply.dart';
import 'package:lyc_clinic/ui/comment/data/review.dart';

class CommentDataRepository implements CommentRepository {
  JsonDecoder _decoder = new JsonDecoder();
  String URL = Configs.LYC_URL + Configs.VERSION_NO + "/";

  @override
  Future<Comment> getComments(String accessCode, int doctorID) async {
    print('URL ${URL + accessCode + '/doctor/' + doctorID.toString() + '/review?perpage=10'}');
    http.Response response =
        await http.get(URL + accessCode + '/doctor/' + doctorID.toString() + '/review?perpage=10');
    final jsonBody = response.body;
    final statusCode = response.statusCode;

    final responseBody = _decoder.convert(jsonBody);
    var comment = new Comment.fromJson(responseBody);
    print('Doctor Comment Data${comment.toString()}');
    return comment;
  }

  @override
  Future<Message> deleteArticleCommentReply(
      String accessCode, int articleId, int commentId, int replyId) {
    return null;
  }

  @override
  Future<Message> deleteArticleComment(
      String accessCode, int articleId, int commentId) async {
    return null;
  }

  @override
  Future<Message> editArticleCommentReply(String accessCode, int articleId,
      int commentId, int replyId, String mesg) {
    return null;
  }

  @override
  Future<Message> editArticleComment(
      String accessCode, int articleId, int commentId, String mesg) {
    return null;
  }

  @override
  Future<Reply> submitArticleCommentReply(String accessCode, int articleId,
      int commentId, String mesg, int replyId) {
    return null;
  }

  @override
  Future<Review> submiteArticleComment(
      String accessCode, int articleId, String mesg) {
    return null;
  }

  @override
  Future<Comment> getMoreArticleComments(
      String accessCode, int articleId, int page) async{
    http.Response response =
        await http.get(URL + accessCode + '/article/' + articleId.toString() + '/comment?perpage=10&page='+page.toString());
    final jsonBody = response.body;
    final statusCode = response.statusCode;

    final responseBody = _decoder.convert(jsonBody);
    var comment = new Comment.fromJson(responseBody);
    print('Article Comment Data${comment.toString()}');
    return comment;
  }

  @override
  Future<Comment> getArticleComments(String accessCode, int articleId) async{
    print('URL ${URL + accessCode + '/article/' + articleId.toString() + '/comment?perpage=10'}');
    http.Response response =
    await http.get(URL + accessCode + '/article/' + articleId.toString() + '/comment?perpage=10');
    final jsonBody = response.body;
    final statusCode = response.statusCode;

    final responseBody = _decoder.convert(jsonBody);
    var comment = new Comment.fromJson(responseBody);
    print('Article Comment Data${comment.toString()}');
    return comment;
  }

  @override
  Future<Message> deleteReplyOfReview(
      String accessCode, int doctorID, int reviewid, int replyId) {
    return null;
  }

  @override
  Future<Message> deleteReview(String accessCode, int doctorID, int reviewid) {
    return null;
  }

  @override
  Future<Message> editReviewReply(
      String accessCode, int doctorID, int reviewid, String mesg, int replyId) {
    return null;
  }

  @override
  Future<Message> editReview(
      String accessCode, int doctorID, int reviewid, String mesg) {
    return null;
  }

  @override
  Future<Review> submitReview(
      String accessCode, int doctorID, String mesg, int position) {
    return null;
  }

  @override
  Future<Comment> getMoreComments(String accessCode, int doctorID, int page) async{
    http.Response response =
        await http.get(URL + accessCode + '/doctor/' + doctorID.toString() + '/review?perpage=10&page='+page.toString());
    final jsonBody = response.body;
    final statusCode = response.statusCode;

    final responseBody = _decoder.convert(jsonBody);
    var comment = new Comment.fromJson(responseBody);
    print('Doctor Comment Data${comment.toString()}');
    return comment;
  }
}
