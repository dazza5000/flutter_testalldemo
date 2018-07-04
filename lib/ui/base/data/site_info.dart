import 'package:json_annotation/json_annotation.dart';
import 'package:lyc_clinic/ui/base/data/address.dart';

part 'site_info.g.dart';

@JsonSerializable()
class SiteInfo extends Object with  _$SiteInfoSerializerMixin{
  String logo;
  Address address;
  List<String> phone;
  String summery;


  SiteInfo(this.logo, this.address, this.phone, this.summery);

  SiteInfo.fromMap(Map<String, dynamic> map)
      : logo = map['logo'],
        address = map['address'],
        phone = map['phone'],
        summery = map['summery'];

  @override
  String toString() {
    return 'SiteInfo{logo: $logo, address: $address, phone: $phone, summery: $summery}';
  }

  factory SiteInfo.fromJson(Map<String, dynamic> json) => _$SiteInfoFromJson(json);

}
