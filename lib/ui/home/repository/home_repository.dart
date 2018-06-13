import 'dart:async';
import 'package:lyc_clinic/ui/service/data/service.dart';
import 'package:lyc_clinic/ui/doctors/data/doctor.dart';
import 'package:lyc_clinic/ui/home/data/banner_data.dart';
import 'package:lyc_clinic/base/data/message.dart';

abstract class HomeContractRepository {
  Future<List<Service>> getServices(String accessCode);

  Future<List<Doctor>> getDoctors(String accessCode, int perpage);

  Future<List<BannerData>> getBanner(String accessCode);

  Future<Message> saveDoctor(String accessCode, int doctorId);

  Future<Message> setDoctorAsFavorite(String accessCode, int doctorId);

  void setBannerLink(String accessCode, int bannerid);

  Future<Message> setShareClick(String accessCode, int doctorid);
}