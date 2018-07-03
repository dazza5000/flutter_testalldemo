// Copyright (c) 2017, the Dart project authors. Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProfileInfo _$ProfileInfoFromJson(Map<String, dynamic> json) {
  return new ProfileInfo(
      json['name'] as String,
      json['image'] as String,
      json['gender'] as int,
      json['phone'] as String,
      json['dob'] as String,
      json['location'] as String,
      json['locationId'] as int,
      json['subLocation'] as String,
      json['subLocationId'] as int);
}

abstract class _$ProfileInfoSerializerMixin {
  String get name;
  String get image;
  int get gender;
  String get phone;
  String get dob;
  String get location;
  int get locationId;
  String get subLocation;
  int get subLocationId;
  Map<String, dynamic> toJson() => <String, dynamic>{
        'name': name,
        'image': image,
        'gender': gender,
        'phone': phone,
        'dob': dob,
        'location': location,
        'locationId': locationId,
        'subLocation': subLocation,
        'subLocationId': subLocationId
      };
}
