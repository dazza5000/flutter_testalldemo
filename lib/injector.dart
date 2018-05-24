import 'package:lyc_clinic/ui/home/repository/home_repository.dart';
import 'package:lyc_clinic/ui/home/repository/home_data_repository.dart';
import 'package:lyc_clinic/ui/doctors/repository/doctor_profile_data_repository.dart';
import 'package:lyc_clinic/ui/doctors/repository/doctor_profile_repository.dart';

//DI
class Injector {
  static final Injector _singleton = new Injector._internal();

  factory Injector() {
    return _singleton;
  }

  Injector._internal();

  HomeContractRepository get homeContractRepository {
    return new HomeDataRepository();
  }

  DoctorProfileRepository get doctorProfileRepository{
    return new DoctorProfileDataRepository();
  }
}
