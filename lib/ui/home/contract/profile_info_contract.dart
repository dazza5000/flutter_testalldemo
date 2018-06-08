import 'package:lyc_clinic/ui/home/data/profile_info.dart';

abstract class ProfileInfoContract {
  void displayProfileLayout(ProfileInfo profileInfo);

  void displayName(String name);

  void displayImage(String image);

  void displayGender(int gender);

  void displayAge(String age);

  void displayLocation(String location);

  void displayPhone(String phone);

  void showLandingPage();
}
