import 'package:lyc_clinic/injector.dart';
import 'package:lyc_clinic/ui/article/contract/article_details_contract.dart';
import 'package:lyc_clinic/ui/article/repository/article_details_repository.dart';

class ArticleDetailsPresenter {
  ArticleDetailsContract _view;
  ArticleDetailsRepository _repository;

  ArticleDetailsPresenter(this._view) {
    _repository = new Injector().articleDetailsRepository;
  }

  void getArticleDetail(String accessCode, int articleId) {
    _repository
        .getArticleDetail(accessCode, articleId)
        .then((a) => _view.showArticle(a.article, a.comment.data.length))
        .catchError((e) => print(e.toString()));
  }

  void getComment(String accessCode, int articleId, int perPage) {
    _repository
        .getComments(accessCode, articleId, perPage)
        .then((c) => _view.showComments(c))
        .catchError((e) => print(e.toString()));
  }
}
