import 'package:lyc_clinic/ui/login/contract/login_contract.dart';
import 'package:lyc_clinic/ui/login/repository/login_repository.dart';
import 'package:lyc_clinic/injector.dart';

class LoginPresenter {
  LoginContract _view;
  LoginRepository _repository;

  LoginPresenter(this._view) {
    _repository = new Injector().loginRepository;
  }

  void sendAccessToken(String accessToken) {
    _repository.sendAccessToken(accessToken).then((a) {
      _view.saveDataToPrefs(a);
    }).catchError((e) => print(e.toString()));
  }
}
