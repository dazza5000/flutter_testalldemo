import 'package:lyc_clinic/injector.dart';
import 'package:lyc_clinic/ui/home/contract/health_education_filter_contract.dart';
import 'package:lyc_clinic/ui/home/repository/health_education_filter_repository.dart';

class HealthEducationFilterPresenter {
  HealthEducationFilterContract _view;
  HealthEducationFilterRepository _repository;

  HealthEducationFilterPresenter(this._view) {
    _repository = new Injector().healthEducationFilterRepository;
  }

  void getCategory(String accessCode) {
    _repository
        .getCategoryList(accessCode)
        .then((c) => _view.showCategoryList(c))
        .catchError((e) => print(e.toString()));
  }

  /*void getContent(int contentType){
    _repository.getContentType(contentType);
  }*/
}
