import 'dart:async';
import 'package:lyc_clinic/ui/doctors/data/doctors.dart';

abstract class DoctorListRepository {
  Future<Doctors> getDoctorList(
      String accessCode, List<int> roles, int perpage, String keyword);

  Future<Doctors> loadMoreDoctorList(String accessCode, List<int> roles, int perpage,
      int page, String keyword);

  void saveDoctor(String accessCode, int doctorId);

  void setDoctorAsFavorite(String accessCode, int doctorId);

  Future<Doctors> getMostRecentActiveDoctorList(
      String accessCode, List<int> roles, int perpage);

  void searchDoctor(String accessCode, String keyword);

  void setShareClick(String accessCode, int doctorid);
}
