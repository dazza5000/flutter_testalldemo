import 'package:lyc_clinic/ui/base/data/site_info.dart';
import 'package:lyc_clinic/ui/base/data/unread_status.dart';

abstract class HomeContainerContract{
  void showSiteInfo(SiteInfo siteInfo);
  void showUnreadStatus(UnreadStatus u);
  void showEnterPhoneNo();
}