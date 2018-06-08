import 'dart:async';
import 'package:lyc_clinic/ui/home/data/profile_info.dart';

abstract class ProfileInfoRepository{
  Future<ProfileInfo> getProfileInfo( String accessCode);
  void updateProfielInfo( String accessCode,  ProfileInfo profileInfo);
  void uploadProfilePhoto( String accessCode,  String filePath);
  void removeAllData();
}