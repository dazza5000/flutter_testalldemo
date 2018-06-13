import 'dart:async';
import 'package:lyc_clinic/ui/doctors/data/doctor.dart';
import 'package:lyc_clinic/ui/doctors/data/doctor_profile.dart';
import 'package:lyc_clinic/base/data/message.dart';

abstract class DoctorProfileRepository{
  Future<DoctorProfile> getDoctorProfile( String accessCode,int  doctorId);
  Future<Message> setFavorite(String accessCode, int doctorId);
  Future<Message> save(String accessCode,int  doctorId);
  Future<Message> cancelBooking(String accessCode, int doctorId, int bookingId);
  void deleteReview(String accessCode, int doctorID, int reviewid);
  Future<Message> setShareClick(String accessCode,int doctorid);
  void getComments(String accessCode, int doctorID,int perPage);
}