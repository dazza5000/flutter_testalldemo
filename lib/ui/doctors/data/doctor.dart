import 'package:lyc_clinic/ui/doctors/data/schedule.dart';
import 'package:json_annotation/json_annotation.dart';
part 'doctor.g.dart';

@JsonSerializable()
class Doctor extends Object with  _$DoctorSerializerMixin{
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

  Doctor.fromMap(Map<String, dynamic> map):
        id = map['id'],
        name = map['name'],
        image = map['image'],
        onDuty = map['onDuty'],
        role = map['role'],
        office = map['office'],
        degree=map['degree'],
        schedule = map['schedule'],
        fav = map['fav'],
        favCount = map['favCount'],
        share = map['share'],
        shareUrl = map['shareUrl'],
        save = map['save'],
        canReview = map['canReview'];

  @override
  String toString() {
    return '{id: $id, name: $name, image: $image, office: $office, onDuty: $onDuty, role: $role, degree: $degree, schedule: $schedule, fav: $fav, favCount: $favCount, share: $share, shareUrl: $shareUrl, save: $save, canReview: $canReview}';
  }


  factory Doctor.fromJson(Map<String, dynamic> json) => _$DoctorFromJson(json);
}