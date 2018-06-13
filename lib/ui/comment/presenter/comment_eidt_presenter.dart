import 'package:lyc_clinic/ui/comment/contract/comment_edit_contract.dart';
import 'package:lyc_clinic/ui/comment/repository/comment_eidt_repository.dart';
import 'package:lyc_clinic/injector.dart';

class CommentEditPresenter {
  CommentEditContract _view;
  CommentEditRepository _repository;

  CommentEditPresenter(this._view) {
    _repository = new Injector().commentEditRepository;
  }

  void updateComment(
      String accessCode, int doctorId, int reviewId, String mesg) {
    _repository
        .updateComment(accessCode, doctorId, reviewId, mesg)
        .then((m) {
          _view.showMessage(m.mesg);
          _view.dismissDialog();
    })
        .catchError((e) => print(e.toString()));
  }

  void updateArticleCommentReply(
      String accessCode, int articleId, int commentId,int replyId, String mesg) {
    _repository
        .updateArticleCommentReply(accessCode, articleId, commentId, replyId, mesg)
        .then((m) {
          _view.showMessage(m.mesg);
          _view.dismissDialog();
    })
        .catchError((e) => print(e.toString()));
  }

  void updateArticleComment(
      String accessCode, int articleId, int commentId, String mesg) {
    _repository
        .updateArticleComment(accessCode, articleId, commentId, mesg)
        .then((m) {
          _view.showMessage(m.mesg);
          _view.dismissDialog();
    })
        .catchError((e) => print(e.toString()));
  }

  void updateCommentReply(
      String accessCode, int doctorId, int reviewId, String mesg,int replyId) {
    _repository
        .updateCommentReply(accessCode, doctorId, reviewId, mesg, replyId)
        .then((m){
           _view.showMessage(m.mesg);
           _view.dismissDialog();
    }
        )
        .catchError((e) => print(e.toString()));
  }
}

