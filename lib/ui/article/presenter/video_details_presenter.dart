import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:lyc_clinic/utils/configs.dart';
import 'package:lyc_clinic/injector.dart';
import 'package:lyc_clinic/ui/article/contract/video_details_contract.dart';
import 'package:lyc_clinic/ui/article/repository/video_details_repository.dart';

class VideoDetailsPresenter {
  VideoDetailsContract _view;
  VideoDetailsRepository _repository;

  VideoDetailsPresenter(this._view) {
    _repository = new Injector().videoDetailsRepository;
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

  void saveArticle(String accessCode, int articleId) {
    _repository
        .saveArticle(accessCode, articleId)
        .then((m) {})
        .catchError((e) => print(e.toString()));
  }

  void setFavorite(String accessCode, int articleId) {
    _repository
        .setFavorite(accessCode, articleId)
        .then((m) {})
        .catchError((e) => print(e.toString()));
  }

  void setShareClick(String accessCode, int articleId) {
    _repository
        .setShareClick(accessCode, articleId)
        .then((m) {})
        .catchError((e) => print(e.toString()));
  }
}
