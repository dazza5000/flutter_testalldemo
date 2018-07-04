import 'dart:async';
import 'package:lyc_clinic/ui/base/data/site_info.dart';
import 'package:lyc_clinic/ui/base/data/unread_status.dart';
import 'package:lyc_clinic/ui/home/data/profile_info.dart';

abstract class HomeContainerRepository {
  Future<SiteInfo> getSiteInfo(String accessCode);

  Future<UnreadStatus> getUnreadStatus(String accessCode);

  Future<ProfileInfo> getProfileInfo(String accessCode);

  Future<ProfileInfo> updateUserPhoneNo(String accessCode, String phone);
}
