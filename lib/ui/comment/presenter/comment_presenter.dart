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
}
