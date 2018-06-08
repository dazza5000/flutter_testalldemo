import 'dart:async';
import 'package:lyc_clinic/ui/home/data/user_saved.dart';
import 'package:lyc_clinic/base/data/message.dart';

abstract class OtherUserRepository{
  Future<UserSaved> getUserActivities( String accessCode, int userId);
  Future<UserSaved> getMoreUserActivities( String accessCode, int userId, int page);
  Future<Message> saveArticle( String accessCode, int articleId);
  Future<Message> setFavoriteArticle( String accessCode, int articleId);
  Future<Message> saveDoctor( String accessCode, int doctorId);
  Future<Message> setFavoriteDocotr( String accessCode, int doctorId);
}