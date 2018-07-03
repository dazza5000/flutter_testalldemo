import 'package:lyc_clinic/injector.dart';
import 'package:lyc_clinic/ui/home/contract/user_saved_contract.dart';
import 'package:lyc_clinic/ui/home/repository/user_saved_repository.dart';

class UserSavedPresenter {
  UserSavedContract _view;
  UserSavedRepository _repository;

  UserSavedPresenter(this._view) {
    _repository = new Injector().userSavedRepository;
  }

  void getSavedList(String accessCode) {
    _repository
        .getSavedList(accessCode)
        .then((s) {
          _view.showSavedList(s.data);
          _view.setPagination(s.pagination);
    })
        .catchError((e) => print(e.toString()));
  }

  void getMoreSavedList(String accessCode, int page) {
    _repository
        .getMoreSavedList(accessCode, page)
        .then((s) {
          _view.showMoreSavedList(s.data);
          _view.setPagination(s.pagination);
    })
        .catchError((e) => print(e.toString()));
  }

  void setDoctorFav(String accessCode,int doctorId){
    _repository.setFavoriteDocotr(accessCode, doctorId);
  }

  void saveDoctor(String accessCode,int doctorId){
    _repository.saveDoctor(accessCode, doctorId);
  }

  void setArticleFav(String accessCode,int articleId){
    _repository.setFavoriteArticle(accessCode, articleId);
  }

  void saveArticle(String accessCode,int articleId){
    _repository.saveArticle(accessCode, articleId);
  }
}
