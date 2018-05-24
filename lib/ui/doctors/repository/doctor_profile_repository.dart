import 'dart:async';
import 'package:lyc_clinic/ui/doctors/data/doctor.dart';
import 'package:lyc_clinic/ui/doctors/data/doctor_profile.dart';

abstract class DoctorProfileRepository{
  Future<DoctorProfile> getDoctorProfile( String accessCode,int  doctorId);
  void setFavorite(String accessCode, int doctorId);
  void save(String accessCode,int  doctorId);
  void cancelBooking(String accessCode, int doctorId, int bookingId);
  void deleteReview(String accessCode, int doctorID, int reviewid);
  void setShareClick(String accessCode,int doctorid);
  void getComments(String accessCode, int doctorID,int perPage);
}