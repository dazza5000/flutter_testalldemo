import 'dart:async';
import 'package:lyc_clinic/ui/doctors/data/doctors.dart';
import 'package:lyc_clinic/base/data/message.dart';

abstract class DoctorListRepository {
  Future<Doctors> getDoctorList(
      String accessCode, List<int> roles, int perpage, String keyword);

  Future<Doctors> loadMoreDoctorList(String accessCode, List<int> roles, int perpage,
      int page, String keyword);

  Future<Message> saveDoctor(String accessCode, int doctorId);

  Future<Message> setDoctorAsFavorite(String accessCode, int doctorId);

  Future<Doctors> getMostRecentActiveDoctorList(
      String accessCode, List<int> roles, int perpage);

  void searchDoctor(String accessCode, String keyword);

  Future<Message> setShareClick(String accessCode, int doctorId);
}
