import 'package:json_annotation/json_annotation.dart';

part 'profile_info.g.dart';

@JsonSerializable()
class ProfileInfo {
  String name;
  String image;
  int gender;
  String phone;
  String dob;
  String location;
  int locationId;
  String subLocation;
  int subLocationId;

  ProfileInfo([this.name, this.image, this.gender, this.phone, this.dob,
      this.location, this.locationId, this.subLocation, this.subLocationId]);

  //factory ProfileInfo.fromJson(Map<String, dynamic> json) => _$ProfileInfoFromJson(json);

  ProfileInfo.fromMap(Map<String, dynamic> map) :
        name = map['name'],
        image = map['image'],
        gender = map['gender'],
        phone = map['phone'],
        dob = map['dob'],
        location = map['location'],
        locationId = map['locationId'],
        subLocation = map['subLocation'],
        subLocationId = map['subLocationId'];

}
