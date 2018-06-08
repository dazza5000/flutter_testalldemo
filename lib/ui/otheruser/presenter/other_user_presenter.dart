import 'package:lyc_clinic/ui/otheruser/repository/other_user_repository.dart';
import 'package:lyc_clinic/ui/otheruser/contract/other_user_contract.dart';
import 'package:lyc_clinic/injector.dart';

class OtherUserPresenter {
  OtherUserRepository _repository;
  OtherUserContract _view;

  OtherUserPresenter(this._view) {
    _repository = new Injector().otherUserRepository;
  }

  void getUserActivities(String accessCode, int userId) {
    _repository
        .getUserActivities(accessCode, userId)
        .then((us) => _view.showUserActivities(us.data))
        .catchError((e) => print(e.toString()));
  }

  void getMoreUserActivites(String accessCode, int userId, int page) {
    _repository
        .getMoreUserActivities(accessCode, userId, page)
        .then((us) => _view.showMoreUserActivities(us.data))
        .catchError((e) => print(e.toString()));
  }

  void setFavoriteDoctor(String accessCode, int doctorId) {
    _repository
        .setFavoriteDocotr(accessCode, doctorId)
        .then((m) => _view.showMessage(m.mesg))
        .catchError((e) => print(e.toString()));
  }

  void saveDoctor(String accessCode, int doctorId) {
    _repository
        .saveDoctor(accessCode, doctorId)
        .then((m) => _view.showMessage(m.mesg))
        .catchError((e) => print(e.toString()));
  }

  void setFavoriteArticle(String accessCode, int articleId) {
    _repository
        .setFavoriteDocotr(accessCode, articleId)
        .then((m) => _view.showMessage(m.mesg))
        .catchError((e) => print(e.toString()));
  }

  void saveArticle(String accessCode, int articleId) {
    _repository
        .saveDoctor(accessCode, articleId)
        .then((m) => _view.showMessage(m.mesg))
        .catchError((e) => print(e.toString()));
  }
}
