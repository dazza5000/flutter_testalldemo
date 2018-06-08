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
}
