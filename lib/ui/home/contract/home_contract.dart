import 'package:lyc_clinic/ui/service/data/service.dart';
import 'package:lyc_clinic/ui/doctors/data/doctor.dart';
import 'package:lyc_clinic/ui/home/data/banner_data.dart';

abstract class HomeContract {
  //View
  void onLoadError();

  void showMessage(String message);

  void showErrorMessage(String message);

  void showServices(List<Service> services);

  void showServicePicker();

  void showDoctors(List<Doctor> doctor);

  void showMoreDoctors();

  void showServiceDialog();

  void hideServiceDialog();

  void showDoctorDialog();

  void hideDoctorDialog();

  void showBanner(List<BannerData> banner);
}

