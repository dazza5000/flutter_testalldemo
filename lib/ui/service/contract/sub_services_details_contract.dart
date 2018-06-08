import 'package:lyc_clinic/ui/service/data/sub_service_details.dart';
import 'package:lyc_clinic/ui/service/data/service.dart';

abstract class SubServicesDetailsContract {
  void showServiceDetail(SubServiceDetails s);

  void showServices(List<Service> s);

  void showServicePicker();

  void showServiceDialog();

  void hideServiceDialog();
}
