import 'package:lyc_clinic/ui/login/data/account.dart';

abstract class LoginContract{
  void showLandingPage();
  void saveDataToPrefs(Account account);
}