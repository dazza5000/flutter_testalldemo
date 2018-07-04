// Copyright (c) 2017, the Dart project authors. Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'site_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SiteInfo _$SiteInfoFromJson(Map<String, dynamic> json) {
  return new SiteInfo(
      json['logo'] as String,
      json['address'] == null
          ? null
          : new Address.fromJson(json['address'] as Map<String, dynamic>),
      (json['phone'] as List)?.map((e) => e as String)?.toList(),
      json['summery'] as String);
}

abstract class _$SiteInfoSerializerMixin {
  String get logo;
  Address get address;
  List<String> get phone;
  String get summery;
  Map<String, dynamic> toJson() => <String, dynamic>{
        'logo': logo,
        'address': address,
        'phone': phone,
        'summery': summery
      };
}
