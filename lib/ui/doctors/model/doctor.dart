import 'package:lyc_clinic/ui/doctors/model/schedule.dart';

class Doctor{
  int id;
  String name;
  String image;
  String office;
  bool onDuty;
  String role;
  String degree;
  List<Schedule> schedule;
  bool fav;
  int favCount;
  int share;
  String shareUrl;
  bool save;
  bool canReview;

  Doctor(this.id, this.name, this.image, this.office, this.onDuty, this.role,
      this.degree, this.schedule, this.fav, this.favCount, this.share,
      this.shareUrl, this.save, this.canReview);

}