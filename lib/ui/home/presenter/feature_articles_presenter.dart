import 'package:lyc_clinic/ui/home/contract/feature_articles_contract.dart';
import 'package:lyc_clinic/ui/home/repository/feature_articles_repository.dart';
import 'package:lyc_clinic/injector.dart';

class FeatureArticlesPresenter {
  FeatureArticlesContract _view;
  FeatureArticlesRepository _repository;

  FeatureArticlesPresenter(this._view) {
    _repository = new Injector().featureArticlesRepository;
  }

  void getFeatureArticles(String accessCode) {
    _repository
        .getFeaturedArticles(accessCode)
        .then((a) => _view.showFeaturedArticle(a))
        .catchError((_) => _view.onLoadError());
  }
}
