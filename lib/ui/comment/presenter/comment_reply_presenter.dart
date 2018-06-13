import 'dart:async';
import 'package:lyc_clinic/injector.dart';
import 'package:lyc_clinic/ui/comment/contract/comment_reply_contract.dart';
import 'package:lyc_clinic/ui/comment/repository/comment_reply_repository.dart';

class CommentReplyPresenter {
  CommentReplyContract _view;
  CommentReplyRepository _repository;

  CommentReplyPresenter(this._view) {
    _repository = new Injector().commentReplyRepository;
  }

  void getCommentReply(String accessCode, int doctorId, int reviewId) {
    _repository.getCommentReplies(accessCode, doctorId, reviewId).then((cr) {
      _view.showReplies(cr.data);
      _view.pagination(cr.pagination);
    }).catchError((e) => print(e.toString()));
  }

  void getArticleCommentReply(String accessCode, int articleId, int commentId) {
    _repository
        .getArticleCommentReplies(accessCode, articleId, commentId)
        .then((cr) {
      _view.showReplies(cr.data);
      _view.pagination(cr.pagination);
    }).catchError((e) => print(e.toString()));
  }

  void getMoreCommentReplies(
      String accessCode, int doctorId, int reviewId, int page) {
    _repository
        .getMoreCommentReplies(accessCode, doctorId, reviewId, page)
        .then((cr) {
      _view.showMoreReplies(cr.data);
    }).catchError((e) => print(e.toString()));
  }

  void getMoreArticleCommentReplies(
      String accessCode, int articleId, int commentId, int page) {
    _repository
        .getMoreArticleCommmentReplies(accessCode, articleId, commentId, page)
        .then((cr) {
      _view.showReplies(cr.data);
    }).catchError((e) => print(e.toString()));
  }

  void deleteReply(String accessCode, int doctorId, int reviewId, int replyId) {
    _repository
        .deleteReply(accessCode, doctorId, reviewId, reviewId)
        .then((m) {})
        .catchError((e) => print(e.toString()));
  }

  void deleteArticleReply(
      String accessCode, int articleId, int commentId, int replyId) {
    _repository
        .deleteArticleReply(accessCode, articleId, commentId, replyId)
        .then((m) {})
        .catchError((e) => print(e.toString()));
  }

  void submitReply(String accessCode, int doctorId, int reviewId,
      String message, int replyId) {
    _repository
        .submitReply(accessCode, doctorId, reviewId, message, replyId)
        .then((r) {
      _view.insertNewComment(r);
    }).catchError((e) => print(e.toString()));
  }

  void submitArticleReply(String accessCode, int articleId, int commentId,
      String message, int replyId) {
    _repository
        .submitArticleReply(accessCode, articleId, commentId, message, replyId)
        .then((r) {
      _view.insertNewComment(r);
    }).catchError((e) => print(e.toString()));
  }


}
