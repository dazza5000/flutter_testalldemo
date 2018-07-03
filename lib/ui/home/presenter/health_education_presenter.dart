import 'package:lyc_clinic/ui/home/contract/health_education_contract.dart';
import 'package:lyc_clinic/ui/home/repository/health_education_repository.dart';
import 'package:lyc_clinic/injector.dart';

class HealthEducationPresenter {
  HealthEducationContract _view;
  HealthEducationRepository _repository;

  HealthEducationPresenter(this._view) {
    _repository = new Injector().healthEducationRepository;
  }

  void getArticles(String accessCode, int type, List<int> category, int page) {
    _repository.getArticles(accessCode, type, category, page).then((a) {
      _view.showArticles(a.data);
      _view.setPagination(a.pagination);
    }).catchError((e) => print(e.toString()));
  }

  void getMoreArticles(
      String accessCode, int type, List<int> category, int page) {
    _repository.getMoreArticle(accessCode, type, category, page).then((a) {
      _view.showMoreArticles(a.data);
      _view.setPagination(a.pagination);
    }).catchError((e) => print(e.toString()));
  }

  void setFavourite(String accessCode, int articleId) {
    _repository.setFavorite(accessCode, articleId);
  }

  void setShare(String accessCode, int articleId) {
    _repository.setShareClick(accessCode, articleId);
  }

  void saveArticle(String accessCode, int articleId) {
    _repository.saveArticle(accessCode, articleId);
  }
}
