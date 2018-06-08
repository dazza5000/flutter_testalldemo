import 'package:lyc_clinic/ui/about/contract/about_contract.dart';
import 'package:lyc_clinic/ui/about/repository/about_repository.dart';
import 'package:lyc_clinic/injector.dart';

class AboutPresenter {
  AboutContract _view;
  AboutRepository _repository;

  AboutPresenter(this._view) {
    _repository = new Injector().aboutRepository;
  }

  void getContent(String accessCode) {
    _repository
        .getContent(accessCode)
        .then((c) => _view.showContent(c))
        .catchError((e) => print(e.toString()));
  }
}
