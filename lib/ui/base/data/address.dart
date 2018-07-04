import 'package:json_annotation/json_annotation.dart';

part 'address.g.dart';

@JsonSerializable()
class Address extends Object with _$AddressSerializerMixin{
  String address;
  double lat;
  double lng;


  Address(this.address, this.lat, this.lng);

  Address.fromMap(Map<String, dynamic> map)
      : address = map['address'],
        lat = map['lat'],
        lng= map['lng'];

  factory Address.fromJson(Map<String, dynamic> json) => _$AddressFromJson(json);
}
