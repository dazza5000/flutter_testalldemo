import 'dart:async';
import 'package:lyc_clinic/injector.dart';
import 'package:lyc_clinic/ui/home/contract/profile_info_contract.dart';
import 'package:lyc_clinic/ui/home/repository/profile_info_repository.dart';
import 'package:lyc_clinic/ui/home/data/profile_info.dart';

class ProfileInfoPresenter {
  ProfileInfoContract _view;
  ProfileInfoRepository _repository;

  ProfileInfoPresenter(this._view) {
    _repository = new Injector().profileInfoRepository;
  }

  void getProfileInfo(String accessCode) {
    _repository.getProfileInfo(accessCode).then((p) {
      _view.displayProfileLayout(p);
      setProfileInfo(p);
    }).catchError((e) => print(e.toString()));
  }

  void updateProfileInfo(String accessCode, ProfileInfo profileInfo) {
    _repository.updateProfileInfo(accessCode, profileInfo).then((pi) {
      setProfileInfo(pi);
    }).catchError((e) => print(e.toString()));
  }

  void uploadProfileImage(String accessCode, String filePath) async {
    var profileInfo = _repository.uploadProfilePhoto(accessCode, filePath);
    await profileInfo.then((v) {
      setProfileInfo(v);
    });
  }

  void removeAll(String accessCode) {
    _repository.removeAllData();
  }

  String getAge(String date) {
    int y = int.parse(date.substring(0, 4));
    int m = int.parse(date.substring(5, 7));
    int d = int.parse(date.substring(8, date.length));

    var today = new DateTime.now();
    var birthDate = new DateTime(y, m, d);
    if (birthDate.isAfter(today)) throw new Exception("You don't exist yet");
    var todayYear = today.year;
    var birthDateYear = birthDate.year;
    var todayDayOfYear = today.day;
    var birthDateDayOfYear = today.day;
    var todayMonth = today.month;
    var birthDateMonth = birthDate.month;
    var age = todayYear - birthDateYear;
    if ((birthDateDayOfYear - todayDayOfYear) > 3 ||
        (birthDateMonth > todayMonth)) {
      age--;
    } else if ((birthDateMonth == todayMonth) &&
        (birthDateMonth > todayMonth)) {
      age--;
    }
    return age.toString();
  }

  void setProfileInfo(ProfileInfo profileInfo) {
    if (profileInfo.name != "") {
      _view.displayName(profileInfo.name);
    }
    if (profileInfo.image != "") {
      _view.displayImage(profileInfo.image);
    }
    if (profileInfo.gender >= 0) {
      _view.displayGender(profileInfo.gender);
    }

    if (profileInfo.location != "" && profileInfo.subLocation != "") {
      _view.displayLocation(
          "${profileInfo.subLocation}, ${profileInfo.location}");
    }
    if (profileInfo.dob != "") {
      // calculate the age here
      _view.displayAge(getAge(profileInfo.dob));
    }

    if (profileInfo.phone != "") {
      _view.displayPhone(profileInfo.phone);
    }
  }
}
