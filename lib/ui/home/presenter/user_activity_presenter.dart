import 'package:lyc_clinic/injector.dart';
import 'package:lyc_clinic/ui/home/repository/user_activity_repository.dart';
import 'package:lyc_clinic/ui/home/contract/user_activity_contract.dart';

class UserActivityPresenter {
  UserActivityContract _view;
  UserActivityRepository _repository;

  UserActivityPresenter(this._view) {
    _repository = new Injector().userActivityRepository;
  }

  void getUserActivity(String accessCode) {
    _repository
        .getUserActivities(accessCode)
        .then((us) => _view.showUserActivities(us.data))
        .catchError((e) => print(e.toString()));
  }

  void getMoreUserActivity(String accessCode, int page) {
    _repository
        .getMoreUserActivities(accessCode, page)
        .then((us) => _view.showMoreUserActivities(us.data))
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
