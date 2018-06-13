import 'dart:async';
import 'package:lyc_clinic/injector.dart';
import 'package:lyc_clinic/ui/home/contract/profile_info_contract.dart';
import 'package:lyc_clinic/ui/home/repository/profile_info_repository.dart';
import 'package:lyc_clinic/ui/home/data/profile_info.dart';

class ProfileInfoPresenter {
  ProfileInfoContract _view;
  ProfileInfoRepository _repository;

  ProfileInfoPresenter(_view) {
    _repository = new Injector().profileInfoRepository;
  }

  void getProfileInfo(String accessCode) {
    _repository.getProfileInfo(accessCode).then((p) {
      _view.displayProfileLayout(p);
    }).catchError((e) => print(e.toString()));
  }

  void updateProfileInfo(String accessCode, ProfileInfo profileInfo) {
    _repository.updateProfileInfo(accessCode, profileInfo);
  }

  void uploadProfileImage(String accessCode, String filePath) {
    _repository.uploadProfilePhoto(accessCode, filePath);
  }

  void removeAll(String accessCode) {
    _repository.removeAllData();
  }
}
