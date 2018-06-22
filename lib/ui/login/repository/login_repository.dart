import 'dart:async';
import 'package:lyc_clinic/ui/login/data/account.dart';

abstract class LoginRepository{
  Future<Account> sendAccessToken(String accessToken);
}