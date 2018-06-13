import 'package:lyc_clinic/injector.dart';
import 'package:lyc_clinic/ui/comment/contract/comment_contract.dart';
import 'package:lyc_clinic/ui/comment/repository/comment_repository.dart';

class CommentPresenter {
  CommentContract _view;
  CommentRepository _repository;

  CommentPresenter(this._view) {
    _repository = new Injector().commentRepository;
  }

  void getComments(String accessCode, int doctorId) {
    _repository.getComments(accessCode, doctorId).then((c) {
      _view.showComments(c.data);
      _view.pagination(c.pagination);
    }).catchError((e) => print(e.toString()));
  }

  void getMoreComment(String accessCode, int doctorId, int page) {
    _repository.getMoreComments(accessCode, doctorId, page).then((c) {
      _view.showComments(c.data);
      _view.pagination(c.pagination);
    }).catchError((e) => print(e.toString()));
  }

  void getArticleComments(String accessCode, int articleId) {
    _repository.getArticleComments(accessCode, articleId).then((c) {
      _view.showComments(c.data);
      _view.pagination(c.pagination);
    }).catchError((e) => print(e.toString()));
  }

  void getMoreArticleComments(String accessCode, int articleId, int page) {
    _repository.getMoreArticleComments(accessCode, articleId, page).then((c) {
      _view.showComments(c.data);
      _view.pagination(c.pagination);
    }).catchError((e) => print(e.toString()));
  }

  void deleteArticleComment(String accessCode, int articleId, int commentId) {
    _repository
        .deleteArticleComment(accessCode, articleId, commentId)
        .then((m) {})
        .catchError((e) => print(e.toString()));
  }

  void deleteArticleCommentReply(
      String accessCode, int articleId, int commentId, int replyId) {
    _repository
        .deleteArticleCommentReply(accessCode, articleId, commentId, replyId)
        .then((m) {})
        .catchError((e) => print(e.toString()));
  }

  void deleteReview(String accessCode, int doctorId, int reviewId) {
    _repository
        .deleteReview(accessCode, doctorId, reviewId)
        .then((m) {})
        .catchError((e) => print(e.toString()));
  }

  void deleteReviewReply(
      String accessCode, int doctorId, int reviewId, int replyId) {
    _repository
        .deleteReplyOfReview(accessCode, doctorId, reviewId, reviewId)
        .then((m) {})
        .catchError((e) => print(e.toString()));
  }

  void submitArticleComment(String accessCode, int articleId, String mesg) {
    _repository.submitArticleComment(accessCode, articleId, mesg).then((r) {
      _view.insertNewComment(r);
    }).catchError((e) => print(e.toString()));
  }

  void submitArticleCommentReply(String accessCode, int articleId,
      int commentId, String mesg, int replyId) {
    _repository
        .submitArticleCommentReply(
            accessCode, articleId, commentId, mesg, replyId)
        .then((r) {})
        .catchError((e) => print(e.toString()));
  }

  void submitReview(String accessCode, int doctorId, String mesg) {
    _repository.submitReview(accessCode, doctorId, mesg).then((r) {
      _view.insertNewComment(r);
    }).catchError((e) => print(e.toString()));
  }
}
