import 'dart:async';
import 'package:lyc_clinic/ui/home/data/user_saved.dart';
abstract class UserSavedRepository {
  Future<UserSaved> getSavedList(String accessCode);

  Future<UserSaved> getMoreSavedList(String accessCode, int page);

  void saveArticle(String accessCode, int articleId);

  void setFavoriteArticle(String accessCode, int articleId);

  void saveDoctor(String accessCode, int doctorId);

  void setFavoriteDocotr(String accessCode, int doctorId);
}
